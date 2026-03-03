---
name: ads-landing
description: >
  Landing page quality assessment for paid ad campaigns. Evaluates message
  match, page speed, mobile experience, trust signals, and form optimization.
  Directly impacts Quality Score (Google) and Relevance Score (Meta). Use when
  user says "landing page", "post-click experience", "conversion rate", "page
  performance", "Quality Score landing page", or "ad destination".
argument-hint: "Landing page quality assessment for ad campaigns"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Landing Page Quality Assessment

## Process

1. Collect landing page URL(s) and corresponding ad copy
2. Optionally: read `ads/references/benchmarks.md` for CVR benchmarks by industry
3. Evaluate all five dimensions: message match, speed, mobile, trust, form
4. Assess platform-specific quality score implications
5. Generate landing page report with improvement priorities ranked by conversion impact

## Five Evaluation Dimensions

### 1. Message Match (Highest Impact)

The single biggest driver of conversion rate after click.

**What to check:**
- Headline on page matches or directly echoes ad headline
- Primary offer stated in the ad is prominent above the fold
- CTA on page matches or escalates from CTA in the ad
- Tone and language consistent between ad and page
- If ad is product-specific, page leads with that product (not homepage)

**Scoring:**
```
Perfect match (100%): Page headline = ad headline, offer visible above fold
Good match (75%):     Clear thematic alignment, offer present, some friction
Partial match (50%):  General topic match but offer or CTA misaligned
Mismatch (0%):        Ad sends to homepage or unrelated page
```

**Pass threshold**: ≥75% message match score

**Impact**: Every 10% decrease in message match = ~5-8% CVR drop

### 2. Page Speed

Every 1-second delay causes approximately 7% conversion rate reduction.

**Benchmarks:**
- LCP (Largest Contentful Paint): <2.5s = PASS, 2.5-4s = WARNING, >4s = FAIL
- FID/INP (Interaction to Next Paint): <100ms = PASS, 100-300ms = WARNING
- CLS (Cumulative Layout Shift): <0.1 = PASS
- Time to Interactive: <3.5s = PASS

**Common causes of slow pages:**
- Unoptimized images (>200KB per image)
- Render-blocking JavaScript
- No CDN for assets
- Heavy third-party scripts (chat widgets, tracking pixels)
- No lazy loading for below-fold content

**Platform impact:**
- Google Ads: Landing Page Experience score directly affects Quality Score → CPC
- Meta Ads: Page load speed affects ad delivery and CPM
- TikTok: Mobile-first optimization critical (90%+ mobile traffic)

### 3. Mobile Experience

75%+ of paid ad clicks come from mobile devices.

**Requirements:**
- Tap targets: ≥48×48px for all clickable elements
- Font size: ≥16px for body text (prevents zoom-trigger)
- CTA button: full-width or large enough to tap easily
- No horizontal scrolling
- Form fields: appropriate input types (tel for phone, email for email)
- Pop-ups: no interstitials that block mobile content (Google penalty)
- Above-fold content: hero message visible without scrolling on mobile

**Pass threshold**: All critical elements meet mobile requirements

### 4. Trust Signals

Trust drives conversion, especially for first-time visitors from ads.

**Above the fold (critical):**
- Company logo or brand name visible
- Security badge if collecting payment or personal data
- Phone number or live chat (for high-consideration products)

**Below the fold (important):**
- Social proof: testimonials, reviews, case studies, star ratings
- Logos: recognizable customer or partner logos
- Credentials: certifications, awards, media mentions
- Guarantee: money-back, free cancellation, no credit card required
- Number of customers or users (if impressive)

**Pass threshold**: ≥3 trust signals present; at least 1 above the fold

### 5. Form Optimization

**Friction rule by funnel stage:**

| Stage | Max Fields | Justification |
|-------|-----------|---------------|
| Top of funnel (email capture) | 1-2 | Email only, or email + first name |
| Mid funnel (lead gen) | 3-5 | Name, email, phone, company |
| Bottom funnel (high-value lead) | 6-9 | Acceptable with clear value exchange |
| High-value qualification | 9+ | Only if necessary for qualification |

**Form best practices:**
- Progress indicator for multi-step forms
- Inline validation (don't wait for submit to show errors)
- Auto-fill enabled (use standard field names: `name`, `email`, `tel`)
- Privacy statement near submit button
- CTA button copy: specific action ("Get My Free Quote"), not generic ("Submit")
- Mobile-optimized: correct keyboard type per field

## Platform-Specific Quality Score Impact

### Google Ads: Landing Page Experience

Landing page experience is 1 of 3 Quality Score components (33% weight):
- URL mismatch → automatic "Below Average" score → CPC increase 20-50%
- Slow page → "Below Average" landing page experience
- Mobile unfriendly → penalty in mobile bid auction

### Meta Ads: Landing Page Quality

- Page load speed directly impacts delivery algorithm
- High bounce rate from page → Meta deprioritizes ad in auction
- Landing page relevance to ad creative → affects Relevance Score

### TikTok: Landing Page Load Time

- TikTok's audience is mobile-first — page speed is critical
- Target <3s load on 4G connection
- Consider AMP pages for highest-intent traffic

## Common Landing Page Failures

1. **Homepage as destination** — no message match, too many choices
2. **Slow above-the-fold load** — hero image not optimized
3. **Form above value** — asking before giving
4. **Trust signals missing** — especially for new brands
5. **Desktop-designed page on mobile** — tiny text, hard-to-tap CTAs
6. **CTA below the fold** — user must scroll to convert
7. **Too many exit points** — navigation links pulling traffic away
8. **Generic headline** — "Welcome to Our Website" vs. specific offer

## Output

### Landing Page Report

```
Landing Page Score: XX/100

Message Match:    XX/100  ████████░░  (Highest conversion impact)
Page Speed:       XX/100  ██████████  (LCP, FID, CLS)
Mobile:           XX/100  ███████░░░  (75%+ of traffic)
Trust Signals:    XX/100  █████░░░░░  (Credibility & safety)
Form:             XX/100  ████████░░  (Friction analysis)
```

### Deliverables
- `LANDING-PAGE-REPORT.md` — Full assessment with scores per dimension
- Message match analysis: ad copy vs. page copy side-by-side
- Speed improvement priorities (sorted by load time impact)
- Mobile fixes: specific element changes needed
- Trust signal additions ranked by conversion lift potential
- Form optimization plan with expected CVR improvement
- Quick Wins: changes deliverable in <1 hour
