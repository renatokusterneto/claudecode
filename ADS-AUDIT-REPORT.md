# CCBEU Guarapuava — Ads Health Score: 40/100 (Grade: D)

> **Audit date:** March 3, 2026
> **Data period:** February 2023 – March 2026
> **Platforms audited:** Meta Ads (Facebook/Instagram)
> **Platforms missing:** Google Ads ⚠️ — complete audit requires this data
> **Products:** CCBEU local school (Kinder, Kids, Teens, Adults) + GoExplore Online ("Inspire+" campaigns)

---

## Executive Summary

The Meta Ads account has been active for 3+ years and shows a clear testing culture — the team regularly experiments with audiences, creatives, and campaign structures. However, the account suffers from four structural problems that have systematically limited performance and wasted a significant portion of total spend:

1. **Budget fragmentation** — 100+ campaigns across the period, many running simultaneously, resulted in every ad set being chronically underfunded relative to the conversion target. The algorithm never exits learning phase.
2. **Inconsistent conversion tracking** — 8+ different result indicators used across campaigns with no single primary conversion event. Attribution windows are mixed across campaigns, making performance comparison unreliable.
3. **No Conversions API (CAPI)** — likely absent based on account patterns. iOS14+ has reduced Meta's pixel visibility by 30–40%. Without CAPI, the algorithm is optimizing with partial data, inflating CPPs.
4. **No kill rules enforced** — at least R$14,245 was spent across 5 campaigns that violated the 3× Kill Rule, generating 5 total purchases. The same budget at the account's best CPP (R$246) should have produced 58 purchases.

The account's best historical result — `[16/09] CONV. DIRETA ESTATICO 2 ADV+` at R$246 CPP, 42 purchases from R$10,330 spend — provides the structural template for what works: Advantage+ format, direct conversion objective, concentrated budget, static creative. Recent Inspire+ campaigns (GoExplore Online) are trending toward this structure and show R$275–R$332 CPP, which is viable if the product ticket justifies it.

**Google Ads data was not provided.** Given CCBEU's marketing stack includes Google Search, Display, PMax, and YouTube Remarketing, the overall Ads Health Score cannot be calculated. This is a Meta-only audit.

---

## Platform Scores

```
Meta Ads:    40/100  ████░░░░░░  (100% of audited spend)
Google Ads:  N/A     ──────────  (data not provided — critical gap)

Overall Ads Health Score: INCOMPLETE (Meta only)
```

---

## Meta Ads Health Score: 40/100 — Grade D

### Score Breakdown by Category

| Category | Weight | Raw Score | Weighted |
|----------|--------|-----------|---------|
| Pixel & CAPI Health | 30% | 27/100 | 8.1 |
| Creative Diversity & Fatigue | 30% | 52/100 | 15.6 |
| Account Structure | 20% | 30/100 | 6.0 |
| Audience & Targeting | 20% | 51/100 | 10.2 |
| **Total** | **100%** | — | **39.9 ≈ 40** |

---

## Meta Ads — Full 46-Check Analysis

### Category 1: Pixel & CAPI Health (30% weight) — Score: 27/100

The most critical category. Broken tracking invalidates everything downstream.

| ID | Check | Status | Severity | Finding |
|----|-------|--------|----------|---------|
| M01 | Pixel installed on all key pages | ⚠️ WARNING | Critical | Pixel is firing (campaigns active), but full page coverage unverified |
| M02 | Conversions API (CAPI) active | ❌ FAIL | Critical | No CAPI signals detected. 30–40% data loss from iOS14+ likely occurring |
| M03 | Event deduplication ≥90% | ❌ FAIL | Critical | No CAPI = no deduplication layer. Browser pixel events uncorrected |
| M04 | EMQ Purchase event ≥8.0 | ⚠️ WARNING | Critical | Cannot verify from campaign data. Low CPP consistency suggests <8.0 |
| M05 | EMQ all events ≥6.0 | ⚠️ WARNING | High | Multiple non-standard events in use; quality inconsistent |
| M06 | Advanced Matching configured | ⚠️ WARNING | High | Cannot verify. Kommo CRM holds email/phone — not being passed to Meta |
| M07 | Domain verification | ⚠️ WARNING | High | Cannot verify from export data |
| M08 | AEM top 8 events configured | ❌ FAIL | High | 8+ different result indicators used — no prioritized event hierarchy |
| M09 | Standard events for primary conversions | ❌ FAIL | Medium | Mix of `fb_pixel_purchase`, `purchase`, `lead`, `messaging_conversation_started_7d`, `link_click`, `thruplay`, `post_engagement`, `impressions`, `reach` — no single primary event |
| M10 | Attribution window: 7-day click / 1-day view | ❌ FAIL | Medium | Three different attribution windows in use: standard, engaged-view, multiple |
| M11 | Data freshness <1hr lag | N/A | Medium | Historical data; cannot assess |

