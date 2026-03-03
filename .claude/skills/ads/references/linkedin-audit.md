# LinkedIn Ads Audit Checklist — 25 Checks

<!-- Updated: 2026-02-10 -->
<!-- Sources: LinkedIn Research, Claude Research, Gemini Research -->

## Category 1: Technical Setup (25% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| L01 | LinkedIn Insight Tag installed and firing on all pages | All pages verified | Partial coverage | Not installed | Critical |
| L02 | Conversions API (CAPI) active — launched 2025 | Active + verified | In testing | Disabled | High |
| L03 | Conversion events configured for full funnel | Full funnel tracked | Partial tracking | Only final conversion | High |
| L04 | Revenue attribution tracking enabled | Active | Not enabled | N/A | Medium |
| L05 | Matched Audiences: website retargeting active | Active + segmented | Active, one pool | Not configured | High |

---

## Category 2: Audience Targeting (25% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| L06 | Job title targeting: specific titles, not just functions | Specific titles | Mix of title + function | Functions only | High |
| L07 | Company size filtering matches ICP | Correctly filtered | Partially filtered | Not filtered | Medium |
| L08 | Seniority level appropriate for offer type | Aligned to offer | Partial | Not configured | Medium |
| L09 | Matched Audiences: contact lists uploaded and active | Uploaded + active | Uploaded, inactive | Not uploaded | High |
| L10 | ABM company lists uploaded (up to 300,000 companies) | Active + tiered | Active, not tiered | Not used | High |
| L11 | Audience expansion OFF for precision campaigns | Correctly set | Inconsistent | ON for precision | High |
| L12 | Predictive audiences tested (replaced Lookalikes Feb 2024) | Tested + evaluated | Not tested | Still using old lookalike | Medium |

---

## Category 3: Creative Quality (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| L13 | Thought Leader Ads (TLAs) active with ≥30% budget | ≥30% budget | 15-30% | Not using TLAs | Critical |
| L14 | Ad format diversity: ≥2 formats tested | ≥2 formats | 1 format only | 1 format | High |
| L15 | Video ads tested and active | Tested + evaluated | Not tested | Not used | Medium |
| L16 | Creative refresh every 4-6 weeks | Refreshed within 4 wks | 4-8 weeks | >8 weeks | High |

---

## Category 4: Lead Gen & Performance (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| L17 | Lead Gen Form: ≤5 fields (13% CVR benchmark) | ≤5 fields | 5-8 fields | >8 fields | High |
| L18 | Lead Gen Form CRM sync: real-time or <1hr | Real-time | <24hr | Manual / >24hr | High |
| L19 | Campaign objective matches funnel stage | Aligned | Minor mismatch | Misaligned | High |
| L20 | A/B testing active: one variable at a time | Active, structured | Ad-hoc testing | No testing | Medium |
| L21 | Message ad frequency: ≤1 per 30-45 days per user | ≤1/30 days | 1 per 15-30 days | >1 per 15 days | High |

---

## Category 5: Bidding & Budget (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| L22 | Bid strategy: Max Delivery for Content, CPS for Messages | Correctly applied | Mixed | Wrong strategy | High |
| L23 | Daily budget: ≥$50 for Sponsored Content | ≥$50 | $20-50 | <$20 | High |
| L24 | CTR (Sponsored Content): ≥0.44% | ≥0.44% | 0.30-0.44% | <0.30% | High |
| L25 | CPC within benchmark (average $5-7, senior $6.40+) | ≤$7.00 | $7-10 | >$10 | Medium |

---

## Key Thresholds

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| CTR (Sponsored Content) | ≥0.44% | 0.30-0.44% | <0.30% |
| CPC (average) | ≤$7.00 | $7-10 | >$10.00 |
| Lead Gen CVR | ≥10% | 5-10% | <5% |
| Message frequency | ≤1/30 days | 1/15-30 days | >1/15 days |
| TLA budget share | ≥30% | 15-30% | <15% |
| TLA CPC range | $2.29-$4.14 | — | >$6 |

## LinkedIn Platform Context

| Setting | Value |
|---------|-------|
| Minimum audience size | 500 (for ads to run) |
| Lead Gen Form CVR benchmark | 13% (vs 3-4% for landing pages) |
| TLA CPC range | $2.29-$4.14 |
| Standard Sponsored Content CPC | $13.23 average |
| Hierarchy renamed | Oct 2025: Campaign Group → Campaign → Ad |
| Predictive Audiences | Replaced Lookalikes Feb 2024 |
| CAPI launch | 2025 — most accounts haven't deployed |
| Accelerate Campaigns | 42% lower CPA, 21% lower CPL (AI-powered) |
| Q3 CPC peak | $15.72 average (seasonal high) |

## Thought Leader Ads (TLA) ROI Calculation

```
Standard Sponsored Content CPC: $13.23
TLA CPC range: $2.29 - $4.14

Savings per click at TLA CPC midpoint ($3.22): $10.01
At 1,000 clicks/month: $10,010 monthly savings

Plus: TLA CTR typically 2-3× higher → more organic reach per dollar
```

**TLA Setup Requirements:**
- Must be from genuine employees/executives (not brand page)
- Requires employee consent + LinkedIn Creator Mode
- Post must originate from personal profile
- Ad approval same as standard Sponsored Content
- Best performers: C-suite, subject matter experts, salespeople

## ABM Strategy Assessment

For B2B Enterprise:

| Tier | Company Count | Budget % | Message Style |
|------|--------------|----------|---------------|
| Tier 1 (Top accounts) | 50-100 | 40% | Highly personalized |
| Tier 2 (Target accounts) | 100-500 | 40% | Industry personalized |
| Tier 3 (Pipeline targets) | 500+ | 20% | Segment personalized |

## Most Common Failures

1. **Not using Thought Leader Ads** — paying 4-6× more per click than necessary
2. **Lead Gen Forms with >5 fields** — CVR drops sharply beyond 5 fields
3. **Audience expansion ON for precision campaigns** — audience quality drops
4. **No ABM company targeting** — missing highest-value account opportunities
5. **Message ads too frequent** — spam complaints + account penalties
6. **Insight Tag missing** — blind to retargeting opportunities
7. **LinkedIn CAPI not deployed** — attribution gap for long B2B sales cycles
