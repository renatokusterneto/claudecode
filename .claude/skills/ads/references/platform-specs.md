# Platform Creative Specifications — All Ad Platforms

<!-- Updated: 2026-02-10 -->
<!-- Sources: Platform official specs + research 2026 -->

## Google Ads Creative Specs

### Responsive Search Ads (RSA)

| Element | Minimum | Maximum | Best Practice |
|---------|---------|---------|---------------|
| Headlines | 3 | 15 | 12-15 unique |
| Headline length | — | 30 characters | Vary lengths |
| Descriptions | 2 | 4 | 3-4 unique |
| Description length | — | 90 characters | Use full 90 chars |
| Final URL | Required | — | Deep link preferred |
| Display path | 0 | 2 × 15 chars | Include keyword |

**Ad Strength targets:** Excellent > Good > Average > Poor (avoid Poor)

**Headline pinning:** Use sparingly — overpinning kills RSA optimization

### Performance Max (PMax) Asset Group

| Asset Type | Minimum | Maximum | Recommended |
|-----------|---------|---------|-------------|
| Images (landscape 1.91:1) | 1 | 20 | 10-15 |
| Images (square 1:1) | 1 | 20 | 5-10 |
| Images (portrait 4:5) | — | 20 | 3-5 |
| Logos (square 1:1) | 1 | 5 | 2-3 |
| Logos (landscape 4:1) | — | 5 | 1-2 |
| Videos | 0 | 5 | 3-5 (critical) |
| Headlines | 3 | 5 | 5 unique |
| Long headlines | 1 | 5 | 4-5 |
| Descriptions (short) | 1 | 5 | 4-5 |
| Descriptions (long) | 1 | 5 | 3-5 |

**Image specs:**
- Landscape: 1200×628px min (1920×1080px recommended), 5MB max
- Square: 300×300px min (1200×1200px recommended), 5MB max
- Portrait: 480×600px min, 5MB max
- Format: JPG, PNG (no GIF, no text overlays >20% of image)

**Video specs:**
- Minimum length: 10 seconds
- Recommended: 15-30 seconds (multiple lengths)
- Formats: MP4, MOV, AVI
- Resolution: 1920×1080px (1080p)
- Maximum file size: 256GB

### YouTube Video Ad Specs

| Format | Length | Skip After | Best For |
|--------|--------|-----------|---------|
| Skippable In-Stream | 12s+ | 5 seconds | Awareness + performance |
| Non-Skippable In-Stream | 15-20s | N/A | High-impact messaging |
| Bumper | 6s max | N/A | Reach + frequency |
| In-Feed (Discovery) | Any | N/A | Intent-based discovery |
| YouTube Shorts | 60s max | N/A | Mobile-first reach |

**Video creative specs:**
- Resolution: 1920×1080 (16:9) standard; 1080×1920 (9:16) for Shorts
- File format: MP4 recommended
- Max file size: 256GB
- Audio: Required (mute rate is high — always caption)

**Hook rule:** 5-second hook must communicate value before skip button appears

---

## Meta Ads Creative Specs

### Feed Image (Facebook + Instagram)

| Spec | Value |
|------|-------|
| Recommended size | 1080×1080px (1:1) |
| Minimum size | 600×600px |
| Landscape option | 1200×628px (1.91:1) |
| Portrait option | 1080×1350px (4:5) — **highest reach** |
| Max file size | 30MB |
| Format | JPG, PNG |
| Text overlay | <20% of image (Meta guideline) |
| Primary text | 125 characters (displayed before "see more") |
| Headline | 27 characters (truncates in feed) |
| Description | 27 characters (optional) |

### Feed Video (Facebook + Instagram)

| Spec | Value |
|------|-------|
| Recommended | 1080×1080px (1:1) or 1080×1350px (4:5) |
| Minimum | 120×120px |
| Format | MP4, MOV |
| Max file size | 4GB |
| Length | 1s–241 minutes (feed); 15s recommended |
| Aspect ratio | 1:1, 4:5, 16:9 |
| Frame rate | 30fps recommended |
| Captions | Auto-captions available — always enable |

### Stories & Reels

| Spec | Value |
|------|-------|
| Aspect ratio | 9:16 (VERTICAL ONLY) |
| Recommended size | 1080×1920px |
| Safe zone (top/bottom) | 250px each (avoid placing text/logos here) |
| Maximum video length | Stories: 60s; Reels: 90s |
| Optimal Reels length | 15-30s |
| Image file size | 30MB max |
| Video file size | 4GB max |
| Primary text | 125 characters |

### Carousel Ads

| Spec | Value |
|------|-------|
| Cards | 2-10 cards |
| Image size | 1080×1080px (1:1) |
| Video size | 1080×1080px |
| Headline per card | 45 characters |
| Description per card | 20 characters |
| Link per card | Unique URL allowed |

### Advantage+ Creative Optimizations (2026)

Meta automatically applies these — know what's enabled:
- Background generation (AI-generated backgrounds)
- Image brightness/contrast adjustment
- Text overlay variations
- Music addition to static images (Reels)
- 3D animation effects

To control: Campaign → Ad level → Advantage+ Creative toggle

---

## TikTok Ads Creative Specs

### In-Feed Video Ad (Primary Format)

| Spec | Value |
|------|-------|
| Aspect ratio | 9:16 (vertical — REQUIRED for best performance) |
| Resolution | 1080×1920px |
| File format | MP4, MOV, MPEG, AVI |
| Max file size | 500MB |
| Duration | 5-60 seconds (9-15s optimal for performance) |
| Frame rate | 24-60fps |
| Bitrate | ≥516 kbps |
| Audio | Required — 90%+ of TikTok users watch with sound |

