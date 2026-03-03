# CCBEU Guarapuava — 30-Day Paid Ads Action Plan
> Generated: March 3, 2026 | Companion to ADS-AUDIT-REPORT.md and QUICK-WINS.md

---

## Overview

| Horizon | Goal | Expected Outcome |
|---------|------|-----------------|
| **Week 1 (Days 1–7)** | Fix critical infrastructure + kill waste | Stop data loss, stop budget bleed, establish baseline |
| **Week 2 (Days 8–14)** | Consolidate account structure | 4–6 campaigns max, proper budgets, clean learning phase |
| **Week 3–4 (Days 15–30)** | Optimize, test, and connect attribution | Lower CPP, CRM-connected attribution, scalable structure |
| **Ongoing** | Monthly review cadence | Systematic performance management |

---

## Week 1 — Critical Fixes (Days 1–7)

### Day 1: Diagnose Tracking Infrastructure

**Action 1.1 — Audit Pixel & CAPI Status**
- Go to Events Manager → Pixel → Overview
- Screenshot the current CAPI status (Active / Inactive / Not configured)
- Screenshot the Event Match Quality (EMQ) score for Purchase event
- Document which events are firing and their firing frequency

**Action 1.2 — Map the Conversion Funnel**
Define the single conversion event for each product:
- **CCBEU Local School:** `Lead` event = form submission at forms.kommo.com/rtltlwc
- **GoExplore Online:** `Purchase` event = Hotmart purchase completion
- Document this decision and share with whoever manages the website/Hotmart

**Action 1.3 — Check AEM Configuration**
- Events Manager → Pixel → Settings → Aggregated Event Measurement
- Configure priority event ranking (see QW-06 in QUICK-WINS.md)

---

### Days 2–3: Connect Conversions API (CAPI) via Zapier

This is the single highest-leverage technical action in the entire plan. Priority above all else.

**Method: Zapier + Kommo CRM → Meta CAPI**

**Step 1 — Create Meta Dataset**
1. Business Manager → Events Manager → Datasets → Create Dataset
2. Link to your Pixel (do not create a separate pixel)
3. Note the Dataset ID

**Step 2 — Generate Meta System User Token**
1. Business Manager → System Users → Create System User (Admin level)
2. Add the pixel/dataset asset with CAPI permission
3. Generate access token → Save securely

**Step 3 — Configure Zapier Triggers**
Create these 3 Zaps (Kommo → Meta CAPI):

| Zap | Kommo Trigger | Meta Event | Kapitel |
|-----|---------------|-----------|---------|
| Zap 1 | New Lead created in Kommo | `Lead` | Top funnel |
| Zap 2 | Pipeline stage changed to "Orientação Agendada" | `Schedule` | Mid funnel |
| Zap 3 | Pipeline stage changed to "Matriculado" | `Purchase` | Bottom funnel |

**Step 4 — Include Hashed User Data in Each Event**
Each Zap should pass to Meta:
- `email` (SHA-256 hashed — Zapier can do this automatically)
- `phone` (SHA-256 hashed, E.164 format: +5542XXXXXXXXX)
- `client_ip_address` (from Kommo lead source if available)
- `event_source_url` (the landing page URL where the lead originated)
- `external_id` (Kommo contact/deal ID)

**Step 5 — Verify Deduplication**
- Set `event_id` to a unique string per event (e.g., `lead_[kommo_id]_[timestamp]`)
- Meta will deduplicate browser pixel events against CAPI events using this ID

**Expected outcome:** EMQ score improvement within 48–72 hours. Events Manager will show CAPI alongside browser events. Expect 20–40% more conversions reported immediately.

---

### Day 3: Kill Waste — Apply Quick Wins QW-01 through QW-07

Execute all immediate quick wins from QUICK-WINS.md:
- QW-01: Set frequency caps on remarketing (5 min)
- QW-02: Create automated kill rule at 3× CPP (10 min)
- QW-03: Standardize attribution to 7-day click / 1-day view (10 min)
- QW-04: Archive all inactive/completed campaigns (10 min)
- QW-07: Fix conversion event inconsistency on active campaigns (10 min)

**Total time: ~45 minutes. Prevents all future 3× Kill Rule waste.**

---

### Days 4–5: Upload CRM Audiences to Meta

**Action 4.1 — Export Student Lists from Kommo**
Export three lists in CSV format (Name, Email, Phone):
1. **Currently Enrolled Students** — to exclude from prospecting
2. **Past Students (churned)** — win-back retargeting
3. **Leads who did not enroll in past 180 days** — re-engagement

