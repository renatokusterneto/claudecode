---
name: ads
description: >
  Comprehensive paid advertising audit and optimization for any business type.
  Performs full multi-platform audits (Google Ads, Meta Ads, LinkedIn Ads, TikTok
  Ads, Microsoft Ads), single-platform deep analysis, conversion tracking health
  checks, creative quality assessment, budget allocation optimization, bidding
  strategy evaluation, and compliance verification. Industry detection for SaaS,
  e-commerce, local service, B2B enterprise, info products, mobile app, real
  estate, healthcare, finance, and agency. Triggers on: "ads", "PPC", "paid
  advertising", "Google Ads", "Meta Ads", "Facebook Ads", "LinkedIn Ads",
  "TikTok Ads", "Microsoft Ads", "Bing Ads", "ad audit", "campaign audit",
  "ROAS", "conversion tracking", "creative fatigue", "bid strategy".
argument-hint: "audit | google | meta | youtube | linkedin | tiktok | microsoft | creative | landing | budget | plan <type> | competitor"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Ads — Multi-Platform Paid Advertising Audit & Optimization

## Quick Reference

| Command | What it does |
|---------|-------------|
| `/ads audit` | Full multi-platform audit with parallel subagent delegation |
| `/ads google` | Google Ads deep analysis (74 checks) |
| `/ads meta` | Meta Ads deep analysis (46 checks) |
| `/ads youtube` | YouTube Ads specific analysis |
| `/ads linkedin` | LinkedIn Ads deep analysis (25 checks) |
| `/ads tiktok` | TikTok Ads deep analysis (25 checks) |
| `/ads microsoft` | Microsoft/Bing Ads analysis (20 checks) |
| `/ads creative` | Cross-platform creative quality audit |
| `/ads landing` | Landing page assessment for ad campaigns |
| `/ads budget` | Budget allocation and bidding strategy review |
| `/ads plan <type>` | Strategic ad plan with industry templates |
| `/ads competitor` | Competitor ad intelligence across all platforms |

## Orchestration Logic

### Command Routing

```
/ads audit     → spawn 6 parallel subagents → unified Ads Health Score
/ads google    → invoke ads-google skill
/ads meta      → invoke ads-meta skill
/ads youtube   → invoke ads-youtube skill
/ads linkedin  → invoke ads-linkedin skill
/ads tiktok    → invoke ads-tiktok skill
/ads microsoft → invoke ads-microsoft skill
/ads creative  → invoke ads-creative skill
/ads landing   → invoke ads-landing skill
/ads budget    → invoke ads-budget skill
/ads plan <t>  → invoke ads-plan skill (load industry template from assets/)
/ads competitor → invoke ads-competitor skill
```

### Full Audit (/ads audit) — Parallel Delegation

When the user invokes `/ads audit`:

**Stage 1 — Data Collection**
Ask the user to provide any available account data:
- Google Ads: campaign exports, search term reports, Quality Score
- Meta Ads: account overview, Pixel/Events Manager status, ad performance
- Other platforms: exports or screenshots of key metrics

**Stage 2 — Industry & Platform Detection**
- Detect business type from available signals
- Identify which platforms are active
- Scope the audit to relevant platforms only

**Stage 3 — Parallel Subagent Delegation**
Spawn all 6 audit agents simultaneously:

```
audit-google     → 74 Google Ads checks
audit-meta       → 46 Meta Ads checks
audit-creative   → 21 LinkedIn/TikTok/Microsoft creative checks
audit-tracking   → 7 LinkedIn/TikTok/Microsoft tracking checks
audit-budget     → 24 LinkedIn/TikTok/Microsoft budget checks
audit-compliance → 18 LinkedIn/TikTok/Microsoft compliance checks
```

**Stage 4 — Score Aggregation**
```
Ads Health Score = Σ(Platform_Score × Platform_Budget_Share)

Grades:
A: 90-100  (Excellent — minor optimizations only)
B: 75-89   (Good — some improvement opportunities)
C: 60-74   (Needs Improvement — notable issues)
D: 40-59   (Poor — significant problems)
F: <40     (Critical — urgent intervention required)
```

**Stage 5 — Unified Report**
Compile all subagent findings into a single prioritized action plan.

## Industry Detection

Auto-detect from available account signals:

| Signal | Business Type |
|--------|--------------|
| trial_start/demo_request events, pricing page | SaaS |
| purchase events, product catalog/feed, Shopping | E-commerce |
| call extensions, location targeting, store visits | Local Service |
| LinkedIn Ads active, ABM lists, high CPA ($50+) | B2B Enterprise |
| webinar/course funnels, lead gen forms | Info Products |
| app install campaigns, in-app events | Mobile App |
| listing feeds, property landing pages | Real Estate |
| HIPAA flags, healthcare-specific policies | Healthcare |
| Special Ad Categories, financial products | Finance |
| multiple client accounts, white-label reporting | Agency |

## Quality Gates (hard rules — never violate)

- **Never recommend Broad Match without Smart Bidding** (Google)
- **3x Kill Rule**: flag CPA >3x target for immediate pause
- **Budget sufficiency**: Meta ≥5x CPA/ad set, TikTok ≥50x CPA/ad group
- **Learning phase**: never recommend edits during active learning phase
- **Compliance**: always check Special Ad Categories (housing/employment/credit/finance)
- **Creative**: never run silent video ads on TikTok (93% consumed with sound)
- **Attribution**: default to 7-day click / 1-day view (Meta), data-driven (Google)

## Reference Files (12 RAG files)

Load on-demand from `ads/references/`:

| File | Contents |
|------|---------|
| `scoring-system.md` | Weighted scoring algorithm, severity multipliers, grade thresholds |
| `benchmarks.md` | 2026 benchmarks: CTR, CPC, CVR, CPL, ROAS by platform and industry |
| `bidding-strategies.md` | Decision trees for bid strategy selection by platform |
| `budget-allocation.md` | 70/20/10 framework, platform selection matrix, scaling rules |
| `platform-specs.md` | Creative specs: dimensions, character limits, video requirements |
| `conversion-tracking.md` | Tracking setup requirements: Pixel, CAPI, Enhanced Conversions |
| `compliance.md` | GDPR, CCPA, Special Ad Categories, platform policies |
| `google-audit.md` | 74-check Google Ads audit checklist |
| `meta-audit.md` | 46-check Meta Ads audit checklist |
| `linkedin-audit.md` | 25-check LinkedIn Ads audit checklist |
| `tiktok-audit.md` | 25-check TikTok Ads audit checklist |
| `microsoft-audit.md` | 20-check Microsoft Ads audit checklist |

## Scoring Methodology

```
S_total = Σ(C_pass × W_sev × W_cat) / Σ(C_total × W_sev × W_cat) × 100

Severity multipliers:
Critical: 5.0x  (immediate revenue/data loss)
High:     3.0x  (significant performance drag)
Medium:   1.5x  (optimization opportunity)
Low:      0.5x  (best practice, minor impact)

Check results:
PASS:    full points
WARNING: 50% of points
FAIL:    0 points
N/A:     excluded from total
```

## Sub-Skills

| Skill | File |
|-------|------|
| ads-audit | `.claude/skills/ads-audit/SKILL.md` |
| ads-google | `.claude/skills/ads-google/SKILL.md` |
| ads-meta | `.claude/skills/ads-meta/SKILL.md` |
| ads-youtube | `.claude/skills/ads-youtube/SKILL.md` |
| ads-linkedin | `.claude/skills/ads-linkedin/SKILL.md` |
| ads-tiktok | `.claude/skills/ads-tiktok/SKILL.md` |
| ads-microsoft | `.claude/skills/ads-microsoft/SKILL.md` |
| ads-creative | `.claude/skills/ads-creative/SKILL.md` |
| ads-landing | `.claude/skills/ads-landing/SKILL.md` |
| ads-budget | `.claude/skills/ads-budget/SKILL.md` |
| ads-plan | `.claude/skills/ads-plan/SKILL.md` |
| ads-competitor | `.claude/skills/ads-competitor/SKILL.md` |

## Parallel Audit Agents

| Agent | Scope | Checks |
|-------|-------|--------|
| `audit-google` | Google Ads (Search, PMax, Display, YouTube) | 74 |
| `audit-meta` | Meta Ads (Facebook, Instagram, Advantage+) | 46 |
| `audit-creative` | LinkedIn, TikTok, Microsoft creative quality | 21 |
| `audit-tracking` | LinkedIn, TikTok, Microsoft conversion tracking | 7 |
| `audit-budget` | LinkedIn, TikTok, Microsoft bidding & budget | 24 |
| `audit-compliance` | LinkedIn, TikTok, Microsoft compliance | 18 |
