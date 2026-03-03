---
name: ads-audit
description: >
  Full multi-platform paid advertising audit across Google Ads, Meta Ads,
  LinkedIn Ads, TikTok Ads, and Microsoft Ads. Delegates to 6 parallel
  subagents covering 190 checks total. Generates an Ads Health Score (0-100)
  with letter grade and prioritized action plan. Use when user says "ads audit",
  "audit my ads", "advertising audit", "account audit", or "full ads audit".
argument-hint: "Run a complete multi-platform audit with health score and action plan"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebFetch
---

# Multi-Platform Ads Audit

## Overview

The full audit runs 190 checks across 6 specialized dimensions:

| Subagent | Platform Focus | Checks |
|----------|---------------|--------|
| `audit-google` | Google Ads (Search, PMax, Display, YouTube) | 74 |
| `audit-meta` | Meta Ads (Facebook, Instagram, Advantage+) | 46 |
| `audit-creative` | LinkedIn, TikTok, Microsoft creative quality | 21 |
| `audit-tracking` | LinkedIn, TikTok, Microsoft conversion tracking | 7 |
| `audit-budget` | LinkedIn, TikTok, Microsoft bidding & budget | 24 |
| `audit-compliance` | LinkedIn, TikTok, Microsoft compliance & performance | 18 |

**Total: 190 checks → Ads Health Score (0–100)**

## Audit Workflow

### Stage 1 — Data Collection
Ask the user to provide any available account data:
- Google Ads: Campaign exports, search term reports, Quality Score data
- Meta Ads: Account overview screenshots, pixel status, creative performance
- LinkedIn, TikTok, Microsoft: Campaign exports or performance screenshots
- Any platform: change history, conversion tracking status

Accept whatever the user can provide — partial data produces a partial audit.

### Stage 2 — Business Type Detection

Auto-detect from available data:
- **SaaS**: trial_start/demo_request events, pricing page targeting
- **E-commerce**: purchase events, product catalog/feed, Shopping/PMax
- **Local Service**: call extensions, location targeting, store visits
- **B2B Enterprise**: LinkedIn Ads active, ABM lists, high CPA tolerance ($50+)
- **Info Products**: webinar/course funnels, lead gen forms
- **Mobile App**: app install campaigns, in-app events, deep linking
- **Real Estate**: listing feeds, property-specific landing pages
- **Healthcare**: HIPAA compliance flags, healthcare-specific ad policies
- **Finance**: Special Ad Categories declared, financial products compliance
- **Agency**: multiple client accounts, white-label reporting needs

### Stage 3 — Platform Detection

Identify which platforms are active, then scope the audit accordingly:
- Only audit platforms the user actually uses
- Note missing platforms as opportunities in the action plan

### Stage 4 — Parallel Subagent Delegation

Spawn all applicable agents simultaneously:

```
Agent 1: audit-google   → reads google-audit.md + benchmarks.md + scoring-system.md
Agent 2: audit-meta     → reads meta-audit.md + benchmarks.md + scoring-system.md
Agent 3: audit-creative → reads linkedin/tiktok/microsoft audit checklists
Agent 4: audit-tracking → reads conversion-tracking.md + platform specs
Agent 5: audit-budget   → reads budget-allocation.md + bidding-strategies.md
Agent 6: audit-compliance → reads compliance.md + benchmarks.md
```

### Stage 5 — Score Aggregation

Read `ads/references/scoring-system.md` for the full scoring algorithm.

**Platform scores:**
- Google Ads Health Score (0–100)
- Meta Ads Health Score (0–100)
- LinkedIn Ads Health Score (0–100, if applicable)
- TikTok Ads Health Score (0–100, if applicable)
- Microsoft Ads Health Score (0–100, if applicable)

**Aggregate score:**
```
Ads Health Score = Sum(Platform_Score × Platform_Budget_Share)
```

**Grades:** A (90–100), B (75–89), C (60–74), D (40–59), F (<40)

### Stage 6 — Action Plan Generation

Compile all findings into a prioritized action plan:

| Priority | Definition | Timeframe |
|----------|-----------|-----------|
| **Critical** | Revenue or data loss occurring now | Fix immediately |
| **High** | Significant performance drag | This week |
| **Medium** | Optimization opportunity | This month |
| **Low** | Best practice gap | Quarterly |

## Quality Gates (Non-Negotiable)

These rules are enforced in every audit — never recommend violating them:

- Never recommend Broad Match without Smart Bidding (Google)
- **3x Kill Rule**: flag any campaign where CPA >3x target for immediate pause
- Budget sufficiency: Meta ≥5x CPA/ad set, TikTok ≥50x CPA/ad group
- Never recommend edits during active learning phase (resets learning)
- Always check Special Ad Categories (housing/employment/credit/finance)
- Never run silent video ads on TikTok (93% of TikTok watched with sound)
- Attribution defaults: 7-day click / 1-day view (Meta), data-driven (Google)

## Output

### Report Structure

```
# Ads Health Score: XX/100 (Grade: X)

## Executive Summary
[2-3 sentence overview of account health and top priorities]

## Platform Scores
Google Ads:    XX/100  ████████░░  (XX% of budget)
Meta Ads:      XX/100  ██████████  (XX% of budget)
LinkedIn Ads:  XX/100  ███████░░░  (if applicable)
TikTok Ads:    XX/100  █████░░░░░  (if applicable)
Microsoft Ads: XX/100  ████████░░  (if applicable)

## Critical Issues (Fix Immediately)
1. [Issue] — [Impact] — [Fix]
2. ...

## High Priority (This Week)
1. [Issue] — [Impact] — [Fix]
2. ...

## Quick Wins (< 15 minutes each)
1. [Action] — [Expected impact]
2. ...

## Platform-Specific Findings
[Full per-platform reports from each subagent]

## 30-Day Action Roadmap
Week 1: [Critical fixes]
Week 2: [High priority items]
Week 3-4: [Medium priority optimizations]
```

### Deliverables
- `ADS-AUDIT-REPORT.md` — Master audit report with all findings
- Per-platform section reports
- `QUICK-WINS.md` — High-impact fixes under 15 minutes
- `ACTION-PLAN.md` — Full prioritized action plan with owners and timelines