**Action 4.2 — Upload as Custom Audiences**
1. Ads Manager → Audiences → Create → Customer List
2. Upload each list separately with clear names:
   - "Alunos Ativos — Excluir Prospecção"
   - "Ex-Alunos — Win Back"
   - "Leads Não Convertidos — 180 dias"
3. Meta hashes all data before use (compliant with LGPD)

**Action 4.3 — Create Lookalike Audiences from Best Customers**
From the "Currently Enrolled Students" list (only students enrolled 6+ months — highest LTV):
1. Ads Manager → Audiences → Create → Lookalike Audience
2. Source: "Alunos Ativos" custom audience
3. Create three audiences: 1%, 2%, and 3% similarity
4. Location: Paraná (for physical school) OR Brazil (for GoExplore)

**Note:** A minimum of 1,000 source audience members is required for reliable Lookalike creation. If your enrolled student list is below 1,000, combine with past 3-year enrollments.

---

### Days 6–7: Pause or Restructure Non-Converting Active Campaigns

Review every currently active or recently active campaign:
- If CPP > 3× target AND conversions < 1 → Pause immediately
- If campaign uses traffic/engagement objective for conversion goal → Change objective or pause
- If campaign is "CNVS" type running alongside conversion campaigns for same audience → Pause

**Do not delete anything.** Pause and document the reason. Historical data is valuable for future reference.

---

## Week 2 — Account Consolidation (Days 8–14)

### The New Account Architecture

Launch the consolidated campaign structure. Maximum 4–6 active campaigns at any time.

**Campaign 1: CCBEU | PROSP | ADV+ | 202603**
- Type: Advantage+ Shopping Campaign (or Sales Campaign)
- Objective: Conversions → Lead (form submission)
- Budget: R$200/day minimum (R$6,000/month)
- Audiences: Broad (Advantage+ handles audience selection)
- Creative: 4–6 static images + 2 short videos (30s or less)
- Creative content: "Só o CCBEU tem..." differentiators + cultural event footage
- Exclusions: Alunos Ativos custom audience
- Attribution: 7-day click / 1-day view
- **Do not edit this campaign for 7 days after launch. Let it learn.**

**Campaign 2: CCBEU | RMKT | ABO | 202603**
- Type: ABO (manual ad set control)
- Objective: Conversions → Lead
- Budget: R$60/day (R$1,800/month)
- Ad Sets (3, one per recency segment):
  - Hot: Website visitors last 7 days — budget R$30/day
  - Warm: Video viewers + page engagers last 30 days — budget R$20/day
  - Cold: Leads Não Convertidos 180 dias list — budget R$10/day
- Creative: Testimonial-based content, urgency-driven ("Last few spots for March intake")
- Frequency cap: 8× per 14 days per ad set
- **Review weekly. Replace creative if frequency >6× per 14 days.**

**Campaign 3: GOEXPLORE | PROSP | ADV+ | 202603**
- Type: Advantage+ Sales Campaign
- Objective: Conversions → Purchase (Hotmart purchase event)
- Budget: R$200/day (R$6,000/month)
- Location: Brazil (national)
- Audiences: Broad + interest signals around language learning, English, international career
- Creative: 4 static images + 2 videos emphasizing convenience (live classes + AI Teacher 24/7)
- Exclusions: GoExplore existing subscribers
- Attribution: 7-day click / 1-day view

**Campaign 4: GOEXPLORE | TEST | ABO | 202603** (active only during testing periods)
- Type: ABO
- Objective: Conversions → Purchase
- Budget: R$150/day
- Purpose: Test new creative concepts, new offers, new audiences
- Kill rule: Pause any ad set spending R$900+ with 0 purchases
- Rotate creatives: maximum 4 weeks before retiring

**Total: 4 campaigns, estimated R$460/day = R$14,000/month.**

---

### Naming Convention Going Forward

All new campaigns use this format:
```
[PRODUCT] | [STAGE] | [STRUCTURE] | [MONTH]
```

Examples:
- `CCBEU | PROSP | ADV+ | 202604`
- `CCBEU | RMKT | ABO | 202604`
- `GOEXPLORE | PROSP | ADV+ | 202604`
- `GOEXPLORE | TEST | ABO | CRIATIVO-VIDEO | 202604`

Ad Set naming:
```
[AUDIENCE TYPE] | [SIZE/SEGMENT] | [RECENCY if RMKT]
```

Examples:
- `LAL-1pct-Alunos | Paraná`
- `BROAD | Advantage+ | Paraná`
- `RMKT | Website | 7d`
- `RMKT | VideoViewer | 30d`