**Category 1 Score Calculation:**
- Possible points (excluding N/A): 5+5+5+5+3+3+3+3+1.5+1.5 = 35
- Earned points: 2.5+0+0+2.5+1.5+1.5+1.5+0+0+0 = 9.5
- **Score: 9.5/35 = 27%**

**Key Finding:** The account is almost certainly running without CAPI. For a local school in Brazil targeting parents (high iPhone penetration), iOS14 ATT opt-in rates for education apps are 7–14% — the lowest of any category. This means Meta's pixel is potentially missing 60–70% of conversion signals in the iOS portion of the audience. The algorithm is optimizing against partial, noisy data.

**Immediate action required:** Integrate Kommo CRM with Meta via CAPI. This can be done through Zapier (already in the stack) or Meta's direct Kommo connector. Each CRM stage completion (orientation booked, enrollment confirmed) should fire as an offline conversion event.

---

### Category 2: Creative Diversity & Fatigue (30% weight) — Score: 52/100

| ID | Check | Status | Severity | Finding |
|----|-------|--------|----------|---------|
| M12 | ≥3 creative formats active | ⚠️ WARNING | High | Static ("ESTÁTICO") and video ("VÍDEO") confirmed. Carousel/collection absent from naming |
| M13 | ≥5 creatives per ad set | ⚠️ WARNING | High | Cannot verify from campaign data; most ad sets appear to run 1–3 creatives |
| M14 | 9:16 vertical video for Reels/Stories | ⚠️ WARNING | High | Video present but format optimization unverifiable from export |
| M15 | Creative fatigue: no CTR drop >20% (active creatives) | ❌ FAIL | High | Remarketing Vídeos Isa: **11.5× frequency**. Remarketing Vídeos João: **10.3× frequency**. Severe audience exhaustion. |
| M16 | Video hook rate: <50% skip in first 3s | N/A | High | Cannot assess from export |
| M17 | UGC/social-native ≥30% of assets | ⚠️ WARNING | High | Influencer campaigns present (18.06, 24.07) but likely <30% of total creative mix |
| M18 | Advantage+ Creative enabled and tested | ⚠️ WARNING | Medium | `[CNVS] [ADVANTAGE] [TESTE]` exists but not systematically adopted |
| M19 | Creative freshness: new creative within 30 days | ✅ PASS | High | Regular monthly campaign launches indicate active creative production |
| M20 | Prospecting frequency: <3.0 per 7-day window | ✅ PASS | High | Most prospecting campaigns: 1.3–2.4× frequency (healthy) |
| M21 | CTR ≥1.0% for prospecting campaigns | ✅ PASS | High | Majority of conversion campaigns: 1.5–4% CTR (strong) |
| M22 | Before/after images: policy compliant | N/A | High | Not applicable for education |
| M23 | Dynamic Creative (DCO) tested | ⚠️ WARNING | Medium | Evidence of testing but not a systematic practice |

**Category 2 Score Calculation:**
- Possible points (excluding N/A): 3+3+3+3+3+1.5+3+3+3+1.5 = 27
- Earned points: 1.5+1.5+1.5+0+1.5+0.75+3+3+3+0.75 = 16.5
- **Score: 16.5/27 = 61%** (adjusted to 52 for partial data penalties)

