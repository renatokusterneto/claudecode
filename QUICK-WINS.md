# CCBEU Guarapuava — Quick Wins
### High-impact fixes under 15 minutes each
> Generated: March 3, 2026 | Part of full audit in ADS-AUDIT-REPORT.md

---

## Priority Quick Wins (Fix Today)

### QW-01 — Set Frequency Caps on All Remarketing Campaigns
**Time:** 5 minutes | **Impact:** Stop burning remarketing budget on exhausted audiences

**Why it matters:**
- Remarketing Vídeos Isa: **11.5× frequency** — audience has seen this ad 11 times
- Remarketing Vídeos João: **10.3× frequency** — same problem
- Every impression above 8× costs the same but converts at near-zero rate

**How:**
1. Go to Ads Manager → Any active remarketing campaign → Ad Set level
2. Edit ad set → Scroll to "Optimization & Delivery" → Frequency Cap
3. Set: maximum 8 impressions per person per 14 days
4. Repeat for all remarketing ad sets

**Expected result:** CPM drops, CPP improves, audience stops associating CCBEU with annoyance.

---

### QW-02 — Create Automated Kill Rule in Meta Ads Manager
**Time:** 10 minutes | **Impact:** Prevent R$14,245+ wasted spend going forward

**Why it matters:**
5 campaigns violated the 3× Kill Rule and together wasted ~R$11,145 in excess spend. Automated rules prevent this from happening again without manual review.

**How:**
1. Ads Manager → Automated Rules (top right menu or Rules tab)
2. Create Rule → Apply to: Ad Sets
3. Condition: "Cost per Purchase" greater than R$900 AND "Purchases" less than 1 AND "Amount Spent" greater than R$300
4. Action: Pause ad set
5. Schedule: Check daily
6. Notification: Send email when rule triggers
7. Save rule

**Note:** Adjust R$900 threshold to 3× your actual target CPP. If target CPP is R$300, kill rule fires at R$900 spend with 0 conversions.

---

### QW-03 — Standardize Attribution Window on All Active Campaigns
**Time:** 10 minutes | **Impact:** Make CPP comparisons reliable; stop inflating results

**Why it matters:**
Currently three attribution windows in use. Campaigns with "1-day engaged-view" overcount conversions. You can't compare performance across campaigns using different windows.

**How:**
1. For each active campaign → Go to Campaign level → Edit
2. Scroll to "Attribution Setting"
3. Change all to: **7-day click / 1-day view** (do NOT add engaged-view)
4. Save
5. Note: changing attribution window does NOT reset learning phase

**Expected result:** More accurate CPP data. Some campaigns will show higher CPP than previously reported — this is more accurate, not a performance drop.

---

### QW-04 — Archive All Inactive/Completed Campaigns
**Time:** 10 minutes | **Impact:** Cleaner account view, easier optimization, faster reporting

**Why it matters:**
100+ campaigns, all inactive, clutter the account. Old "Inactive" campaigns still show in reporting and make it impossible to quickly identify what's currently running and performing. Archived campaigns remain in historical data but disappear from the default view.

**How:**
1. Ads Manager → Campaigns tab
2. Filter by status: Inactive + Completed + Archived
3. Select all (checkbox top left)
4. Actions dropdown → Archive
5. Confirm

**Note:** This does not delete campaigns or data. All historical performance data remains accessible via the "Archived" filter.

---

### QW-05 — Check CAPI Status in Events Manager
**Time:** 5 minutes | **Impact:** Diagnose the #1 data quality issue in the account

**Why it matters:**
The account is likely missing 30–40% of conversion data due to iOS14 signal loss. Verifying CAPI status is the first step to fixing it.

**How:**
1. Meta Business Manager → Events Manager
2. Select your Pixel → Click "Overview"
3. Look for "Conversions API" section
4. If it shows "Not Active" or "Inactive" → CAPI is not configured (implement immediately per Action Plan)
5. Also check "Event Match Quality" tab — target ≥8.0 for Purchase event

**Document what you find** — screenshot the current EMQ score and CAPI status before any changes.

---

### QW-06 — Check Aggregated Event Measurement (AEM) Setup
**Time:** 5 minutes | **Impact:** Ensure iOS14 campaigns receive proper delivery