---

### Budget Reallocation Table (Week 2)

| Campaign | Daily Budget | Monthly | Purpose |
|----------|-------------|---------|---------|
| CCBEU PROSP ADV+ | R$200 | R$6,000 | Main local school acquisition |
| CCBEU RMKT ABO | R$60 | R$1,800 | Local warm audience conversion |
| GOEXPLORE PROSP ADV+ | R$200 | R$6,000 | National online course acquisition |
| GOEXPLORE TEST ABO | R$150 | R$4,500 | Creative/audience testing |
| **Total Meta** | **R$610/day** | **~R$18,300** | |

If current monthly Meta spend is below R$18,300: scale up gradually. Increase budgets by maximum 20% every 3–5 days to avoid triggering learning phase resets.

If current monthly Meta spend is R$5,000–R$10,000: start with Campaigns 1 and 3 only at R$150/day each (R$9,000/month total) until CAPI is confirmed working and CPP stabilizes.

---

## Weeks 3–4 — Optimize & Measure (Days 15–30)

### Week 3 — Performance Review and Creative Expansion

**Action 3.1 — First Optimization Window**
After 7 days of running Campaigns 1 and 3 (Advantage+):
- Do NOT change targeting or budget if campaigns are still in learning phase
- Check: Has each campaign generated ≥5 conversions in first 7 days?
- If yes: campaign is on track. Do not intervene.
- If no: check CAPI is firing correctly before assuming campaign is failing

**Action 3.2 — Creative Expansion**
Launch 2 new creative variations for each Advantage+ campaign:
- CCBEU: One video featuring Star Program spaces (VR, Cinema, Cooking) — "Só o CCBEU tem isso"
- CCBEU: One static with C1 Guarantee proof point — "Se não chegar ao C1, estuda de graça"
- GoExplore: One video showing AI Teacher 24/7 WhatsApp interaction
- GoExplore: One static with social proof (student testimonial, transformation story)

**Meta creative guidelines for this account:**
- Aspect ratio: 1:1 for feed, 9:16 for Stories/Reels — produce both for every creative
- Video length: 15–30 seconds for Reels (shorter hooks, cut at 3s or earlier)
- Static images: Use genuine in-school photography (Star Program events, student life)
- Avoid stock imagery — Guarapuava is a trust-based market, authenticity matters

**Action 3.3 — Remarketing Creative Refresh**
For Campaign 2 (CCBEU RMKT):
- Replace any remarketing creatives that have been running >3 weeks
- New angle: address the specific objection at each recency stage:
  - Hot (7-day visitors): "Você visitou nosso site — veja o que te espera na orientação gratuita"
  - Warm (30-day engagers): Student success story with result-specific hook
  - Cold (180-day unengaged leads): Re-engagement offer or event invitation

---

### Week 4 — Attribution & MER Setup

**Action 4.1 — Verify Full Attribution Chain**
Confirm the attribution chain is working end-to-end:
```
Meta Ad Click
    ↓ (UTM parameters)
Landing Page (ccbeuguarapuava.com.br)
    ↓ (Pixel: Lead event fires on form submission)
Kommo CRM (lead created with UTM source captured)
    ↓ (Zapier: CAPI fires Lead event with hashed email)
Meta CAPI (Lead event received and deduplicated)
    ↓
Orientation call booked (Kommo stage change)
    ↓ (Zapier: CAPI fires Schedule event)
Enrollment confirmed (Kommo stage: Matriculado)
    ↓ (Zapier: CAPI fires Purchase event)
Meta CAPI (Purchase event received — this is your true CAC)
```

Verify this chain by enrolling a test lead manually through Kommo and checking Events Manager for the corresponding CAPI events.

**Action 4.2 — Establish Monthly MER Dashboard**

Create a simple Google Sheets tracker:

| Month | Total Revenue (from Kommo enrolled students × ticket) | Google Ads Spend | Meta Ads Spend | Total Spend | MER |
|-------|------|---------|---------|---------|-----|
| March 2026 | R$_____ | R$_____ | R$_____ | R$_____ | ___× |

**MER target for CCBEU (education, multi-month LTV):**
- Minimum acceptable: 3× (every R$1 in ads returns R$3 in revenue)
- Target: 5× (including LTV from multi-year students)
- GoExplore separately: depends on course price and LTV/churn rate

**Action 4.3 — 30-Day Performance Report**
At end of Week 4, pull:
- Meta CPP for each active campaign (using CAPI-attributed data)
- Total leads generated by campaign + source
- Lead-to-orientation conversion rate (from Kommo pipeline)
- Lead-to-enrollment conversion rate (from Kommo pipeline)
- Blended CAC (total Meta spend ÷ total new enrollments)
- MER (if Google Ads data is available)