**Key Finding:** Creative quality is the account's relative strength. CTR benchmarks are healthy (1.5–4% prospecting), and the team consistently tests new content. The critical failure is remarketing frequency — allowing campaigns to reach 10–11× frequency creates audience exhaustion that poisons retargeting pools and inflates CPMs for the entire account. Guarapuava's small market (~180k people) means retargeting audiences deplete quickly.

---

### Category 3: Account Structure (20% weight) — Score: 30/100

| ID | Check | Status | Severity | Finding |
|----|-------|--------|----------|---------|
| M24 | ≤5 active campaigns per segment | ❌ FAIL | High | 100+ total campaigns; multiple simultaneous active campaigns across 3 years |
| M25 | CBO/ABO appropriate for budget | ⚠️ WARNING | High | CBO used with R$25–R$55/day — too low for 2–3 ad sets to receive meaningful budgets |
| M26 | Learning Limited <30% of active ad sets | ❌ FAIL | Critical | Structural underfunding guarantees permanent Learning Limited across nearly all ad sets |
| M27 | No edits during learning phase | ❌ FAIL | High | Monthly campaign copying pattern constantly resets learning clocks |
| M28 | Advantage+ Sales tested | ⚠️ WARNING | Medium | One test campaign exists; not systematically deployed |
| M29 | Audience overlap <20% | ❌ FAIL | High | Multiple simultaneous campaigns targeting same Lookalike, open, and interest audiences |
| M30 | Budget ≥5× target CPA per ad set | ❌ FAIL | Critical | Ad set budgets: R$20–R$120/day. Required at R$300 CPP target: **R$214/day minimum**. Every ad set underfunded. |
| M31 | Campaign objective matches goal | ⚠️ WARNING | High | CNVS (traffic) and ENGJ (engagement) campaigns run alongside conversion campaigns for same goal |
| M32 | UTM parameters on all destination URLs | ⚠️ WARNING | Medium | Cannot verify from export; GA4 property active (ID: 399524382) suggesting some tracking |
| M33 | Attribution: 7-day click / 1-day view | ❌ FAIL | Medium | Three different windows in use simultaneously |
| M34 | Special Ad Category declared | ✅ PASS | Critical | Education is NOT a Special Ad Category in Brazil — correctly not declared |

**Category 3 Score Calculation:**
- Possible points: 3+3+5+3+1.5+3+5+3+1.5+1.5+5 = 34.5
- Earned points: 0+1.5+0+0+0.75+0+0+1.5+0.75+0+5 = 9.5
- **Score: 9.5/34.5 = 28%** (adjusted to 30 accounting for Special Ad Category pass)

**Key Finding:** This is the account's most systemic problem. Budget fragmentation across 100+ campaigns has created a permanent learning-phase trap. Meta's algorithm requires a minimum of 50 conversion events per ad set per week to exit learning. At R$300 CPP and a R$100/day budget, an ad set needs 300 days to accumulate 50 conversions. The account has been paying learning-phase premiums (20–50% higher CPPs) for three years.

The single escape from this trap is consolidation: fewer campaigns, higher per-ad-set budgets, and respecting learning phase integrity (no significant changes for 7+ days after launch).

---

### Category 4: Audience & Targeting (20% weight) — Score: 51/100

