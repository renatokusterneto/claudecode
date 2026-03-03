---
name: ads-google
description: >
  Google Ads deep analysis covering conversion tracking, wasted spend, account
  structure, keywords, ad creative, and campaign settings. Runs 74 checks across
  6 weighted categories. Generates Google Ads Health Score (0-100) with
  prioritized action plan. Use when user says "Google Ads", "Google PPC",
  "search ads", "Performance Max", "PMax", "Quality Score", or "Google campaign".
argument-hint: "Deep Google Ads audit — 74 checks across 6 categories"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Google Ads Deep Analysis

## Process

1. Collect Google Ads data (campaign exports, search term reports, Quality Score screenshots)
2. Read `ads/references/google-audit.md` for the full 74-check checklist
3. Read `ads/references/benchmarks.md` for Google-specific benchmarks
4. Read `ads/references/scoring-system.md` for weighted scoring algorithm
5. Read `ads/references/bidding-strategies.md` for bid strategy evaluation
6. Evaluate all applicable checks as PASS, WARNING, or FAIL
7. Calculate Google Ads Health Score (0-100)
8. Generate findings report with prioritized action plan

## Six Evaluation Categories

### 1. Conversion Tracking (25% weight)
- `gtag.js` or GTM implementation — firing on all conversion pages
- Enhanced Conversions configured (email/phone hashing)
- Consent Mode v2 compliant — required for EU/EEA traffic
- Conversion action mapping — right actions set as Primary
- Attribution model: data-driven preferred over last-click
- Cross-device tracking verified
- Import from GA4 validated (not duplicating conversions)

**Pass threshold**: All Primary conversion actions verified firing

### 2. Wasted Spend (20% weight)
- Search Terms report reviewed — irrelevant queries identified
- Negative keyword lists built and applied across campaigns
- Display placement exclusions applied (mobile apps, parked domains)
- Invalid click rate below 5%
- Brand and non-brand campaigns separated (no cannibalization)
- Broad Match usage — only acceptable with Smart Bidding active

**Pass threshold**: Wasted spend estimate <10% of total budget

### 3. Account Structure (15% weight)
- Campaign organization mirrors business structure
- Ad groups tightly themed (15-20 keywords maximum)
- RSA (Responsive Search Ad) configured per ad group
- Naming convention consistent across campaigns
- Shared budget usage appropriate
- Labels applied for reporting segmentation

### 4. Keywords (15% weight)
- Match type strategy appropriate (Exact/Phrase for high-value, Broad only with Smart Bidding)
- Quality Score distribution: average ≥7 target
- Keyword cannibalization checked across ad groups
- Bid adjustments set for device, location, audience
- Long-tail opportunities identified from search terms
- Negative keyword conflicts resolved

**Pass threshold**: Average Quality Score ≥7

### 5. Ads & Assets (15% weight)
- RSA headline count: ≥8 unique, ≤15 total
- RSA description count: ≥3 unique, ≤4 total
- Ad Strength: "Excellent" or "Good" — not "Poor"
- Sitelink extensions: ≥4 active with unique descriptions
- Callout extensions: ≥4 unique callouts
- Call extension: active if phone is a conversion goal
- Image extensions: active for search campaigns
- Price/Promotion extensions: active when relevant

### 6. Settings & Bidding (10% weight)
- Bid strategy appropriate for campaign maturity and conversion volume
- Budget pacing: campaigns not limited by budget at scale
- Ad scheduling configured and reviewed
- Device bid adjustments based on performance data
- Location targeting: Presence only (not Presence or Interest)
- Search partners: reviewed and excluded if underperforming
- Display network: excluded from Search campaigns (unless intentional)

## Performance Max Assessment

If PMax campaigns are active:
- Asset groups organized by audience theme or product category
- Search themes configured (not relying solely on Google's signals)
- Brand exclusions applied (to prevent brand cannibalization)
- Audience signals configured with first-party data
- Final URL Expansion: review if it's sending to unintended pages
- Budget: PMax should not cannibalize high-performing Search campaigns

## Key Benchmarks

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| Quality Score (avg) | ≥7 | 5-6 | <5 |
| CTR (Search) | ≥6.66% | 3-6% | <3% |
| Wasted spend | <10% | 10-20% | >20% |
| Invalid click rate | <5% | 5-10% | >10% |
| Ad Strength | Excellent/Good | Average | Poor |
| Impression share (brand) | ≥80% | 60-80% | <60% |

## Health Score

### Google Ads Health Score (0-100)

```
Category Weights:
Conversion Tracking: 25%  █████████░
Wasted Spend:        20%  ████████░░
Account Structure:   15%  ██████░░░░
Keywords:            15%  ██████░░░░
Ads & Assets:        15%  ██████░░░░
Settings:            10%  ████░░░░░░

Grade: A (90-100), B (75-89), C (60-74), D (40-59), F (<40)
```

## Quality Gates

- **Never recommend Broad Match without Smart Bidding** — critical rule
- **3x Kill Rule**: any keyword/ad group at 3x target CPA → pause immediately
- **Brand cannibalization**: PMax eating brand Search budget → add brand exclusions
- **Learning phase**: do NOT edit campaigns in active learning (wait for 50 conversions)

## Output

### Google Ads Report

```
Google Ads Health Score: XX/100 (Grade: X)

Conversion Tracking: XX/100  ████████░░  (25%)
Wasted Spend:        XX/100  ██████████  (20%)
Account Structure:   XX/100  ███████░░░  (15%)
Keywords:            XX/100  █████░░░░░  (15%)
Ads & Assets:        XX/100  ████████░░  (15%)
Settings:            XX/100  ███░░░░░░░  (10%)
```

### Deliverables
- `GOOGLE-ADS-REPORT.md` — Full 74-check findings with PASS/WARNING/FAIL
- Wasted spend estimate and top negative keyword recommendations
- Quality Score improvement plan per ad group
- RSA asset coverage gaps
- Bidding strategy progression roadmap
- Quick Wins sorted by impact (Critical → High → Medium → Low)
