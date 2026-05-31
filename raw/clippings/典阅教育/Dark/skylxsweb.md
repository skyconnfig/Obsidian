# skylxsweb

### http://sky.lxs.best
```markdown
Supports Chinese and English language switching, EN and ZH, supports day and night modes
Create a premium private jet landing page hero section with the following specifications:
The section with stats should be 100VH. All of these sections should be
100VH each.

As the video slides with the mouse, you can change the style or change the result. Just make it look good. The night mode video is invisible and the video can be adapted to every page.Video plays in background，
The video should be at 100% opacity, without any overlays, and all text and buttons should not be dark, just the same as before

Video Background:
Use this exact CloudFront video URL: https://cdn.jsdelivr.net/gh/skyconnfig/myvideo@main/videos/1.mp4
Video should autoplay, be muted, loop continuously, and include 
Video automatically plays sound appropriately
playsInline attribute
Video covers entire viewport (100vh) using object-cover

Navigation Bar:
Brand name "SkyElite" on the left (text-2xl, font-semibold, text-gray-900)
Desktop menu items (hidden on mobile, visible md:flex): Start, Story, Rates, Benefits, FAQ
Navigation links in gray-900 with hover:text-gray-700 transition
Mobile hamburger menu button using Lucide React icons (Menu/X)
Mobile menu appears as dropdown with white/95 opacity background, backdrop blur, rounded corners, shadow
Max width 7xl, centered with px-8 py-6

Hero Content (centered, -mt-80 to pull up):
Small uppercase label: "PRIVATE JETS" (text-sm, font-semibold, gray-600, tracking-wider, mb-4)
Large two-line heading with overlapping effect:
Line 1: "Premium." (text-6xl md:text-7xl lg:text-8xl, font-normal, text-gray-500, leading-none, tracking-tighter)
Line 2: "Accessible." (same size, color: #202A36, negative margin-top: -12px for overlap)
Subtitle: "Your dedication deserves recognition." (text-lg md:text-xl, gray-600, mb-6, max-w-2xl)
Two call-to-action buttons (gap-4, centered):
"Discover" button: px-4 py-2, rounded-full, bg-gray-300, text-gray-800, font-medium, hover:bg-gray-400
"Book Now" button: px-4 py-2, rounded-full, white text, bg-color #202A36, hover color #1a2229 with smooth transitions

Typography:
Use Inter font (import from Google Fonts: 400, 500, 600, 700 weights)
Apply to entire body via CSS

Technical Setup:
React with TypeScript
Tailwind CSS for styling
Lucide React for icons
useState hook for mobile menu toggle
Full screen height container (h-screen)
Responsive breakpoints: mobile-first, md, lg
All transitions use transition-colors class

Layout Structure:
Outer container: min-h-screen, bg-gray-50
Hero section: relative, h-screen, overflow-hidden
Content wrapper: relative, h-full, flex flex-col
Main content area: flex-1, flex items-center justify-center

Make it clean, modern, and premium-looking with smooth interactions.
```



> 更新: 2026-05-21 18:34:44  
> 原文: <https://www.yuque.com/lixinsi/khzg7n/rdeg6lvqt5fn8agm>