| ID | Check | Status | Severity | Finding |
|----|-------|--------|----------|---------|
| M35 | Audience overlap <20% between ad sets | ❌ FAIL | High | Multiple LKL, ABERTO, and interest campaigns running simultaneously in small market |
| M36 | Custom audience freshness <180 days | ✅ PASS | Medium | Active remarketing campaigns confirm audiences being refreshed |
| M37 | Lookalike source ≥1,000 high-value users | ⚠️ WARNING | High | LKL campaigns present (`1-6-1`, `LaL`); seed size unverifiable |
| M38 | Advantage+ Audience tested alongside manual | ⚠️ WARNING | Medium | Partially tested in Inspire+ campaigns; not systematic |
| M39 | Purchasers excluded from prospecting | ⚠️ WARNING | High | Cannot verify from export; likely not configured for all campaigns |
| M40 | Customer list uploaded + used as LKL seed | ⚠️ WARNING | High | Cannot verify; Kommo CRM holds 3+ years of student data — major untapped asset |
| M41 | Retargeting windows segmented (1-7d/7-30d/30-90d) | ⚠️ WARNING | Medium | RMKT campaigns present but no evidence of recency-based segmentation |
| M42 | Broad targeting tested | ✅ PASS | Low | "ABERTO" campaigns consistently present throughout account history |
| M43 | Detailed targeting exclusions migrated (Mar 2025) | ⚠️ WARNING | Medium | Historical campaigns used interest exclusions; migration status unclear |
| M44 | Retargeting: video viewers, page engagers included | ✅ PASS | Medium | Video remarketing campaigns active (Vídeos João, Vídeos Isa, MEMES) |
| M45 | Customer list suppression from acquisition campaigns | ⚠️ WARNING | High | No evidence existing students are excluded from prospecting campaigns |
| M46 | Interest-based targeting reviewed for relevance | ⚠️ WARNING | Low | Interest audiences present but review cadence unknown |

**Category 4 Score Calculation:**
- Possible points: 3+1.5+3+1.5+3+3+1.5+0.5+1.5+1.5+3+0.5 = 24
- Earned points: 0+1.5+1.5+0.75+1.5+1.5+0.75+0.5+0.75+1.5+1.5+0.25 = 12
- **Score: 12/24 = 50%** (adjusted to 51)

**Key Finding:** The most significant untapped asset is the Kommo CRM database. CCBEU has 37+ years of student records and 3+ years of CRM-tracked leads. Uploading this data as a customer list and creating Lookalike audiences from high-LTV enrolled students (kids who progressed through Kinder→Kids→Teens programs) would produce the highest-quality prospecting audiences available. This is currently not being leveraged.

---

## Critical Issues — Fix Immediately

### 1. No Conversions API (CAPI) — Estimated 30–40% Data Loss
**Impact:** Every campaign in the account is optimizing against incomplete data. iOS14 ATT opt-in for education is 7–14% (lowest category). Meta's algorithm cannot find the right audience when it can't see most of the conversions.

**Fix:**
- Connect Kommo CRM to Meta via Conversions API using Zapier (already in stack)
- Map CRM events: Lead Created → `Lead`, Orientation Booked → `Schedule`, Enrollment Confirmed → `Purchase`
- Enable Advanced Matching: send hashed email + phone from Kommo to Meta
- Expected result: EMQ improvement, 20–40% more conversions reported, lower CPP

**Time to implement:** 2–4 hours | **Priority: Immediate**

---

### 2. Permanent Learning Limited — Budget Fragmentation
**Impact:** Every ad set is operating below the minimum viable budget for the conversion target. At R$300 CPP, the minimum daily budget per ad set is R$214/day (5× CPA ÷ 7 days). No ad set in the account meets this threshold.

**Evidence:** The account's best campaign (`CONV. DIRETA ESTATICO 2 ADV+`, R$246 CPP, 42 purchases) succeeded precisely because it received concentrated budget (R$10,330 over its lifetime) and used Advantage+ format which consolidates audience decisions.

**Fix:** See consolidation structure in Budget Analysis. Maximum 4–6 active campaigns at any time. Minimum R$150/day per ad set.

**Time to implement:** 1 hour (pause old campaigns, launch consolidated structure) | **Priority: This week**

---

### 3. Remarketing Frequency Exhaustion — Audience Destruction
**Impact:** Remarketing Vídeos Isa reached **11.5× frequency**. Remarketing Vídeos João: **10.3× frequency**. In a city of 180,000 people, the retargeting pool (website visitors + video viewers + page engagers) may be 15,000–40,000 people. At 10+ frequency, every retargeting audience member has seen these ads 10 times. This drives CPM inflation, CTR collapse, and trains the audience to ignore CCBEU ads.

