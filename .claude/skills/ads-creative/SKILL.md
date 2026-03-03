---
name: ads-creative
description: >
  Cross-platform creative quality audit and fatigue detection. Evaluates creative
  volume, format diversity, platform compliance, and production roadmap across
  Google, Meta, LinkedIn, TikTok, and Microsoft. Use when user says "creative
  audit", "ad creative review", "creative fatigue", "ad performance review",
  "which ads to pause", or "creative strategy".
argument-hint: "Cross-platform creative quality audit and fatigue detection"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Cross-Platform Creative Quality Audit

## Process

1. Collect creative performance data (CTR trends, impressions, creative age)
2. Read `ads/references/platform-specs.md` for format requirements per platform
3. Read `ads/references/benchmarks.md` for CTR/engagement benchmarks
4. Read `ads/references/scoring-system.md` for scoring methodology
5. Evaluate creative volume, diversity, fatigue signals, and native compliance
6. Generate creative scorecard and production priority roadmap

## Platform-Specific Requirements

### Google Ads
- ≥8 unique headlines per RSA (15 maximum)
- ≥3 unique descriptions per RSA (4 maximum)
- Minimal strategic pinning — allow RSA flexibility
- Ad Strength: target "Excellent" (shows all 15 headlines have low overlap)
- Image assets: ≥1 landscape (1.91:1), ≥1 square (1:1), optional portrait
- Refresh cycle: 8-12 weeks (Search has slower fatigue than social)

### Meta Ads
- ≥3 active formats: image, video, carousel, collection, or Instant Experience
- Video: 15-30s for feed, <15s for Stories/Reels, 9:16 vertical for Stories/Reels
- Primary text: ≤125 chars visible (key message before "See more")
- Headline: ≤40 chars recommended
- Fatigue detection: CTR drop >20% over 14 days = refresh immediately
- Advantage+ Creative enabled for automatic asset variations
- Refresh cadence: review every 2-3 weeks; replace fatigued creatives

### TikTok (Strictest Standards)
- ≥6 creatives per ad group — Critical requirement
- All video must be 9:16 vertical 1080×1920 — no exceptions
- Native look: avoid corporate/polished aesthetics (kills performance)
- Sound-on: 93% of TikTok consumed with sound — never run silent
- Hook within 1-2 seconds — no slow intros
- Safe zone compliance: X:40-940px, Y:150-1470px for all key elements
- Fatigue: retire any creative with declining CTR after 7 days
- Trending audio: use platform-trending sounds when possible
- Spark Ads: test boosting organic content (~3% CTR vs ~2% standard)

### LinkedIn
- Thought Leader Ads (TLA): ≥30% of B2B budget allocation
- ≥2 ad formats tested: Sponsored Content, Message Ads, Document Ads, Video
- Video: 15-30s optimal, professional but not overly polished
- Creative refresh: every 4-6 weeks (LinkedIn audience is smaller, fatigue faster)
- For TLA: authentic personal posts outperform corporate-branded content

### Microsoft Ads
- RSA: ≥8 headlines, ≥3 descriptions (same as Google, but copy Bing-optimized)
- Multimedia Ads: test where available (image-rich search format unique to Microsoft)
- Action Extensions: use to add CTA button to standard search ads
- Copy: professional tone — Bing skews older, higher-income demographic

## Cross-Platform Fatigue Detection

### Fatigue Signals by Platform

| Platform | Fast Fatigue (Days) | CTR Drop Threshold | Action |
|----------|--------------------|--------------------|--------|
| TikTok | 5-7 days | >20% from peak | Retire immediately |
| Meta | 14-21 days | >20% over 14d | Refresh creative |
| LinkedIn | 21-30 days | >30% from baseline | Replace or refresh |
| Google | 56-84 days | Ad Strength decline | Add new headlines |
| Microsoft | 56-84 days | CTR drop >25% | Refresh copy |

### Fatigue Assessment Per Creative

For each active creative, check:
```
1. Days active
2. CTR trend (last 7d vs. prior 7d)
3. Frequency (social platforms)
4. Impressions threshold reached?

Verdict:
HEALTHY: No fatigue signals
WARNING: 1-2 fatigue signals present
CRITICAL: CTR dropped >40% or creative >3x average days active
```

## Creative Volume Assessment

Minimum creative inventory for a healthy account:

| Platform | Per Ad Group/Set | Recommended |
|----------|-----------------|-------------|
| Google RSA | 1 (minimum) | 3 RSAs per ad group |
| Meta | 3-5 per ad set | 5-8 per ad set |
| TikTok | 6+ per ad group | 6-10 per ad group |
| LinkedIn | 2-3 per campaign | 4-6 per campaign |
| Microsoft | 2-3 per ad group | 3-5 per ad group |

## Production Priority Roadmap

After audit, generate a ranked production list:

```
Priority 1 — CRITICAL (this week):
[ ] TikTok: 4 new 9:16 videos (current count: 2, minimum: 6)
[ ] Meta: Replace 3 fatigued creatives (CTR down >30%)

Priority 2 — HIGH (this month):
[ ] Google: Add 4 more RSA headlines (currently "Poor" strength)
[ ] LinkedIn: Test Thought Leader Ad format

Priority 3 — MEDIUM (next quarter):
[ ] Meta: Add collection format for bottom-funnel
[ ] Microsoft: Test Multimedia Ad format

Quick Wins (< 1 hour each):
[ ] Google: Unpin 2 headlines restricting RSA learning
[ ] Meta: Enable Advantage+ Creative on 3 campaigns
[ ] TikTok: Enable Search Ads Toggle (5-minute task)
```

## Output

### Creative Quality Report

```
Creative Health Score: XX/100

Google Ads Creative:   XX/100  ████████░░
Meta Ads Creative:     XX/100  ██████████
TikTok Creative:       XX/100  ███████░░░
LinkedIn Creative:     XX/100  █████░░░░░
Microsoft Creative:    XX/100  ████████░░
```

### Deliverables
- `CREATIVE-AUDIT-REPORT.md` — Per-platform creative findings
- Creative fatigue scorecard (each active creative rated HEALTHY/WARNING/CRITICAL)
- Production priority roadmap with specifications
- Platform-native compliance checklist
- Quick Wins under 1 hour
