# Meta Ads Audit Checklist — 46 Checks

<!-- Updated: 2026-02-10 -->
<!-- Sources: Meta Research, Claude Research, Gemini Research -->

## Category 1: Pixel & CAPI Health (30% weight)

The most critical category — without accurate data, nothing else matters.

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| M01 | Meta Pixel installed on all key pages | All pages verified | Partial coverage | Not installed | Critical |
| M02 | Conversions API (CAPI) active — server-side tracking | Active + verified | Partial / testing | Disabled | Critical |
| M03 | Event deduplication configured (event_id matching ≥90%) | ≥90% dedup rate | 60-90% | <60% or none | Critical |
| M04 | EMQ (Event Match Quality) — Purchase event: ≥8.0 | ≥8.0 | 6.0-7.9 | <6.0 | Critical |
| M05 | EMQ — all key standard events ≥6.0 | All ≥6.0 | Some <6.0 | Multiple <4.0 | High |
| M06 | Advanced Matching: email, phone, external_id configured | All 3 active | 1-2 active | None | High |
| M07 | Domain verification in Business Manager | Verified | Pending | Not verified | High |
| M08 | Aggregated Event Measurement (AEM): top 8 events configured | All 8 ranked | <8 ranked | Not configured | High |
| M09 | Standard events used (not custom) for primary conversions | All standard | Mix | Custom only | Medium |
| M10 | Attribution window: 7-day click / 1-day view | Correctly set | Default (7-day only) | Non-standard | Medium |
| M11 | Data freshness: no >1hr lag in Events Manager | <30 min lag | 30min-1hr | >1hr or gaps | Medium |

---

## Category 2: Creative Diversity & Fatigue (30% weight)

Creative is the #1 lever in Meta advertising.

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| M12 | ≥3 creative formats active (image, video, carousel, collection) | ≥3 formats | 2 formats | 1 format only | High |
| M13 | ≥5 creatives per ad set | ≥5 | 3-4 | 1-2 | High |
| M14 | 9:16 vertical video present for Reels/Stories placements | Present + optimized | Present, not optimized | Missing | High |
| M15 | Creative fatigue: no CTR drop >20% over 14 days (active creatives) | No fatigue | Some fatigue (<40%) | Multiple >40% decline | High |
| M16 | Video hook rate: <50% skip in first 3 seconds | <30% skip | 30-50% skip | >50% skip | High |
| M17 | UGC or social-native content: ≥30% of creative assets | ≥30% UGC | 10-30% UGC | <10% (all branded) | High |
| M18 | Advantage+ Creative enabled and tested | Enabled + tested | Enabled, untested | Disabled | Medium |
| M19 | Creative freshness: new creative tested within last 30 days | <14 days | 14-30 days | >30 days | High |
| M20 | Prospecting frequency: <3.0 per 7-day window | <3.0 | 3.0-5.0 | >5.0 | High |
| M21 | CTR benchmark: ≥1.0% for prospecting campaigns | ≥1.0% | 0.5-1.0% | <0.5% | High |
| M22 | Before/after images: compliant with policy | Compliant | Minor risks | Violating policy | High |
| M23 | Dynamic Creative (DCO) tested vs static | Tested | Not tested | N/A | Medium |

---

## Category 3: Account Structure (20% weight)

Structure determines algorithm efficiency and learning speed.

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| M24 | Campaign count appropriate (≤5 active per segment/product) | ≤5 | 5-10 | >10 (fragmented) | High |
| M25 | CBO/ABO appropriate for budget level | Correctly applied | Partial mismatch | Wrong for budget | High |
| M26 | Learning Limited status: <30% of active ad sets | <30% | 30-50% | >50% | Critical |
| M27 | No unnecessary edits during learning phase | No edits | Minor edits | Frequent resets | High |
| M28 | Advantage+ Sales Campaigns tested (e-commerce) | Tested + active | Tested, inactive | Never tested | Medium |
| M29 | Audience overlap <20% across ad sets | <20% | 20-40% | >40% | High |
| M30 | Budget per ad set: ≥5× target CPA | ≥5× CPA | 2-5× CPA | <2× CPA | Critical |
| M31 | Campaign objective matches business goal | Perfectly aligned | Minor mismatch | Misaligned | High |
| M32 | UTM parameters on all ad destination URLs | 100% coverage | >80% | <80% | Medium |
| M33 | Attribution setting configured: 7-day click / 1-day view | Correct | Default | Non-standard | Medium |
| M34 | Special Ad Category declared (Housing/Employment/Credit/Financial) | Declared | Not needed | Not declared (risk) | Critical |

---

## Category 4: Audience & Targeting (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| M35 | Audience overlap between ad sets <20% | <20% | 20-40% | >40% | High |
| M36 | Custom Audience freshness: created/updated within 180 days | <90 days | 90-180 days | >180 days | Medium |
| M37 | Lookalike source quality: ≥1,000 high-value users as seed | ≥1,000 | 300-1,000 | <300 | High |
| M38 | Advantage+ Audience tested alongside manual targeting | Tested + compared | Tested, no comparison | Never tested | Medium |
| M39 | Purchasers/converters excluded from prospecting | Excluded | Partial | Not excluded | High |
| M40 | First-party customer list uploaded + used as Lookalike seed | Uploaded + active | Uploaded, unused | Not uploaded | High |
| M41 | Retargeting windows segmented: hot (1-7d), warm (7-30d), cold (30-90d) | All segments | 1-2 segments | Not segmented | Medium |
| M42 | Broad targeting tested (no audience restrictions) | Tested + compared | Not tested | Relying only on narrow | Low |
| M43 | Detailed targeting exclusions migrated (removed Mar 2025) | Strategy updated | Partially updated | Still relying on old | Medium |
| M44 | Retargeting audiences updated: video viewers, page engagers, lead openers | All present | Some present | Not configured | Medium |
| M45 | Customer list suppression: existing customers excluded from acquisition | Excluded | Partial | Not excluded | High |
| M46 | Interest-based targeting reviewed for relevance and size | Reviewed <30 days | Reviewed, old | Never reviewed | Low |

---

## Severity Reference

| Severity | Score Multiplier | Description |
|----------|-----------------|-------------|
| Critical | 5× | Account-breaking: severe data loss, algorithm starvation |
| High | 3× | Major performance drag, fix this week |
| Medium | 1.5× | Optimization opportunity |
| Low | 0.5× | Nice-to-have |

## Key Thresholds Quick Reference

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| EMQ (Purchase) | ≥8.0 | 6.0-7.9 | <6.0 |
| Deduplication rate | ≥90% | 60-90% | <60% |
| CTR decline (14d) | <20% | 20-40% | >40% |
| Learning Limited % | <30% | 30-50% | >50% |
| Prospecting frequency (7d) | ≤3.0 | 3-5 | >5.0 |
| Budget per ad set | ≥5× CPA | 2-5× CPA | <2× CPA |
| CAPI active | ✅ Yes | — | ❌ No |
| Creative formats active | ≥3 | 2 | 1 |

## Most Common Critical Failures

1. **No CAPI** — 30-40% data loss from iOS 14.5+
2. **EMQ <4.0 for Purchase** — poor attribution accuracy, Smart Delivery impaired
3. **Learning Limited >50%** — algorithm cannot optimize
4. **Budget <5× CPA per ad set** — algorithm starved for learning
5. **Special Ad Category not declared** — policy violation, account at risk
6. **No customer exclusions** — showing acquisition ads to existing customers
7. **No CAPI + Pixel deduplication** — double-counting conversions
8. **Creative >30 days with declining CTR** — fatigue killing performance