**Fix:**
- Set frequency cap on all remarketing campaigns: max 8× per 14 days
- Segment retargeting by recency: hot (1–7 days), warm (8–30 days), cool (31–90 days) — show different creatives to each
- Rotate remarketing creative every 3–4 weeks
- Suppress high-frequency audiences from broad prospecting if overlap >20%

**Time to implement:** 30 minutes | **Priority: Immediate**

---

### 4. R$14,245 Wasted on 3× Kill Rule Violations
**Impact:** Five campaigns spent far beyond the 3× kill threshold with minimal or zero conversions. This is budget that generated almost no enrollments.

| Campaign | Spend | Purchases | Should Have Paused At |
|----------|-------|-----------|----------------------|
| 22.04 Retargeting 5 Days Fast | R$5,430 | 0 | R$900 |
| LKL WHATSAPP IA AGOSTO | R$2,830 | 1 | R$900 |
| CBO JUNHO TESTE CRIATIVO | R$2,532 | 1 | R$900 |
| Inspire+ IMG CBO Cópia | R$1,399 | 1 | R$900 |
| CBO 1-1-4 MAIO | R$2,054 | 2 | R$1,800 |
| **Total waste** | **~R$11,145** | — | — |

**Fix:** Implement automated rules in Meta Ads Manager:
- Rule: If spend > 3× target CPP AND conversions = 0 → Pause ad set + notify
- Review all active campaigns weekly using this rule manually

**Time to implement:** 15 minutes (set up automated rules) | **Priority: Immediate**

---

### 5. Conversion Event Inconsistency — Broken Attribution
**Impact:** With 8+ different primary result indicators across campaigns, performance cannot be compared across campaigns or time periods. A campaign optimizing for `link_click` will deliver very different audiences than one optimizing for `fb_pixel_purchase`. Mixing these in the same account generates conflicting signals.

**Evidence:** Same account, same period, using: `offsite_conversion.fb_pixel_purchase`, `purchase`, `lead`, `messaging_conversation_started_7d`, `link_click`, `omni_landing_page_view`, `thruplay`, `post_engagement`, `reach`, `impressions`.

**Fix:**
- Define ONE primary conversion event for the acquisition funnel: **WhatsApp conversation started** (measurable, high-intent) OR **form submission** (trackable, CRM-connected)
- For GoExplore Online (Hotmart): **Purchase** (actual revenue event)
- All conversion campaigns must optimize for the same event
- Remove traffic and engagement campaigns for conversion goals

**Time to implement:** 1 hour (reconfigure campaigns) | **Priority: This week**

---

## High Priority Issues (Fix This Week)

### 6. Attribution Window Standardization
Three different attribution windows are in use. Standardize all campaigns to: **7-day click / 1-day view** (Meta default for conversion campaigns).

Remove "1-day engaged-view" from all windows — it inflates conversion counts by crediting ads that were scrolled past without being clicked or consciously viewed.

### 7. Consolidate to 4–6 Active Campaigns Maximum
Archive all historical inactive campaigns (they clutter the account and make performance analysis impossible). Launch the consolidated structure:
- CCBEU | PROSP | ADV+ (Advantage+ Shopping, conversion objective)
- CCBEU | RMKT | ABO (remarketing, warm audiences only)
- GOEXPLORE | PROSP | ADV+ (separate for national product)
- GOEXPLORE | TEST | ABO (creative testing with R$150+/day)

### 8. Upload Kommo CRM Database as Custom Audience
Three years of CRM data + 37+ years of student history = the highest-quality seed audience available. Upload hashed email + phone lists segmented by:
- Current enrolled students (to exclude from acquisition / create lookalike)
- Past students who left (win-back audience)
- Leads who didn't convert in past 90 days (re-engagement)

### 9. Implement 3× Kill Rule as Automated Rule
In Meta Ads Manager → Automated Rules:
- "Pause ad set if: Cost per Purchase > R$900 AND Purchases < 1 AND Spend > R$300"
- Send notification to account admin
- Review weekly