### TikTok Safe Zones — CRITICAL

```
Total frame: 1080×1920px

UNSAFE ZONES (no text, logos, or key visual elements):
┌─────────────────────────────┐
│ TOP unsafe zone: 130px      │  ← TikTok UI elements
├─────────────────────────────┤
│                             │
│   SAFE ZONE                 │
│   (1080 × 1560px)          │
│                             │
│   Place all text, logos,    │
│   CTAs, and key visuals     │
│   here                      │
│                             │
├─────────────────────────────┤
│ BOTTOM unsafe zone: 230px   │  ← Username, caption, sounds, CTAs
└─────────────────────────────┘

Left unsafe zone: 75px       ← Username + icons
Right unsafe zone: 75px      ← Share/like/comment buttons
```

### TikTok Brand Safety Specifications

| Element | Requirement |
|---------|------------|
| Brand logo | Upper-left or upper-right (safe zone) |
| Product shot | Middle third of frame |
| CTA overlay | Position: 1400-1650px from top |
| Text overlays | Keep within safe zone (130-1690px vertical) |
| Face position | Upper 60% of frame preferred |

### TopView & Brand Takeover

| Format | Spec | Notes |
|--------|------|-------|
| TopView | 5-60s video, 9:16 | First ad seen on app open |
| Brand Takeover | 3-5s image/GIF/video | Full-screen, no skip |
| Branded Effect | Custom AR filter | User-generated engagement |

### TikTok Creative Best Practices

- **Native-first**: Ads that look like organic TikToks outperform polished branded content
- **Hook in 0-3 seconds**: Pattern interrupt required before scroll
- **Sound-on design**: Music and speech drive engagement
- **Creator collaboration**: TikTok Creator Marketplace for UGC-style
- **Trend participation**: Trending sounds, challenges, formats boost organic reach

---

## LinkedIn Ads Creative Specs

### Sponsored Content (Single Image)

| Spec | Value |
|------|-------|
| Recommended | 1200×627px (1.91:1) |
| Minimum | 400×400px |
| Format | JPG, PNG, GIF |
| Max file size | 5MB |
| Introductory text | 150 characters (desktop) / 600 characters max |
| Headline | 70 characters |
| Description | 100 characters |

### Sponsored Video

| Spec | Value |
|------|-------|
| Aspect ratio | 16:9, 1:1, or 9:16 |
| Recommended size | 1920×1080px (16:9) |
| Format | MP4 |
| Max file size | 200MB |
| Duration | 3s – 30 minutes |
| Recommended | 15-30s (B2B) |
| Captions | Required (auto-captioning available) |
| Frame rate | 30fps |

### Thought Leader Ads (TLA)

| Spec | Value |
|------|-------|
| Source | Personal profile post (not company page) |
| Format | Organic post formats: text, image, video, document |
| Character limit | 3,000 characters (post body) |
| CPC range | $2.29-$4.14 (vs $13.23 average Sponsored Content) |
| Requirements | Employee consent + LinkedIn Creator Mode |

### Conversation Ads (Message Ads)

| Spec | Value |
|------|-------|
| Subject line | 60 characters |
| Message body | 500 characters |
| CTA buttons | Up to 5 per message |
| CTA character limit | 25 characters each |
| Frequency cap | 1 per 45 days per member |
| Banner image | 300×250px (optional) |

### Document Ads (High-performing B2B)

| Spec | Value |
|------|-------|
| Document formats | PDF, PPT, PPTX, DOC, DOCX |
| Max file size | 100MB |
| Min pages | 3 |
| Recommended | 5-10 pages (gated lead gen) |
| Preview pages | First 3 pages visible before gate |
| Introductory text | 255 characters |

---

## Microsoft Ads Creative Specs

### Responsive Search Ads (RSA)

Same specs as Google RSA (Microsoft's import compatible):

| Element | Minimum | Maximum |
|---------|---------|---------|
| Headlines | 3 | 15 |
| Headline length | — | 30 characters |
| Descriptions | 2 | 4 |
| Description length | — | 90 characters |

### Multimedia Ads (Microsoft-Exclusive)

| Spec | Value |
|------|-------|
| Image size | 703×368px (primary) |
| Headline | 90 characters |
| Description | 90 characters |
| Company name | 25 characters |
| Format | JPG, PNG |
| Placement | Premium SERP positions |
| Notes | Right-side image-rich format, higher CTR than RSA |

### Microsoft Audience Network (Display)

| Format | Spec |
|--------|------|
| Standard image | 1200×628px |
| Square image | 628×628px |
| Logo | 128×128px |
| Headline | 25 characters |
| Description | 100 characters |
| Max file size | 2MB |

---

## Quick Reference: Aspect Ratio Cheat Sheet

| Platform | Feed | Stories/Vertical | Horizontal |
|----------|------|-----------------|------------|
| Google Search | Text only | N/A | N/A |
| Google Display | 1:1, 1.91:1 | — | 1.91:1 |
| YouTube | 16:9 | 9:16 (Shorts) | 16:9 |
| Meta Feed | 1:1 or 4:5 | 9:16 | 1.91:1 |
| Meta Stories | 9:16 ONLY | 9:16 ONLY | N/A |
| TikTok | 9:16 ONLY | 9:16 ONLY | N/A |
| LinkedIn Feed | 1.91:1 | 9:16 (video) | 1.91:1 |
| Microsoft SERP | Text only | N/A | N/A |
| Microsoft Multimedia | 1.91:1 | N/A | 1.91:1 |

**Rule of thumb:** When in doubt, produce 9:16 vertical + 1:1 square — covers 90% of placements across all platforms.