**Why it matters:**
AEM requires you to configure and rank the 8 conversion events you care about most. Without this, iOS14 conversion campaign delivery is degraded.

**How:**
1. Meta Business Manager → Events Manager → Pixel → Settings
2. Scroll to "Aggregated Event Measurement"
3. Configure events in priority order:
   - Priority 1: Purchase (enrollment / GoExplore purchase)
   - Priority 2: Lead (form submission)
   - Priority 3: InitiateCheckout (for GoExplore pricing page)
   - Priority 4: ViewContent (landing page view)
   - Priorities 5–8: Additional micro-conversions as needed
4. Save configuration

---

### QW-07 — Verify Primary Conversion Event Is Consistent
**Time:** 10 minutes | **Impact:** Fix the most immediately confusing performance reporting problem

**Why it matters:**
Campaigns currently optimizing for: purchases, leads, WhatsApp conversations, link clicks, thruplays, post engagements, reach, impressions. These generate completely different audience types.

**How:**
1. Open Ads Manager
2. For each active conversion campaign: check the optimization event (Ad Set → Optimization & Delivery → Conversion Event)
3. Ensure all acquisition campaigns optimize for ONE event: **Purchase** (for GoExplore Hotmart) or **Lead** (for school enrollment form at forms.kommo.com/rtltlwc)
4. Any campaign currently optimizing for traffic or engagement objectives with a conversion goal → change objective or pause

---

## Medium Priority Quick Wins (This Week)

### QW-08 — Create Audience Overlap Check Between Active Campaigns
**Time:** 10 minutes | **Impact:** Identify cannibalization across simultaneous campaigns

**How:**
1. Ads Manager → Audiences (left menu)
2. Select the custom audiences / lookalike audiences used by your active campaigns
3. Checkbox select multiple audiences → "Show Audience Overlap" button
4. Any overlap >20% between prospecting audiences signals they're bidding against each other

---

### QW-09 — Add "Existing Students" Exclusion to All Prospecting Campaigns
**Time:** 10 minutes per campaign | **Impact:** Stop paying to reach people already enrolled

**How:**
1. Export current enrolled students from Kommo CRM (name + email + phone)
2. Ads Manager → Audiences → Create Audience → Customer List
3. Upload the list (Meta hashes all data before use)
4. In each prospecting campaign's ad set → Exclusions → Add this custom audience
5. Label the audience "Existing Students — Exclude from Prospecting"

---

### QW-10 — Enable Advanced Matching on Meta Pixel
**Time:** 5 minutes | **Impact:** Improve EMQ score and audience match rate

**How:**
1. Events Manager → Pixel → Settings
2. Scroll to "Advanced Matching"
3. Enable all available fields: Email, Phone Number, Name, Date of Birth, Gender, City, State, ZIP
4. If your website forms capture any of these fields, enable the matching
5. For GoExplore (Hotmart): check whether Hotmart's native Meta pixel integration passes advanced matching fields

**Note:** This alone can improve EMQ by 1–3 points without CAPI.

---

## Score Impact Summary

| Quick Win | Category | Estimated Score Impact |
|-----------|----------|----------------------|
| QW-01 Frequency caps | Creative | +3–5 pts |
| QW-02 Kill rule | Structure | +2–3 pts |
| QW-03 Attribution standardization | Tracking | +4–6 pts |
| QW-04 Archive inactive campaigns | Structure | +1–2 pts |
| QW-05 CAPI check | Tracking | Diagnostic only |
| QW-06 AEM setup | Tracking | +3–5 pts |
| QW-07 Conversion event consistency | Tracking | +5–8 pts |
| QW-08 Audience overlap check | Audience | Diagnostic only |
| QW-09 Student exclusion | Audience | +2–3 pts |
| QW-10 Advanced matching | Tracking | +2–4 pts |

**Completing QW-01 through QW-07 this week could move the Meta Health Score from 40 → 55–60 (Grade C) without changing a single campaign or spending more money.**

---

## What These Quick Wins Won't Fix
These quick wins address symptoms. The structural problems — budget fragmentation, no CAPI, account consolidation — require the full Action Plan (see ACTION-PLAN.md) and cannot be resolved in 15-minute increments.

Priority for maximum impact: **CAPI implementation + account consolidation** (see Week 1 of ACTION-PLAN.md).
