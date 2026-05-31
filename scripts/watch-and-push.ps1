<#
.SYNOPSIS
    Polls the Obsidian vault for file changes, then auto-commits and pushes to GitHub.
.DESCRIPTION
    Periodically checks git status for changes. If changes persist beyond the
    debounce window (no new modifications), it stages all changes, commits with
    a timestamp, and pushes to the configured remote.
#>

param(
    [int]$PollIntervalSeconds = 15,
    [int]$DebounceSeconds = 30,
    [string]$RepoPath = "D:\File\Myobsidian",
    [string]$LogFile = ""
)

# Default log file path
if (-not $LogFile) {
    $LogFile = Join-Path $PSScriptRoot "watch-and-push.log"
}

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$timestamp] $Message"
    Write-Host $line
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
}

function Invoke-GitCommitAndPush {
    param([string]$RepoPath)
    try {
        Push-Location $RepoPath

        # Stage all changes (respects .gitignore)
        & git add -A 2>&1 | Out-Null

        # Check if there's anything to commit
        & git diff --cached --quiet 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Log "No changes to commit."
            return
        }

        # Commit
        $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $commitMsg = "vault auto-backup: $date"
        & git commit -m $commitMsg 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Log "ERROR: git commit failed."
            return
        }
        Write-Log "Committed: $commitMsg"

        # Push
        & git push origin master 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Log "Pushed to origin/master successfully."
        } else {
            Write-Log "WARNING: git push failed (network or remote issue). Will retry next cycle."
        }
    } catch {
        Write-Log "ERROR: $_"
    } finally {
        Pop-Location
    }
}

# ---- Main ----
Write-Log "============================================"
Write-Log "Watch-and-Push started (polling mode)"
Write-Log "Watching: $RepoPath"
Write-Log "Poll interval: ${PollIntervalSeconds}s"
Write-Log "Debounce: ${DebounceSeconds}s"
Write-Log "Log: $LogFile"
Write-Log "============================================"

$lastChangeSeen = [DateTime]::MinValue

while ($true) {
    Start-Sleep -Seconds $PollIntervalSeconds

    # Check the repo for changes
    Push-Location $RepoPath
    $porcelain = & git status --porcelain 2>&1
    Pop-Location

    if ($porcelain) {
        if ($lastChangeSeen -eq [DateTime]::MinValue) {
            # First detection: note the time
            $lastChangeSeen = Get-Date
            Write-Log "Changes detected. Waiting ${DebounceSeconds}s of stability..."
        } elseif ((Get-Date) - $lastChangeSeen -gt [TimeSpan]::FromSeconds($DebounceSeconds)) {
            # Changes have persisted beyond debounce — commit
            Write-Log "Debounce elapsed. Committing and pushing..."
            Invoke-GitCommitAndPush -RepoPath $RepoPath
            $lastChangeSeen = [DateTime]::MinValue
        }
        # else: still within debounce window, keep waiting
    } else {
        # No changes — check if we were waiting for debounce
        if ($lastChangeSeen -ne [DateTime]::MinValue) {
            $timeWaited = ((Get-Date) - $lastChangeSeen).TotalSeconds
            if ($timeWaited -ge $DebounceSeconds) {
                Write-Log "Debounce elapsed. Committing and pushing..."
                Invoke-GitCommitAndPush -RepoPath $RepoPath
            } else {
                Write-Log "Changes disappeared after ${timeWaited}s (debounce ${DebounceSeconds}s). No action."
            }
            $lastChangeSeen = [DateTime]::MinValue
        }
    }
}