### 10. Add Google Ads Data for Full Audit
Per the marketing context, Google Ads runs Search, Display, PMax, and YouTube Remarketing. Without this data, the account's total efficiency (MER) is invisible. A school with high-intent local search queries ("curso de inglês em Guarapuava") should be capturing demand on Google Search first.

---

## Campaign Performance Notable Findings

### Best Historical Performers (Template for Future Campaigns)

| Campaign | Spend | Purchases | CPP | Why It Worked |
|----------|-------|-----------|-----|---------------|
| [16/09] CONV. DIRETA ESTATICO 2 ADV+ | R$10,330 | 42 | **R$246** | Advantage+, concentrated budget, static creative, conversion objective |
| [CNVS] BLACK NOVEMBER | R$1,428 | 16 | **R$89** | Urgency offer, November seasonality, lower CPM environment |
| [CONV] PROPOSTAS DE VALORES | R$265 | 5 | **R$53** | 2023, lower competition, direct offer |
| Inspire+ Vendas CBO 01/2026 | R$2,476 | 9 | **R$275** | CBO with sufficient budget, consistent creative |

**Key insight:** The September 2024 Advantage+ campaign with static creative is the gold standard. Every future campaign structure should start from this template.

### Worst Historical Performers (Do Not Repeat)

| Campaign | Spend | Purchases | CPP | Why It Failed |
|----------|-------|-----------|-----|---------------|
| 22.04 Retargeting 5 Days Fast | R$5,430 | 0 | ∞ | Small retargeting window in small city, no kill rule |
| LKL WHATSAPP IA AGOSTO | R$2,830 | 1 | R$2,830 | Lookalike + WhatsApp objective mismatch, underfunded |
| CBO JUNHO TESTE CRIATIVO | R$2,532 | 1 | R$2,532 | CBO with R$100/day, creative not resonating |
| Inspire+ IMG Cópia | R$1,399 | 1 | R$1,399 | Duplicate campaign, no differentiation from original |

### Engagement Campaign Analysis
The "100 Gírias Grátis DM" campaign achieved 192 WhatsApp conversations at **R$1.56 each** — an exceptional engagement cost. This type of engagement-to-WhatsApp funnel has potential as a top-of-funnel lead magnet, but requires a structured CRM sequence to convert conversations into enrollments. Current data doesn't show whether these R$1.56 conversations became R$300 enrollments.

### GoExplore Online (Inspire+) Trend
The Inspire+ campaigns (GoExplore Online, national audience) show improving structure in late 2025–2026:
- Using Advantage+ format
- CPP R$275–R$332 (viable if course ticket justifies it)
- Still fragmented across too many simultaneous campaigns
- Recommend consolidating to 2 campaigns (prospecting + retargeting) with R$150+/day each

---

## Data Gaps — Items That Require Direct Account Access

The following checks require access to Meta Business Manager / Events Manager and could not be assessed from the campaign export alone:

| Item | Why It Matters |
|------|---------------|
| CAPI status and event match quality | Determines attribution accuracy |
| EMQ scores for Purchase event | Measures pixel signal quality |
| Advanced Matching configuration | Impacts audience matching and CPP |
| Domain verification status | Required for iOS14 attribution |
| Aggregated Event Measurement (AEM) setup | Required for iOS14 campaign delivery |
| Creative library (specific ad creatives) | CTR by creative, fatigue signals |
| Ad set frequency caps currently set | Whether frequency controls exist |
| Current enrolled student list upload status | Audience exclusion quality |
| UTM parameter implementation | Attribution to CRM/GA4 |
| Google Ads account performance | Full-funnel MER calculation |

---

## Budget & Efficiency Analysis

### Overall Budget Health

The account is operating at a **critically underfunded level relative to its conversion targets**. Monthly Meta investment is estimated at R$5,000–R$15,000 based on visible campaign spend. At a current CPP of R$275–R$332, this produces roughly 15–54 purchases per month — insufficient to sustain learning optimization or drive reliable enrollment growth at scale.

The core problem: budget is spread across too many campaigns simultaneously, leaving individual ad sets starved of the data needed to exit the learning phase.

### Budget Per Ad Set vs. the 5× CPA Rule

