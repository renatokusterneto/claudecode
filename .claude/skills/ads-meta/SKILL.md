---
name: ads-meta
description: >
  Meta Ads deep analysis covering Pixel/CAPI health, creative assessment,
  account structure, and audience targeting. Runs 46 checks across 4 weighted
  categories. Generates Meta Ads Health Score (0-100). Use when user says
  "Meta Ads", "Facebook Ads", "Instagram Ads", "Facebook campaign", "Meta
  campaign", "Advantage+", "CAPI", or "creative fatigue".
argument-hint: "Deep Meta Ads audit — 46 checks across 4 categories"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Meta Ads Deep Analysis

## Process

1. Collect Meta Ads data (account overview, Pixel status, Events Manager screenshots, ad performance exports)
2. Read `ads/references/meta-audit.md` for the full 46-check checklist
3. Read `ads/references/benchmarks.md` for Meta-specific benchmarks
4. Read `ads/references/scoring-system.md` for weighted scoring algorithm
5. Evaluate all applicable checks as PASS, WARNING, or FAIL
6. Calculate Meta Ads Health Score (0-100)
7. Generate findings report with action plan

## Four Evaluation Categories

### 1. Pixel & CAPI Health (30% weight)
The most critical category — without accurate data, nothing else matters.

- Meta Pixel installed and firing on all key pages
- Conversions API (CAPI) active — server-side tracking
- Event deduplication configured (client + server events matched by event_id)
- Event Match Quality (EMQ) scores for standard events:
  - ViewContent, AddToCart, InitiateCheckout, Purchase, Lead, CompleteRegistration
- **EMQ targets**: ≥8.0 for Purchase event (excellent)
- Advanced Matching parameters configured: email, phone, external_id
- Consent Mode compliance (for EU/EEA audiences)
- Test Event Tool verified — events firing correctly

**Pass threshold**: All Primary events firing with EMQ ≥6.0; CAPI active

### 2. Creative Assessment (30% weight)
Creative is the #1 lever in Meta advertising.

- Creative diversity: ≥3 formats active (image, video, carousel, collection)
- Creative fatigue detection: CTR drop >20% over 14 days → refresh needed
- Video length optimization: 15-30s for feed, <15s for Stories/Reels
- Vertical creative (9:16) for Stories and Reels placements
- UGC-style content tested vs. branded content
- Creative refresh cadence: active creatives reviewed every 2-3 weeks
- Advantage+ Creative enabled and tested
- Dynamic Creative (DCO) vs. static ads comparison

**Pass threshold**: ≥3 creative formats; no creative with >20% CTR decline running >14 days

### 3. Account Structure (20% weight)
Structure determines algorithm efficiency and learning speed.

- Campaign Budget Optimization (CBO) vs. Ad Set Budget Optimization (ABO) usage
- Ad set consolidation level — too many ad sets fragments learning
- Learning phase health: "Learning Limited" affecting <30% of active ad sets
- Budget per ad set: ≥5x target CPA for stable learning
- Advantage+ Shopping Campaigns tested (for e-commerce)
- Advantage+ Audience used alongside manual targeting
- Campaign objective matches funnel stage and conversion goal
- A/B tests structured correctly (one variable at a time)

**Pass threshold**: <30% of ad sets in "Learning Limited"; budget ≥5x CPA per ad set

### 4. Audience & Targeting (20% weight)
- Prospecting frequency: ≤3.0 per 7-day window (higher = fatigue)
- Retargeting windows segmented: 1-7d (hot), 7-30d (warm), 30-90d (cold)
- Custom audiences: website visitors, video viewers, lead form openers, customers
- Lookalike audiences: seeded from best customers (by LTV, not volume)
- Exclusions applied: existing customers, recent converters, bounced visitors (<10s)
- Audience overlap across ad sets checked and resolved
- Broad targeting tested (Meta's algorithm often outperforms narrow targeting)

**Pass threshold**: Prospecting frequency ≤3.0; customer exclusions active

## Advantage+ Shopping Assessment (E-commerce)

If Advantage+ Shopping Campaigns active:
- Product catalog connected and synced (no disapproved items)
- Catalog metadata complete: title, description, price, availability, image
- ROAS target set appropriately (not too aggressive during learning)
- Budget sufficient: ≥$100/day recommended for stable learning
- Compare ASC performance vs. manual campaigns

## Creative Fatigue Detection

Check each active creative:
```
Fatigue signals:
- CTR decline >20% vs. 14-day baseline → Warning
- CTR decline >40% → Fail (pause immediately)
- Frequency >4.0 in 7 days (prospecting) → Warning
- Frequency >6.0 in 7 days → Fail
- Same creative running >30 days with declining CTR → Fail
```

## Key Benchmarks

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| EMQ (Purchase) | ≥8.0 | 6.0-7.9 | <6.0 |
| CTR decline (14d) | <20% | 20-40% | >40% |
| Learning Limited % | <30% | 30-50% | >50% |
| Prospecting frequency (7d) | ≤3.0 | 3-5 | >5.0 |
| Budget per ad set | ≥5x CPA | 2-5x CPA | <2x CPA |
| CAPI active | ✅ Yes | — | ❌ No |

## Health Score

### Meta Ads Health Score (0-100)

```
Category Weights:
Pixel & CAPI:     30%  ███████████░
Creative:         30%  ███████████░
Account Structure: 20%  ████████░░░░
Audience:         20%  ████████░░░░

Grade: A (90-100), B (75-89), C (60-74), D (40-59), F (<40)
```

## Quality Gates

- **CAPI not active** = Critical issue (30-40% data loss from iOS 14.5+)
- **EMQ <4.0 for Purchase** = Critical issue (poor attribution accuracy)
- **Learning Limited >50% of ad sets** = High priority (algorithm can't optimize)
- **Creative running >30 days with declining CTR** = High priority (pause immediately)

## Output

### Meta Ads Report

```
Meta Ads Health Score: XX/100 (Grade: X)

Pixel & CAPI:      XX/100  ████████░░  (30%)
Creative:          XX/100  ██████████  (30%)
Account Structure: XX/100  ███████░░░  (20%)
Audience:          XX/100  █████░░░░░  (20%)
```

### Deliverables
- `META-ADS-REPORT.md` — Full 46-check findings with PASS/WARNING/FAIL
- EMQ improvement roadmap (Advanced Matching + CAPI implementation)
- Creative fatigue analysis per active ad
- Audience overlap report
- Learning Limited ad set fixes
- Quick Wins sorted by impact