Compare to these benchmarks:
- Target CPP (lead): R$150–R$200 with CAPI-connected attribution
- Target CPP (enrollment): R$400–R$600 blended (acknowledging 30–50% lead-to-enrollment rate)
- Target LTV:CAC: ≥3× (first-year revenue vs. CAC)

---

## Ongoing Cadence

### Weekly Review (30 minutes every Monday)
1. Check active campaigns for 3× Kill Rule violations (automated rule should alert)
2. Review frequency per ad set — cap remarketing at 8×/14 days
3. Check CAPI event volume — any drop signals a tracking issue
4. Review CPP vs. target for each campaign
5. Pause any underperformer; increase budget by 20% on overperformer (only if stable for 7+ days)

### Monthly Review (2 hours, first week of each month)
1. Pull full month MER report
2. Archive previous month's campaigns (or consolidate into ongoing)
3. Plan creative refresh for next month
4. Review audience freshness — re-upload CRM lists
5. Review creative frequency — retire any creative with frequency >8× or CTR decline >20% vs. launch week

### Quarterly Review (4 hours)
1. Full account audit against the 46-check Meta framework
2. Google Ads audit (if data available)
3. Platform budget reallocation based on MER by channel
4. Lookalike audience refresh (re-export top 25% LTV customers from Kommo)
5. Seasonal planning (enrollment periods, cultural events, Black November)

---

## CCBEU Seasonal Calendar — Ad Planning

| Month | Event | Campaign Recommendation |
|-------|-------|------------------------|
| January | Back-to-school enrollment | Increase CCBEU prospecting budget 30%. Emphasize Kids/Teens. |
| March | Q1 end — adults reassessing goals | Adult Empower/Advanced push. English = career advantage. |
| April–May | Mid-year enrollment | GoExplore national push. Adults who failed resolution. |
| July | School holidays — parents active | Kids/Teens focus. Star Program showcase. Cultural events FOMO. |
| August | Pre-semester | Teens/Adults enrollment. C1 guarantee angle. |
| September | Cultural events begin | Perspectives film, event content. Retention + referral ads. |
| October | Pre-Black November | Creative pre-production. Budget reserve for November. |
| November | Black November | Increase Meta budget 40–60%. Urgency + offer campaigns. |
| December | Year-end graduation | Retention + new year enrollment for January. |

---

## Google Ads — Missing Data Action

**Immediate:** Request Google Ads access and share campaign export for full audit.

While waiting, implement these zero-cost improvements:
1. Verify Google Ads conversion tracking fires the same events as Meta CAPI (consistency)
2. Confirm that the GA4 property (ID: 399524382) is receiving all lead events
3. Verify that Google Tag Manager is firing both Google Ads and Meta Pixel tags on the form submission thank-you page

---

## Resources Needed to Execute This Plan

| Resource | Current Status | Action Needed |
|---------|---------------|--------------|
| Zapier | Already in stack | Configure 3 new Zaps for CAPI |
| Kommo CRM | Already in use | Export 3 audience lists + configure pipeline stage triggers |
| Meta Business Manager admin | Required | Verify access for CAPI, AEM, and Audiences |
| Website admin (WordPress/Elementor) | Required | Ensure form submissions fire Pixel Lead event |
| Hotmart | Already in use for GoExplore | Verify Purchase pixel firing on order confirmation page |
| Creative production | Ongoing | 2 new statics + 1 new video per campaign per month |
| Google Ads access | Missing from audit | Request export + admin access |

---

## Expected Results at 30 Days

If Weeks 1–4 are executed:

| Metric | Before Audit | Expected at Day 30 |
|--------|-------------|-------------------|
| Meta Health Score | 40/100 (D) | 58–65/100 (C) |
| CPP (lead, CAPI-attributed) | R$275–R$400 | R$180–R$250 |
| Monthly wasted spend | R$2,000–R$3,000/month | <R$500 |
| Active campaigns | 100+ (historical) | 4–6 |
| Learning Limited ad sets | >80% | <30% |
| CAPI status | Not active | Active, EMQ ≥7.0 |
| Attribution consistency | 3 windows | 1 standard window |

**At 60–90 days**, with CAPI properly connected and Advantage+ campaigns past the learning phase:
- CPP target: R$150–R$200 (lead) / R$400–R$500 (enrollment)
- Meta Health Score target: 70–78/100 (B)
- MER target: ≥4× (requires Google Ads data for full calculation)