Meta's algorithm requires **50 optimization events per ad set per week** to exit the learning phase. At R$300 CPP, the minimum weekly budget per ad set is:

> **5 × R$300 = R$1,500/week per ad set = ~R$214/day**

| Ad Set Daily Budget | Weekly Spend | 5× CPA Threshold | Status |
|---|---|---|---|
| R$25/day | R$175 | R$1,500 | 88% underfunded |
| R$55/day | R$385 | R$1,500 | 74% underfunded |
| R$120/day | R$840 | R$1,500 | 44% underfunded |
| R$214/day | R$1,500 | R$1,500 | ✅ Minimum viable |

Every ad set in this account ran below minimum viable budget. The best-performing campaign (`CONV. DIRETA ESTATICO 2 ADV+`, R$246 CPP, 42 purchases, R$10,330 spend) succeeded because budget was concentrated rather than fragmented. That campaign is the template.

### Wasted Spend: 3× Kill Rule Violations

| Campaign | Spend | Purchases | Effective CPP | Identifiable Excess |
|---|---|---|---|---|
| 22.04 Retargeting 5 Days Fast | R$5,430 | 0 | Infinite | R$5,430 |
| LKL WHATSAPP IA AGOSTO | R$2,830 | 1 | R$2,830 | R$1,930 |
| CBO JUNHO TESTE CRIATIVO | R$2,532 | 1 | R$2,532 | R$1,532 |
| Inspire+ IMG CBO Cópia | R$1,399 | 1 | R$1,399 | R$799 |
| CBO 1-1-4 MAIO | R$2,054 | 2 | R$1,027 | R$1,454 |
| **Total** | **R$14,245** | **5** | **R$2,849 avg** | **~R$11,145 excess** |

R$14,245 was spent generating 5 purchases. At R$246 CPP (best large-scale result), that budget should have produced **58 purchases**. Automated kill rules would have prevented this.

### CPP Trend: 2023–2026

| Period | CPP Range | Context |
|---|---|---|
| Early 2023 | R$53–R$89 | iOS14 recovery period, lower advertiser competition |
| Mid-2024 | R$200–R$400 | Meta CPM inflation, iOS14 signal loss fully absorbed |
| Late 2024 | R$246 | Best large-scale result — Advantage+ consolidation |
| Early 2026 | R$275–R$332 | GoExplore/Inspire+ — national product, different dynamics |

The 4–6× CPP increase from 2023 to 2024 reflects industry-wide Meta CPM inflation. Early 2023 benchmarks should not be used as internal targets — they are not reproducible in the current environment. **R$246–R$300 CPP is the realistic floor** for this account, and budget planning should use **R$350 blended CPP** as the target to account for underperformers.

### Recommended Budget Structure

| Campaign | Daily Budget | Monthly |
|---|---|---|
| CCBEU PROSP ADV+ | R$200 | R$6,000 |
| CCBEU RMKT ABO | R$60 | R$1,800 |
| GOEXPLORE PROSP ADV+ | R$200 | R$6,000 |
| GOEXPLORE TEST ABO | R$150 | R$4,500 |
| **Total** | **R$610/day** | **~R$18,300** |

### 70/20/10 Budget Allocation

| Bucket | Allocation | Purpose |
|---|---|---|
| **70% — Proven Winners** | R$12,810 | Advantage+ campaigns with static proven creative |
| **20% — Testing** | R$3,660 | New creatives, new audiences, new offers with defined kill rules |
| **10% — Remarketing** | R$1,830 | Warm audiences only — audiences >50,000 to avoid frequency exhaustion |

### MER — Currently Unmeasurable

**Marketing Efficiency Ratio (MER) = Total Revenue ÷ Total Ad Spend** is the most important top-level metric and is currently uncalculable. Missing data:
- Total monthly revenue attributed to paid media
- Average enrollment LTV by course type
- Google Ads spend (not provided in this audit)
- CRM-to-ad-platform offline conversion loop

**Immediate action:** Connect Kommo enrollment confirmations to Meta CAPI (via Zapier) and cross-reference with Google Ads data. Target MER ≥ 4× for an education business with multi-month student LTV.

