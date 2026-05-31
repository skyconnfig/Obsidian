# 最佳实现coursorules

```plain
- 框架类的mdc开源库
https://github.com/sanjeed5/awesome-cursor-rules-mdc/tree/main/rules-mdc
- common.mdc
---
description: 
globs: 
alwaysApply: true
---
全局代码规范
- 始终优先选择简单方案 
- 尽可能避免代码重复
  • 修改代码前，检查代码库中是否已存在相似功能或逻辑。
- 编写代码时需区分不同环境
  • 明确区分开发环境（dev）、测试环境（test）和生产环境（prod）。
- 谨慎修改代码
  • 仅针对明确需求进行更改，或确保修改内容与需求强相关且已被充分理解。
- 修复问题时避免引入新技术/模式
  • 优先彻底排查现有实现的可能性，若必须引入新方案，需同步移除旧逻辑以避免冗余。
- 保持代码库整洁有序
- 避免在文件中编写脚本
  • 尤其是仅需运行一次的脚本（如数据迁移临时脚本）。
- 控制单文件代码行数
  • 文件代码超过 200-300行 时需重构封装。
- 仅测试环境使用模拟数据
  • 开发与生产环境严禁使用模拟（Mock）数据。

- 禁止覆盖 .env 文件
  • 修改前需确认并征得同意。

- code-work.mdc
当你初始化项目时：
- Python flask 框架作为后端, 放到 back_end目录
- vue3 前端 ，放到front-end目录
- SqlLite 用于数据存储，dev环境链接地址本地
- Python 要做测试用例
当你修改代码时：
- 专注任务相关的代码区域
- 不触碰与任务无关的代码
- 为所有主要功能编写全面测试
- 在功能运行良好后，避免对其模式和架构进行重大更改（除非明确要求）​
- 始终考虑代码变更可能影响的其他方法和代码区域
- git-auto-commit.mdc
---
description: Git Auto Commit Rule
globs: 
alwaysApply: false
---
Description
This rule ensures that after Cursor IDE automatically performs changes from Git commits, the modified files are automatically committed back to Git using the conventional commit format. This maintains a clear and consistent commit history that explains what changes were made and why.

Rule
After Cursor IDE performs automatic changes:
1. All modified files MUST be automatically committed
2. Commit messages MUST follow the conventional commit format
3. Commit messages MUST include:
  - Type: The type of change (feat, fix, docs, style, refactor, test, chore)
  - Scope: The affected component or area (optional)
  - Description: A clear explanation of what changed
  - Body: Detailed explanation of why the changes were made
4. The commit message MUST reference the original prompts used to generate the changes

Implementation
- The Cursor IDE will:
  - Track all files modified by automatic changes
  - Generate a conventional commit message based on the changes
  - Include the original prompts in the commit body
  - Automatically execute the git commit command
  - Handle any potential merge conflicts or errors

Benefits
- Maintains clear and consistent commit history
- Provides traceability between prompts and code changes
- Follows industry-standard commit conventions
- Automates the commit process for better workflow efficiency

Examples
✅ Correct Commit Message:

❌ Incorrect Commit Message:

Conventional Commit Types
- feat: New feature
- fix: Bug fix
- docs: Documentation changes
- style: Code style changes (formatting, etc.)
- refactor: Code refactoring
- test: Adding or modifying tests
- chore: Maintenance tasks 
- git.mdc
---
description: This rule outlines best practices for effective use of Git, including code organization, commit strategies, branching models, and collaborative workflows.
globs: */.git/
---
- Commit Strategies:
  - Atomic Commits: Keep commits small and focused. Each commit should address a single, logical change. This makes it easier to understand the history and revert changes if needed.
  - Descriptive Commit Messages: Write clear, concise, and informative commit messages. Explain the why behind the change, not just what was changed. Use a consistent format (e.g., imperative mood: "Fix bug", "Add feature").
- Commit Frequently: Commit early and often. This helps avoid losing work and makes it easier to track progress.
- Avoid Committing Broken Code: Ensure your code compiles and passes basic tests before committing.
- Sign Your Commits (Optional but Recommended): Use GPG signing to verify the authenticity of your commits.

- Branching Model:
  - Use Feature Branches: Create branches for each new feature or bug fix. This isolates changes and allows for easier code review.
  - Gitflow or Similar: Consider adopting a branching model like Gitflow for managing releases, hotfixes, and feature development.
  - Short-Lived Branches: Keep branches short-lived. The longer a branch exists, the harder it becomes to merge.
  - Regularly Rebase or Merge: Keep your feature branches up-to-date with the main branch (e.g., main, develop) by rebasing or merging regularly.
  - Avoid Direct Commits to Main Branch:  Protect your main branch from direct commits.  Use pull requests for all changes.

- Code Organization:
  - Consistent Formatting:  Use a consistent coding style guide (e.g., PEP 8 for Python, Google Style Guide for other languages) and enforce it with linters and formatters (e.g., flake8, pylint, prettier).
  - Modular Code: Break down your codebase into smaller, manageable modules or components. This improves readability, maintainability, and testability.
  - Well-Defined Interfaces:  Define clear interfaces between modules and components to promote loose coupling.
  - Avoid Global State: Minimize the use of global variables and state to reduce complexity and potential conflicts.
  - Documentation: Document your code with comments and docstrings. Explain the purpose of functions, classes, and modules.

- Collaboration and Code Review:
  - Pull Requests: Use pull requests for all code changes. This provides an opportunity for code review and discussion.
  - Code Review Checklist: Create a code review checklist to ensure consistency and thoroughness.
  - Constructive Feedback: Provide constructive feedback during code reviews. Focus on improving the code, not criticizing the author.
  - Address Feedback: Respond to and address feedback from code reviews promptly.
  - Pair Programming: Consider pair programming for complex or critical tasks.

- Ignoring Files and Directories:
  - .gitignore: Use a .gitignore file to exclude files and directories that should not be tracked by Git (e.g., build artifacts, temporary files, secrets).
  - Global .gitignore: Configure a global .gitignore file to exclude files that you never want to track in any Git repository.

- Handling Secrets and Sensitive Information:
  - Never Commit Secrets: Never commit secrets, passwords, API keys, or other sensitive information to your Git repository.
  - Environment Variables: Store secrets in environment variables and access them at runtime.
  - Secret Management Tools: Use secret management tools like HashiCorp Vault or AWS Secrets Manager to store and manage secrets securely.
  - git-secret or similar: If secrets must exist in the repo (strongly discouraged), encrypt them.

- Submodules and Subtrees:
  - Use Sparingly: Use Git submodules and subtrees sparingly, as they can add complexity.
  - Understand the Implications: Understand the implications of using submodules and subtrees before adopting them.
  - Consider Alternatives: Consider alternatives to submodules and subtrees, such as package managers or build systems.

- Large File Storage (LFS):
  - Use for Large Files: Use Git LFS for storing large files (e.g., images, videos, audio files).  This prevents your repository from becoming bloated.
  - Configure LFS: Configure Git LFS properly to track the large files in your repository.

- Reverting and Resetting:
  - Understand the Differences: Understand the differences between git revert, git reset, and git checkout before using them.
  - Use with Caution: Use git reset and git checkout with caution, as they can potentially lose data.
  - Revert Public Commits: Use git revert to undo changes that have already been pushed to a public repository. This creates a new commit that reverses the changes.

- Tagging Releases:
  - Create Tags: Create tags to mark significant releases or milestones.
  - Semantic Versioning: Follow semantic versioning (SemVer) when tagging releases.
  - Annotated Tags: Use annotated tags to provide additional information about the release.

- Dealing with Merge Conflicts:
  - Understand the Conflict: Understand the source of the merge conflict before attempting to resolve it.
  - Communicate with Others: Communicate with other developers who may be affected by the conflict.
  - Use a Merge Tool: Use a merge tool to help resolve the conflict.
  - Test After Resolving: Test your code thoroughly after resolving the conflict.

- Repository Maintenance:
  - Regularly Clean Up: Regularly clean up your Git repository by removing unused branches and tags.
  - Optimize the Repository: Optimize the repository with git gc to improve performance.

- CI/CD Integration:
  - Automate Testing: Integrate Git with a CI/CD system to automate testing and deployment.
  - Run Tests on Every Commit: Run tests on every commit to ensure code quality.

- Common Pitfalls and Gotchas:
  - Accidental Commits: Accidentally committing sensitive information or large files.
  - Merge Conflicts: Difficulty resolving merge conflicts.
  - Losing Work: Losing work due to incorrect use of git reset or git checkout.
  - Ignoring .gitignore: Forgetting to add files to .gitignore.

- Tooling and Environment:
  - Git Clients: Use a Git client that suits your needs (e.g., command line, GUI).
  - IDE Integration: Use Git integration in your IDE to streamline workflows.
  - Online Repositories: Use a reliable online Git repository hosting service (e.g., GitHub, GitLab, Bitbucket).
- pytest.mdc
---
description: This rule file outlines comprehensive best practices for using pytest in Python projects, covering code organization, testing strategies, performance optimization, security measures, and common pitfalls to avoid.
globs: **/*.py
---
Pytest Best Practices: A Comprehensive Guide

This document provides a detailed guide to using pytest effectively in Python projects, covering various aspects from code organization to security considerations. It aims to provide actionable guidance for developers to improve their testing practices and build robust applications.

Library Information:
- Name: pytest
- Tags: development, testing, python

1. Code Organization and Structure

A well-organized codebase is crucial for maintainability and testability. Here are best practices for structuring your pytest projects:

1.1. Directory Structure

- Separate tests/** directory:** Keep your tests in a directory separate from your application code, typically named tests/. This promotes isolation and cleaner project structure.

  my_project/
  ├── my_app/
  │   ├── __init__.py
  │   ├── module1.py
  │   └── module2.py
  ├── tests/
  │   ├── __init__.py
  │   ├── test_module1.py
  │   └── test_module2.py
  └── pyproject.toml
  

- src** layout (Recommended):** Consider using a src layout to further isolate application code from the project root. This prevents import conflicts and improves clarity.

  my_project/
  ├── src/
  │   └── my_app/
  │       ├── __init__.py
  │       ├── module1.py
  │       └── module2.py
  ├── tests/
  │   ├── __init__.py
  │   ├── test_module1.py
  │   └── test_module2.py
  └── pyproject.toml
  

1.2. File Naming Conventions

- test_*.py** or *****_test.py****:** pytest automatically discovers test files matching these patterns.
- Descriptive names: Use clear and descriptive names for your test files to indicate what they are testing (e.g., test_user_authentication.py).

1.3. Module Organization

- Mirror application structure: Structure your test modules to mirror the structure of your application code. This makes it easier to locate tests for specific modules.
- __init__.py**:** Include __init__.py files in your test directories to ensure they are treated as Python packages.

1.4. Component Architecture

- Isolate components: Design your application with well-defined components that can be tested independently.
- Dependency injection: Use dependency injection to provide components with their dependencies, making it easier to mock and stub external resources during testing.

1.5. Code Splitting

- Small, focused functions: Break down large functions into smaller, focused functions that are easier to test.
- Modular design: Organize your code into modules with clear responsibilities.

2. Common Patterns and Anti-patterns

2.1. Design Patterns

- Arrange-Act-Assert (AAA): Structure your tests following the AAA pattern for clarity.
  - Arrange: Set up the test environment and prepare any necessary data.
  - Act: Execute the code being tested.
  - Assert: Verify that the code behaved as expected.

  python
  def test_example():
      # Arrange
      data = ...
      expected_result = ...

      # Act
      result = function_under_test(data)

      # Assert
      assert result == expected_result
  

- Fixture factory: Use fixture factories to create reusable test data.

  python
  import pytest

  @pytest.fixture
  def user_factory():
      def create_user(username, email):
          return {"username": username, "email": email}
      return create_user

  def test_create_user(user_factory):
      user = user_factory("testuser", "test@example.com")
      assert user["username"] == "testuser"
  

2.2. Recommended Approaches

- Use fixtures for setup and teardown: Fixtures help manage test dependencies and ensure a clean test environment.
- Parameterize tests: Use @pytest.mark.parametrize to run the same test with different inputs and expected outputs, reducing code duplication.
- Use descriptive names for tests and fixtures: This makes it easier to understand the purpose of each test and fixture.
- Single Assertion per Test: A single assertion per test makes it easier to identify the specific failure point.

2.3. Anti-patterns and Code Smells

- Over-reliance on fixtures: Avoid creating too many fixtures, especially for simple data.  Use direct data definition in the test if it's not reused.
- Implicit dependencies: Make dependencies explicit by passing them as arguments to your functions and tests.
- Testing implementation details: Focus on testing the behavior of your code, not the implementation details.  This makes your tests more resilient to refactoring.
- Skipping Tests Without a Reason: Don't skip tests without a valid reason or comment explaining why.

2.4. State Management

- Stateless tests: Ensure your tests are stateless and independent to avoid unexpected side effects. Each test should set up its own data and clean up after itself.
- Fixture scopes: Use fixture scopes (session, module, function) to control the lifecycle of fixtures and manage state effectively.

2.5. Error Handling

- Test exception handling: Write tests to verify that your code handles exceptions correctly.

  python
  import pytest

  def divide(a, b):
      if b == 0:
          raise ValueError("Cannot divide by zero")
      return a / b

  def test_divide_by_zero():
      with pytest.raises(ValueError) as e:
          divide(10, 0)
      assert str(e.value) == "Cannot divide by zero"
  

- Use **pytest.raises****:** Use pytest.raises to assert that a specific exception is raised.
- Log errors: Ensure your application logs errors appropriately, and consider writing tests to verify that errors are logged correctly.

3. Performance Considerations

3.1. Optimization Techniques

- Profile slow tests: Use the --durations option to identify slow tests and optimize them.
- Parallel test execution: Use pytest-xdist to run tests in parallel and reduce overall test execution time. pip install pytest-xdist then run pytest -n auto.  The auto option utilizes all available CPU cores.
- Caching: Cache expensive computations to avoid redundant calculations during testing.

3.2. Memory Management

- Resource cleanup: Ensure your tests clean up any resources they allocate, such as temporary files or database connections.
- Limit fixture scope: Use the appropriate fixture scope to minimize the lifetime of fixtures and reduce memory consumption.

3.3. Bundle Size Optimization

- N/A: Pytest itself doesn't directly impact bundle sizes, but your application code should be optimized separately.

3.4. Lazy Loading

- N/A: Lazy loading is more relevant to application code than pytest itself, but can be used within fixtures if necessary to defer initialization.

4. Security Best Practices

4.1. Common Vulnerabilities

- Injection attacks: Prevent injection attacks by validating and sanitizing user inputs.
- Cross-site scripting (XSS): Protect against XSS vulnerabilities by escaping user-generated content.
- Authentication and authorization flaws: Implement secure authentication and authorization mechanisms to protect sensitive data.

4.2. Input Validation

- Validate all inputs: Validate all user inputs to ensure they conform to expected formats and ranges.
- Use parameterized tests: Use parameterized tests to test input validation logic with a variety of inputs, including edge cases and invalid values.

4.3. Authentication and Authorization

- Test authentication: Write tests to verify that your authentication mechanisms are working correctly.
- Test authorization: Write tests to verify that users only have access to the resources they are authorized to access.

4.4. Data Protection

- Encrypt sensitive data: Encrypt sensitive data at rest and in transit.
- Use secure storage: Store sensitive data in secure storage locations with appropriate access controls.

4.5. Secure API Communication

- Use HTTPS: Always use HTTPS for API communication to protect data in transit.
- Validate API responses: Validate API responses to ensure they are valid and haven't been tampered with.

5. Testing Approaches

5.1. Unit Testing

- Test individual units: Unit tests should focus on testing individual functions, methods, or classes in isolation.
- Mock dependencies: Use mocking to isolate units under test from their dependencies.

5.2. Integration Testing

- Test interactions: Integration tests should focus on testing the interactions between different components of your application.
- Use real dependencies (where appropriate): For integration tests, it's often appropriate to use real dependencies, such as databases or external APIs, to ensure that the different components work together correctly.  Consider using test containers for database and service dependencies.

5.3. End-to-End Testing

- Test complete workflows: End-to-end tests should focus on testing complete user workflows, from start to finish.
- Use browser automation: Use browser automation tools like Selenium or Playwright to simulate user interactions with your application.

5.4. Test Organization

- Organize tests by feature: Group tests by the feature they are testing to improve organization and maintainability.
- Use clear naming conventions: Use clear naming conventions for your tests and test files to indicate what they are testing.

5.5. Mocking and Stubbing

- Use mocker** fixture:** Use the mocker fixture provided by the pytest-mock plugin for mocking and stubbing.
- Mock external dependencies: Mock external dependencies, such as databases or APIs, to isolate your tests and prevent them from relying on external resources.
- Use **autospec=True****:** Use autospec=True when mocking to ensure that your mocks have the same API as the original objects. This helps prevent errors caused by incorrect mock implementations.

  python
  def test_example(mocker):
      mock_external_api = mocker.patch("module.external_api", autospec=True)
      mock_external_api.return_value = {"data": "test data"}
  

6. Common Pitfalls and Gotchas

6.1. Frequent Mistakes

- Not isolating tests: Failing to isolate tests can lead to unpredictable results and make it difficult to debug failures.
- Testing implementation details: Testing implementation details makes your tests brittle and difficult to maintain.
- Ignoring warnings: Ignoring warnings from pytest can mask underlying problems in your tests.

6.2. Edge Cases

- Empty inputs: Test your code with empty inputs to ensure it handles them gracefully.
- Invalid inputs: Test your code with invalid inputs to ensure it handles them correctly and raises appropriate exceptions.
- Boundary conditions: Test your code with boundary conditions to ensure it handles them correctly.

6.3. Version-Specific Issues

- Check release notes: Check the release notes for each new version of pytest to be aware of any breaking changes or new features.
- Pin dependencies: Pin your pytest dependency to a specific version to avoid unexpected behavior caused by updates.

6.4. Compatibility Concerns

- Check compatibility: Check the compatibility of pytest with other technologies you are using, such as specific versions of Python or Django.

6.5. Debugging Strategies

- Use **--pdb****:** Use the --pdb option to drop into the Python debugger when a test fails.
- Use logging: Use logging to add debugging information to your tests.
- Simplify tests: Simplify failing tests to isolate the cause of the failure.

7. Tooling and Environment

7.1. Recommended Development Tools

- IDE: Use a good IDE with pytest support, such as VS Code with the Python extension, PyCharm, or Sublime Text with the appropriate plugins.
- pytest-watch: Use pytest-watch for automatic test rerunning on file changes. pip install pytest-watch, then run ptw.

7.2. Build Configuration

- Use **pyproject.toml****:** Use a pyproject.toml file to configure your pytest settings.

  toml
  [tool.pytest.ini_options]
  addopts = [
      "--cov=my_app",
      "--cov-report term-missing",
      "-v",
  ]
  testpaths = [
      "tests",
  ]
  

7.3. Linting and Formatting

- Use **flake8-pytest-style****:** Use the flake8-pytest-style plugin to enforce pytest-specific coding standards.  pip install flake8 flake8-pytest-style
- Use black** or ****autopep8****:** Use a code formatter like black or autopep8 to ensure consistent code formatting.  pip install black, then run black .

7.4. Deployment

- Include tests in your deployment pipeline: Ensure your tests are run as part of your deployment pipeline to prevent regressions.
- Use a dedicated test environment: Use a dedicated test environment to avoid interfering with your production environment.

7.5. CI/CD Integration

- Integrate with CI/CD: Integrate pytest with your CI/CD system, such as GitHub Actions, GitLab CI, or Jenkins, to automatically run your tests on every commit.

  Example GitHub Actions workflow (.github/workflows/test.yml):

  name: Test
  on:
    push:
      branches: [ main ]
    pull_request:
      branches: [ main ]
  jobs:
    build:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        - name: Set up Python 3.10
          uses: actions/setup-python@v3
          with:
            python-version: "3.10"
        - name: Install dependencies
          run: |
            python -m pip install --upgrade pip
            pip install pytest pytest-cov flake8 flake8-pytest-style black
            pip install -e .  # Install your project in editable mode
        - name: Lint with flake8
          run: |
            flake8 .
        - name: Test with pytest
          run: |
            pytest --cov --cov-report xml
        - name: Upload coverage to Codecov
          uses: codecov/codecov-action@v3
          with:
            token: ${{ secrets.CODECOV_TOKEN }}
            flags: unittests
            env_vars: OS,PYTHON
            name: codecov-pytest
  

By following these best practices, you can write effective and maintainable tests with pytest, improving the quality and reliability of your Python applications.
- vue3.mdc
---
description: This rule provides best practices and coding standards for Vue 3 projects, covering code organization, performance, security, testing, tooling, and common pitfalls to ensure maintainable and efficient applications. It aims to guide developers in writing high-quality Vue 3 code.
globs: **/*.vue
---
- Code Organization and Structure:
  - Directory Structure: Adopt a feature-based directory structure. Group related files (components, stores, utilities) within feature-specific directories rather than separating by file type. This enhances maintainability and discoverability.
    - Example:
    - 
    src/
      components/
        MyComponent.vue
        ...
      views/
        MyView.vue
        ...
      features/
        user-profile/
          components/
            UserProfileCard.vue
          composables/
            useUserProfileData.js
          store/
            userProfile.js
        ...
    - 
  - File Naming Conventions: Use PascalCase for component file names (e.g., MyComponent.vue). Use camelCase for variable and function names (e.g., myVariable, myFunction). Use kebab-case for component selectors in templates (e.g., <my-component>).
  - Module Organization: Utilize ES modules (import/export) for modularity and code reusability. Group related functions and components into modules.
  - Component Architecture: Favor a component-based architecture. Design components to be small, reusable, and composable. Use props for data input and events for data output. Consider using a component library (e.g., Vuetify, Element Plus) for pre-built components.
  - Code Splitting Strategies: Implement lazy loading for components and routes to reduce initial bundle size. Use dynamic imports for on-demand loading of modules.
    - Example:
    javascript
    // Route-based code splitting
    const routes = [
      {
        path: '/about',
        component: () => import('./views/About.vue')
      }
    ]
    - 

- Common Patterns and Anti-patterns:
  - Design Patterns: Apply common design patterns such as composition API, provider/inject, and observer pattern where applicable.
    - Composition API: Organize component logic into composable functions for reusability and maintainability.
    - Provider/Inject: Use provide and inject to share data between components without prop drilling.
  - Recommended Approaches: Utilize v-model for two-way data binding, computed properties for derived state, and watchers for side effects. Use the Composition API for enhanced code organization and reusability.
  - Anti-patterns and Code Smells: Avoid directly mutating props. Avoid excessive use of global variables. Avoid complex logic within templates. Avoid tight coupling between components. Avoid over-engineering solutions.
  - State Management: Choose a state management solution (e.g., Vuex, Pinia) for complex applications.  Favor Pinia for Vue 3 due to its simpler API and improved TypeScript support. Decouple components from state management logic using actions and mutations.
  - Error Handling: Implement global error handling using app.config.errorHandler. Use try...catch blocks for handling synchronous errors. Utilize Promise.catch for handling asynchronous errors. Provide user-friendly error messages.
    - Example:
    javascript
    // Global error handler
    app.config.errorHandler = (err, vm, info) => {
      console.error('Global error:', err, info);
      // Report error to server or display user-friendly message
    }
    - 

- Performance Considerations:
  - Optimization Techniques: Use v-once for static content. Use v-memo to memoize parts of the template. Use key attribute for v-for loops to improve rendering performance.
  - Memory Management: Avoid creating memory leaks by properly cleaning up event listeners and timers. Use onBeforeUnmount lifecycle hook to release resources.
  - Rendering Optimization: Use virtual DOM efficiently. Minimize unnecessary re-renders by using ref and reactive appropriately. Use shouldUpdate hook in functional components to control updates.
  - Bundle Size Optimization: Use code splitting, tree shaking, and minification to reduce bundle size. Remove unused dependencies. Use smaller alternative libraries where possible.
  - Lazy Loading: Implement lazy loading for images, components, and routes. Use IntersectionObserver API for lazy loading images.

- Security Best Practices:
  - Common Vulnerabilities: Prevent Cross-Site Scripting (XSS) attacks by sanitizing user input. Prevent Cross-Site Request Forgery (CSRF) attacks by using CSRF tokens. Prevent SQL injection attacks by using parameterized queries.
  - Input Validation: Validate user input on both client-side and server-side. Use appropriate data types and formats. Escape special characters.
  - Authentication and Authorization: Implement secure authentication and authorization mechanisms. Use HTTPS to encrypt communication. Store passwords securely using hashing and salting.
  - Data Protection: Protect sensitive data using encryption. Avoid storing sensitive data in client-side storage. Follow privacy best practices.
  - Secure API Communication: Use HTTPS for API communication. Validate API responses. Implement rate limiting to prevent abuse.

- Testing Approaches:
  - Unit Testing: Write unit tests for individual components, functions, and modules. Use Jest or Vitest as a test runner. Mock dependencies to isolate units of code.
  - Integration Testing: Write integration tests to verify the interaction between components and modules. Use Vue Test Utils for component testing.
  - End-to-End Testing: Write end-to-end tests to simulate user interactions and verify the application's overall functionality. Use Cypress or Playwright for end-to-end testing.
  - Test Organization: Organize tests into separate directories based on the component or module being tested. Use descriptive test names.
  - Mocking and Stubbing: Use mocks and stubs to isolate units of code and simulate dependencies. Use jest.mock or vi.mock for mocking modules.

- Common Pitfalls and Gotchas:
  - Frequent Mistakes: Forgetting to register components. Incorrectly using v-if and v-show. Mutating props directly. Not handling asynchronous operations correctly. Ignoring error messages.
  - Edge Cases: Handling empty arrays or objects. Dealing with browser compatibility issues. Managing state in complex components.
  - Version-Specific Issues: Being aware of breaking changes between Vue 2 and Vue 3. Using deprecated APIs.
  - Compatibility Concerns: Ensuring compatibility with different browsers and devices. Testing on different screen sizes and resolutions.
  - Debugging Strategies: Using Vue Devtools for debugging. Using console.log statements for inspecting variables. Using a debugger for stepping through code.

- Tooling and Environment:
  - Recommended Development Tools: Use VS Code with the Volar extension for Vue 3 development. Use Vue CLI or Vite for project scaffolding. Use Vue Devtools for debugging.
  - Build Configuration: Configure Webpack or Rollup for building the application. Optimize build settings for production. Use environment variables for configuration.
  - Linting and Formatting: Use ESLint with the eslint-plugin-vue plugin for linting Vue code. Use Prettier for code formatting. Configure linting and formatting rules to enforce code style.
  - Deployment Best Practices: Use a CDN for serving static assets. Use server-side rendering (SSR) or pre-rendering for improved SEO and performance. Deploy to a reliable hosting platform.
  - CI/CD Integration: Integrate linting, testing, and building into the CI/CD pipeline. Use automated deployment tools. Monitor application performance and errors.

- Additional Best Practices: 
  - Accessibility (A11y): Ensure components are accessible by using semantic HTML, providing ARIA attributes where necessary, and testing with screen readers. 
  - Internationalization (i18n): Implement i18n from the start if multilingual support is required. Use a library like vue-i18n to manage translations. 
  - Documentation: Document components and composables using JSDoc or similar tools. Generate documentation automatically using tools like Storybook. 

- Vue 3 Specific Recommendations:
  - TypeScript: Use TypeScript for improved type safety and code maintainability. Define component props and emits with type annotations.
  - Teleport: Use the Teleport component to render content outside the component's DOM hierarchy, useful for modals and tooltips.
  - Suspense: Use the Suspense component to handle asynchronous dependencies gracefully, providing fallback content while waiting for data to load.

- Naming Conventions:
  - Components: PascalCase (e.g., MyComponent.vue)
  - Variables/Functions: camelCase (e.g., myVariable, myFunction)
  - Props/Events: camelCase (e.g., myProp, myEvent)
  - Directives: kebab-case (e.g., v-my-directive)

- Composition API Best Practices:
  - Reactive Refs: Use ref for primitive values and reactive for objects. 
  - Readonly Refs: Use readonly to prevent accidental mutations of reactive data.
  - Computed Properties: Use computed for derived state and avoid complex logic within templates.
  - Lifecycle Hooks: Use onMounted, onUpdated, onUnmounted, etc., to manage component lifecycle events.
  - Watchers: Use watch for reacting to reactive data changes and performing side effects.
- flask.mdc
---
description: This rule provides comprehensive best practices for developing Flask applications, covering code structure, security, performance, and testing.
globs: **/*.py
---
Code Organization and Structure:
  - Directory Structure Best Practices:
    - Follow a modular and organized project structure. A common structure is:
    - 
    project_root/
    ├── app/
    │   ├── __init__.py
    │   ├── models.py
    │   ├── views.py  # Or controllers.py
    │   ├── forms.py
    │   ├── utils.py # Helper functions
    │   ├── api/
    │   │   ├── __init__.py
    │   │   ├── routes.py
    │   ├── templates/
    │   │   └── ...
    │   ├── static/
    │   │   └── ...
    ├── tests/
    │   ├── __init__.py
    │   ├── conftest.py # Fixtures for tests
    │   ├── test_models.py
    │   ├── test_views.py
    ├── migrations/
    │   └── ... # Alembic migrations
    ├── venv/ # Virtual environment
    ├── .env    # Environment variables (use with caution, not for sensitive data in production)
    ├── config.py # Application configuration
    ├── requirements.txt or pyproject.toml # Dependencies
    ├── run.py      # Application entry point
    - 
    - Use Blueprints to organize routes and views into logical modules. Blueprints promote reusability and maintainability.
  - File Naming Conventions:
    - Use descriptive and consistent file names.
    - Examples: models.py, views.py, forms.py, utils.py, routes.py, test_*.py.
    - Maintain consistency throughout the project.
  - Module Organization:
    - Group related functionality into modules. For instance, database models in models.py, user authentication logic in auth.py, and utility functions in utils.py.
    - Use __init__.py files to make directories packages, allowing you to import modules within the directory using relative paths.
  - Component Architecture:
    - Design components with clear responsibilities and interfaces.
    - Consider using a layered architecture (e.g., presentation, business logic, data access) to separate concerns.
    - Use dependency injection to decouple components.
  - Code Splitting Strategies:
    - Decompose large modules into smaller, more manageable files.
    - Extract reusable code into separate modules or packages.
    - Employ lazy loading for modules that are not immediately needed.

Common Patterns and Anti-patterns:
  - Design Patterns Specific to Flask:
    - Application Factory: Use the application factory pattern to create Flask application instances. This allows for different configurations for different environments (development, testing, production).
    python
    def create_app(config_name):
        app = Flask(__name__)
        app.config.from_object(config[config_name])
        config[config_name].init_app(app)

          # Initialize extensions (e.g., db, mail) here
          db.init_app(app)
          mail.init_app(app)

          # Register blueprints
          from .main import main as main_blueprint
          app.register_blueprint(main_blueprint)

          return app
    - Blueprints: Organize application functionality into reusable blueprints.
      python
      from flask import Blueprint

      bp = Blueprint('my_blueprint', __name__, url_prefix='/my_blueprint')

      @bp.route('/route')
      def my_route():
          return 'Hello from my_blueprint'
      
- Recommended Approaches for Common Tasks:
  - Database Interactions: Use Flask-SQLAlchemy or another ORM for database interactions. Define models to represent database tables.
  - Form Handling: Use Flask-WTF for form handling. This provides CSRF protection and simplifies form validation.
  - Authentication: Use Flask-Login for user authentication. It provides utilities for managing user sessions and protecting routes.
  - API Development: Use Flask-RESTful or Flask-API for building RESTful APIs. Consider using Marshmallow for serializing and deserializing data.
- Anti-patterns and Code Smells to Avoid:
  - Global State: Avoid using global variables to store application state. Use the g object or session variables instead.
  - Tight Coupling: Design components with loose coupling to improve maintainability and testability.
  - Fat Models/Views: Keep models and views focused on their primary responsibilities. Move complex business logic to separate modules.
  - Hardcoding Configuration: Avoid hardcoding configuration values. Use environment variables or a configuration file.
- State Management Best Practices:
  - Use the Flask session object to store user-specific data across requests.
  - For application-wide state, consider using a database or a caching mechanism.
  - Avoid storing sensitive data in the session without proper encryption.
- Error Handling Patterns:
  - Use try...except blocks to handle exceptions gracefully.
  - Implement custom error handlers for specific exceptions. Return appropriate HTTP status codes and error messages.
  - Use logging to record errors and warnings.
  - Use Flask's abort() function to raise HTTP exceptions.

Performance Considerations:
  - Optimization Techniques:
    - Caching: Implement caching to reduce database queries and improve response times. Use Flask-Caching or Redis.
    - Database Optimization: Optimize database queries and use indexes to improve performance.
    - Profiling: Use a profiler to identify performance bottlenecks in your code.
  - Memory Management:
    - Avoid memory leaks by properly closing database connections and releasing resources.
    - Use generators to process large datasets efficiently.
  - Rendering Optimization:
    - Minimize the number of database queries in templates.
    - Use template caching to reduce rendering time.
  - Bundle Size Optimization:
    - For larger front-end applications, use a bundler like Webpack or Parcel to optimize JavaScript and CSS files. Minify and compress assets.
  - Lazy Loading Strategies:
    - Implement lazy loading for images and other assets to improve initial page load time.
    - Use code splitting to load only the necessary JavaScript code for each page.

Security Best Practices:
  - Common Vulnerabilities and How to Prevent Them:
    - Cross-Site Scripting (XSS): Prevent XSS by escaping user input in templates. Use Jinja2's autoescaping feature.
    - SQL Injection: Prevent SQL injection by using parameterized queries or an ORM.
    - Cross-Site Request Forgery (CSRF): Protect against CSRF attacks by using Flask-WTF, which provides CSRF protection.
    - Authentication and Authorization Issues: Implement secure authentication and authorization mechanisms. Use strong passwords and protect user credentials.
  - Input Validation:
    - Validate all user input to prevent malicious data from entering your application.
    - Use Flask-WTF for form validation.
  - Authentication and Authorization Patterns:
    - Use Flask-Login for user authentication.
    - Implement role-based access control (RBAC) to restrict access to certain resources.
    - Use JWT (JSON Web Tokens) for API authentication.
  - Data Protection Strategies:
    - Encrypt sensitive data at rest and in transit.
    - Use HTTPS to secure communication between the client and the server.
    - Store passwords securely using a strong hashing algorithm (e.g., bcrypt).
  - Secure API Communication:
    - Use HTTPS for all API communication.
    - Implement authentication and authorization for API endpoints.
    - Validate API requests and responses.
    - Use rate limiting to prevent abuse.

Testing Approaches:
  - Unit Testing Strategies:
    - Write unit tests to verify the functionality of individual components.
    - Use pytest or unittest for writing and running tests.
    - Mock external dependencies to isolate components during testing.
  - Integration Testing:
    - Write integration tests to verify the interaction between different components.
    - Test the integration between the application and the database.
  - End-to-End Testing:
    - Write end-to-end tests to simulate user interactions with the application.
    - Use Selenium or Cypress for end-to-end testing.
  - Test Organization:
    - Organize tests into separate directories based on functionality.
    - Use descriptive test names.
    - Follow the Arrange-Act-Assert pattern in your tests.
  - Mocking and Stubbing:
    - Use mocking and stubbing to isolate components during testing.
    - Use the unittest.mock module or a third-party mocking library like mock.

Common Pitfalls and Gotchas:
  - Frequent Mistakes Developers Make:
    - Not using a virtual environment: Always use a virtual environment to isolate project dependencies.
    - Not handling exceptions properly: Handle exceptions gracefully to prevent application crashes.
    - Exposing sensitive data: Avoid exposing sensitive data in logs or error messages.
  - Edge Cases to Be Aware Of:
    - Handling Unicode correctly: Be aware of Unicode encoding issues when working with text data.
    - Dealing with time zones: Use a consistent time zone throughout the application.
  - Version-Specific Issues:
    - Be aware of compatibility issues when upgrading Flask or its dependencies.
    - Consult the Flask documentation for version-specific information.
  - Compatibility Concerns:
    - Ensure that your application is compatible with different browsers and operating systems.
    - Test your application on different devices.
  - Debugging Strategies:
    - Use the Flask debugger to identify and fix errors.
    - Use logging to record errors and warnings.
    - Use a profiler to identify performance bottlenecks.

Tooling and Environment:
  - Recommended Development Tools:
    - Virtual Environment Manager: virtualenv, venv, or conda
    - Package Manager: pip or pipenv or poetry
    - IDE/Text Editor: VS Code, PyCharm, Sublime Text
    - Debugger: pdb or ipdb
    - Profiler: cProfile
  - Build Configuration:
    - Use a requirements.txt or pyproject.toml file to specify project dependencies.
    - Use a build system like setuptools or poetry to package your application.
  - Linting and Formatting:
    - Use a linter like flake8 or pylint to enforce code style guidelines.
    - Use a formatter like black or autopep8 to automatically format your code.
  - Deployment Best Practices:
    - Use a production-ready WSGI server like Gunicorn or uWSGI.
    - Use a reverse proxy like Nginx or Apache to serve static files and handle SSL termination.
    - Deploy your application to a cloud platform like AWS, Google Cloud, or Azure.
  - CI/CD Integration:
    - Use a CI/CD pipeline to automate testing, building, and deployment.
    - Use tools like Jenkins, Travis CI, or GitHub Actions.
- api.mdc

** 入参要求
- header中必须设置 auth， 值为当前登录后保存的token值
- 请求的参数使用json 格式， 就算是参数为空，也需要使用 {} 来代替
** http请求
   请求方式默认是post，除非有明确要求
** 返参
- 后端统一返回的参数为json对象，格式如下
{
"error": 0,
 "body": object,
 "message": ''

   }
 error =0, 表示没有任何异常
 error = 500, 表示系统异常，需要弹出系统异常的错误
 error = 401，表示需要登录
 error 其它值，表示业务异常，直接弹出 message内容
 body 是一个对象
 ** 设计一个通用函数来处理后端API返回值，所有的API文件都是用这个通用函数

```



> 更新: 2025-06-29 15:45:35  
> 原文: <https://www.yuque.com/lixinsi/iac89w/tonhvrwgk6aqpp1k>