---
name: ads-budget
description: >
  Budget allocation and bidding strategy review across all paid advertising
  platforms. Covers 70/20/10 allocation framework, bid strategy progression,
  budget sufficiency checks, MER analysis, and platform-specific bidding rules.
  Use when user says "ad budget", "bidding strategy", "ROAS target", "CPA target",
  "budget allocation", "how to bid", or "budget optimization".
argument-hint: "Budget allocation and bidding strategy review"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Ads Budget & Bidding Review

## Process

1. Collect budget and performance data (spend by platform, CPA/ROAS by campaign)
2. Read `ads/references/budget-allocation.md` for allocation frameworks
3. Read `ads/references/bidding-strategies.md` for platform-specific bid guidance
4. Read `ads/references/benchmarks.md` for industry CPA/ROAS benchmarks
5. Read `ads/references/scoring-system.md` for scoring methodology
6. Evaluate budget distribution, bid strategy health, and efficiency metrics
7. Generate budget optimization report with recommendations

## Budget Allocation Framework

### The 70/20/10 Rule

```
70% → Proven channels (consistent CPA/ROAS targets met for 4+ weeks)
20% → Scaling channels (showing promise, need more data, 2-4 weeks)
10% → Testing channels (new platforms, audiences, formats)
```

Apply this at:
- Cross-platform level (Meta vs. Google vs. LinkedIn)
- Within platform (proven campaigns vs. testing campaigns)
- Within campaign (proven audiences vs. new audiences)

### Budget Sufficiency Thresholds

| Platform | Minimum Per Ad Set/Group | Rationale |
|----------|-------------------------|-----------|
| Meta | ≥5x daily CPA target | Learning phase requires 50 events/week |
| Google | ≥10x daily CPA target | Smart Bidding requires data |
| TikTok | ≥50x CPA per ad group | TikTok learning is data-hungry |
| LinkedIn | $50/day minimum | Platform CPCs are high |
| Microsoft | 20-30% of Google budget | Lower volume, similar CPC patterns |

### The 20% Budget Rule

**Never increase a campaign budget by more than 20% at a time.**
- Larger increases reset the learning phase on Meta and Google
- Wait 3-5 days between increases to let algorithms stabilize
- Exception: Performance Max can tolerate larger increases

## Bidding Strategy Progression

### Google Ads Bid Strategy Roadmap

```
Phase 1 (0-50 conversions): Maximize Clicks or Manual CPC
→ Goal: generate traffic and conversion data

Phase 2 (50-200 conversions): Target CPA or Maximize Conversions
→ First automated bidding — start conservative (CPA = current average × 1.2)

Phase 3 (200+ conversions): Target ROAS or Maximize Conversion Value
→ Full value-based bidding with historical context

Ongoing: Tighten targets 10-15% per month as performance improves
```

### Meta Ads Bid Strategy Roadmap

```
Phase 1 (Learning): Lowest Cost (no cap)
→ Let Meta optimize freely during the 50-event learning phase

Phase 2 (Stable): Cost Cap at 1.2-1.5x target CPA
→ Control costs while maintaining volume

Phase 3 (Mature): ROAS Goal (for e-commerce with purchase events)
→ Value-based optimization when purchase value data is reliable

Advantage+ Campaigns: Highest volume or ROAS goal with Advantage+ budget
```

### Platform-Specific Rules

**Google:**
- tCPA: needs 30-50 conversions/month minimum
- tROAS: needs 50-100 conversions/month minimum
- PMax: needs 50 conversions/month to optimize effectively
- Seasonality adjustments: use during known high/low conversion periods

**Meta:**
- Lowest Cost: use during learning and testing
- Cost Cap: set at 1.2-1.5x actual CPA (not aspirational target)
- Budget CBO vs. ABO: CBO preferred at scale, ABO for testing

**TikTok:**
- Lowest Cost: standard for most campaigns
- Cost Cap: only after 50+ conversions/week per ad group
- Budget: ≥$20/day per ad group, ≥$50/day per campaign

**LinkedIn:**
- Max Delivery: for Sponsored Content (impression-based)
- CPS (Cost Per Send): for Message Ads
- Enhanced CPC: avoid — performance typically worse

## Kill Rules

### 3x Kill Rule (applies to all platforms)
Any campaign, ad set, or keyword with CPA >3x target:
1. Pause immediately (don't wait for more data)
2. Analyze root cause: audience? creative? landing page?
3. Fix and relaunch, or reallocate budget to winners

### Budget Reallocation Triggers
- Campaign at 2x target CPA for 2+ weeks → reduce budget 30%
- Campaign at 0.5x target CPA for 2+ weeks → increase budget 20%
- New campaign with 0 conversions after 3x CPA spend → pause and review

## MER (Marketing Efficiency Ratio)

```
MER = Total Revenue / Total Marketing Spend

Target by business type:
- E-commerce (high margin):     MER ≥ 5x
- E-commerce (low margin):      MER ≥ 8x
- SaaS (monthly):               MER ≥ 4x (blended CAC:LTV)
- Local service:                MER ≥ 3x
- B2B (long sales cycle):       MER measured at pipeline, not revenue
```

MER provides a platform-agnostic view of overall advertising efficiency, avoiding
attribution inflation from individual platform reporting.

## Output

### Budget & Bidding Report

```
Budget Allocation Score: XX/100

70/20/10 Compliance:     PASS / WARNING / FAIL
Budget Sufficiency:      XX of XX platforms meeting minimums
Bid Strategy Health:     XX of XX campaigns on appropriate strategy
Kill Rule Violations:    X campaigns exceeding 3x CPA
20% Rule Compliance:     PASS / FAIL
```

### Deliverables
- `BUDGET-REPORT.md` — Full budget and bidding assessment
- Platform-by-platform budget recommendation
- Bid strategy progression plan per campaign
- Kill list: campaigns to pause immediately (3x rule violations)
- Scaling list: campaigns ready for budget increase
- MER calculation and target-setting guidance