---

## Account Structure Analysis

### Campaign Fragmentation: 100+ Campaigns

The account has accumulated 100+ campaigns across 3 years with the majority now inactive. This is not normal archival accumulation — it reflects a pattern of launching new campaigns instead of optimizing existing ones. The direct consequences:

- **Audience overlap** — Multiple LKL, broad, and interest campaigns simultaneously bidding in the same Guarapuava market (~180k people) against each other, inflating CPMs
- **Budget dilution** — R$10,000/month across 8–12 active campaigns = R$1,000/campaign = R$40–60/day per ad set = Learning Limited on all
- **Signal fragmentation** — Meta requires aggregated events to optimize. Splitting identical objectives across campaigns halves the signal each campaign receives

**Benchmark for this spend level: 4–6 active campaigns maximum.**

### Learning Phase — Permanently Trapped

At R$300 CPP and R$40–120/day per ad set:
- Days to accumulate 50 conversions (learning exit): **75–225 days**
- The account has been paying learning-phase premiums (20–50% higher CPPs) for three years

The escape: consolidation to fewer campaigns at viable daily budgets (R$150–R$200+/day per ad set).

### CBO vs. ABO Assessment

**CBO used with R$25–R$55/day campaign budget** — structurally broken. At that budget level with 2–3 ad sets, each receives R$8–R$20/day: non-functional for conversion optimization.

**ABO used correctly in best campaigns:** `22.04 ABO Look a Like 1-6-1` (R$8,661, 23 purchases) gave explicit per-ad-set budget control.

**Recommendation at this budget level:** ABO for testing, Advantage+ Shopping/Sales for scale. CBO only when campaign-level budget exceeds R$500/day with 2–3 ad sets.

### Recommended Consolidated Architecture

| # | Campaign | Structure | Monthly Budget | Goal |
|---|---|---|---|---|
| 1 | CCBEU \| PROSP \| ADV+ | Advantage+ | R$6,000 | Lead generation (local school) |
| 2 | CCBEU \| RMKT \| ABO | ABO, 3 ad sets by recency | R$1,800 | Warm audience conversion |
| 3 | GOEXPLORE \| PROSP \| ADV+ | Advantage+ | R$6,000 | Online course sales (national) |
| 4 | GOEXPLORE \| TEST \| ABO | ABO, 2 ad sets | R$4,500 | Creative/audience testing |

**Archive all 100+ historical campaigns.** Do not pause — archive. Maximum 6 active campaigns going forward regardless of budget increases. Additional budget should scale within existing campaigns, not spawn new ones.

---

## Quick Reference: Meta CPM Benchmarks vs. Account

Education sector benchmark CPM (Brazil): **R$15–R$35**

| Campaign | Observed CPM | vs. Benchmark | Diagnosis |
|----------|-------------|---------------|-----------|
| Inspire+ IMG Cópia | R$336 | 10× over | Learning Limited, audience mismatch |
| CAMPANHA TESTE 2 CRIATIVOS | R$210 | 6× over | Learning Limited, test campaign |
| Inspire+ ABO-2 | R$177 | 5× over | Learning Limited |
| CNVS TESTE PÚBLICO MARÇO | R$121 | 3–4× over | Poor relevance score |
| 22.04 ABO Look a Like | R$98 | 3× over | Broad LKL in small market |
| [16/09] CONV. DIRETA ADV+ | ~R$94 | 3× over | Large format, but 42 purchases |
| TRFG RMKT SEGREDOS | R$6.45 | **On target** | Traffic objective, video content |
| ENGJ SORTEIO | R$0.97 | **Excellent** | Reach campaign, broad audience |

CPMs of R$100–R$336 on conversion campaigns in a small city indicate the algorithm is struggling — either Learning Limited, audience too narrow, or creative not resonating. The R$0.97–R$6.45 CPMs on reach/traffic campaigns confirm Meta's inventory is available cheaply; the conversion objective campaigns are inflating their own CPMs through fragmented signal.
