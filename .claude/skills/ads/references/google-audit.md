# Google Ads Audit Checklist — 74 Checks

<!-- Updated: 2026-02-10 -->
<!-- Sources: Google Research, Claude Research, Gemini Research -->

## Category 1: Conversion Tracking (25% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G01 | gtag.js / GTM installed on all conversion pages | Verified firing | Partial coverage | Not installed | Critical |
| G02 | GTM container properly configured | Published, active | Unpublished changes | Not configured | High |
| G03 | Enhanced Conversions enabled (email/phone hashing) | Active + verified | Enabled, unverified | Disabled | Critical |
| G04 | Consent Mode v2 compliant (EU/EEA traffic) | Advanced mode active | Basic mode only | Not configured | Critical |
| G05 | Primary conversion actions correctly mapped | All primary tagged | Some misclassified | No primary actions | Critical |
| G06 | Attribution model: Data-Driven (DDA) selected | DDA active | Last-click only | Rule-based model | High |
| G07 | Cross-device tracking verified | Active + reporting | Enabled, no data | Disabled | Medium |
| G08 | GA4 import: no duplicate conversions | Deduplication active | Potential overlap | Duplicate counting | High |
| G09 | Conversion value assignment configured | Dynamic values | Static values | No values set | Medium |
| G10 | Phone call tracking active (if phone is goal) | Call tracking firing | Setup incomplete | Not configured | High |
| G11 | View-through conversion window appropriate | Matches sales cycle | Default (1 day) | Too long (>30 days) | Low |
| G12 | Conversion window matches product purchase cycle | Aligned | Partial | Default only | Medium |

---

## Category 2: Wasted Spend / Negatives (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G13 | Search Terms report reviewed within 14 days | <14 days | 14-30 days | >30 days / never | Critical |
| G14 | Negative keyword lists: ≥3 themed lists | ≥3 lists applied | 1-2 lists | No negatives | Critical |
| G15 | Irrelevant term spend <5% of total budget | <5% | 5-15% | >15% | High |
| G16 | Broad Match only used with Smart Bidding active | BM + Smart Bidding | BM + eCPC | BM + Manual CPC | Critical |
| G17 | Display Network excluded from Search campaigns | Excluded | Mixed network | Display on Search | High |
| G18 | Invalid click rate below 5% | <5% | 5-10% | >10% | High |
| G19 | Zero-conversion keywords reviewed (>100 clicks, 0 conv) | All reviewed + action | Some reviewed | Not reviewed | High |
| G20 | Brand and non-brand campaigns separated | Fully separated | Partial | Mixed in same campaign | Critical |
| G21 | Mobile app placement exclusions on Display | Applied | Partial | Not applied | Medium |
| G22 | Parked domain exclusions applied | Applied | Partial | Not applied | Medium |
| G23 | Close variant monitoring active | Reviewed monthly | Occasional review | Never reviewed | Medium |
| G24 | Negative keyword conflicts resolved | No conflicts | Minor conflicts | Blocking keywords | High |

---

## Category 3: Account Structure (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G25 | Naming convention consistent across all campaigns | Fully consistent | Mostly consistent | No convention | Low |
| G26 | Brand vs non-brand campaigns separated | Fully separated | Partial | Mixed | Critical |
| G27 | Ad groups tightly themed (≤15-20 keywords) | ≤15 keywords | 15-25 keywords | >25 keywords | Medium |
| G28 | RSA configured per ad group (≥1) | ≥1 RSA per group | Some missing RSA | Many without RSA | High |
| G29 | Labels applied for performance segmentation | Systematic labeling | Partial labels | No labels | Low |
| G30 | Shared budgets appropriate and not causing throttling | Healthy | Minor throttling | Heavy throttling | Medium |
| G31 | Geographic targeting: Presence only (not Presence or Interest) | Presence only | Mixed | Interest included | High |
| G32 | Search partners reviewed, excluded if underperforming | Reviewed + action | Not reviewed | Never reviewed | Medium |
| G33 | Display Network: off for Search campaigns | Off | On (intentional) | On (unintentional) | High |
| G34 | PMax brand exclusions applied | Applied | Partial | None (brand cannibal) | Critical |
| G35 | Shared negative keyword lists applied at account level | Applied | Partial | None | High |

---

## Category 4: Keywords & Quality Score (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G36 | Account impression-weighted Quality Score ≥7 | ≥7 | 5-6 | <5 | High |
| G37 | Critical QS (<3) keywords: <10% of account | <10% of account | 10-20% | >20% | High |
| G38 | Expected CTR component: Above Average | Above Average | Average | Below Average | Medium |
| G39 | Ad Relevance component: Above Average | Above Average | Average | Below Average | Medium |
| G40 | Landing Page Experience: Above Average | Above Average | Average | Below Average | High |
| G41 | Match type strategy appropriate for campaign goals | Correctly used | Overuse of BM | BM + Manual CPC | High |
| G42 | Zero-impression keywords reviewed and addressed | All reviewed | Some reviewed | Ignored | Low |
| G43 | Keyword-to-ad headline relevance maintained | ≥1 headline mirrors KW | Partial | No keyword insertion | Medium |
| G44 | Long-tail opportunities identified from Search Terms | Systematically | Occasionally | Never | Medium |
| G45 | Bid adjustments: device, location, audience configured | All adjusted | Partial | None | Medium |
| G46 | Keyword cannibalization between ad groups resolved | None | Minor | Significant | High |
| G47 | Negative keyword conflicts resolved (blocking good terms) | None | Minor | Blocking good terms | High |

---

## Category 5: Ads & Assets (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G48 | RSA count: ≥1 per ad group (ideally ≥2) | ≥2 per group | 1 per group | Some missing RSA | High |
| G49 | RSA unique headlines: ≥8 (target 12-15) | ≥12 unique | 8-11 | <8 unique | High |
| G50 | RSA unique descriptions: ≥3 | ≥4 | 3 | <3 | Medium |
| G51 | Ad Strength: Excellent or Good | Excellent | Good | Average or Poor | High |
| G52 | PMax asset groups: ≥20 images, ≥5 logos, ≥5 videos | All thresholds met | Partial | Below minimums | High |
| G53 | Sitelink extensions: ≥4 active with unique descriptions | ≥4 with desc | ≥4 no desc | <4 | High |
| G54 | Callout extensions: ≥4 unique callouts | ≥4 unique | 2-3 | <2 | Medium |
| G55 | Call extension: active if phone is a conversion goal | Active | Setup incomplete | Missing | High |
| G56 | Image extensions: active for search campaigns | Active | Pending review | Not used | Medium |
| G57 | Price extensions: active when product-based | Active | Not tested | Not used | Low |
| G58 | Promotion extensions: active during sales/promotions | Active during sales | Not used | Not configured | Low |
| G59 | Structured snippets: configured per campaign | Configured | Partial | None | Medium |
| G60 | Lead form extensions: tested where applicable | Tested | Not tested | Not configured | Medium |
| G61 | Business name + logo configured in assets | Configured | Partial | Not configured | Low |
| G62 | Ad copy messaging consistent with landing page | Consistent | Partial | Mismatch | High |

---

## Category 6: Settings & Bidding (10% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| G63 | Bid strategy appropriate for conversion volume | Matched to volume | Close match | Mismatch (too advanced) | Critical |
| G64 | Target CPA/ROAS within 20% of historical performance | Within 20% | 20-40% off | >40% off (unrealistic) | High |
| G65 | Learning phase: <25% of campaigns in learning | <25% | 25-50% | >50% | High |
| G66 | Budget-limited campaigns identified and addressed | None limited | Minor throttling | Major throttling | High |
| G67 | Ad scheduling: configured and reviewed | Configured | Set, unreviewed | Default only | Medium |
| G68 | Device bid adjustments based on actual performance | Data-driven | Guesses | Not configured | Medium |
| G69 | Audience segments: Observation mode configured | Applied | Partial | Not applied | Medium |
| G70 | Location targeting precision reviewed | Reviewed | Not reviewed | Default settings | Medium |
| G71 | Smart Bidding Exploration considered for tROAS campaigns | Evaluated | Not evaluated | N/A | Low |
| G72 | Portfolio bid strategies for low-volume (<15 conv) campaigns | Using portfolios | Not consolidated | Each has own strategy | Medium |
| G73 | Auto-applied recommendations: reviewed monthly | Reviewed, selective | Not reviewed | Auto-apply ON | High |
| G74 | Account linked to GA4 + Google Business Profile | Both linked | One linked | Neither linked | Medium |

---

## Severity Reference

| Severity | Score Multiplier | Description |
|----------|-----------------|-------------|
| Critical | 5× | Account-breaking issues: conversion loss, massive waste |
| High | 3× | Significant performance drag, should fix this week |
| Medium | 1.5× | Optimization opportunity, fix within month |
| Low | 0.5× | Nice-to-have improvements |

## Quick Reference: Most Common Critical Failures

1. **No Enhanced Conversions** — severe signal loss for Smart Bidding
2. **Broad Match + Manual CPC** — worst possible combination
3. **Brand/non-brand mixed** — cannibalization, inflated costs
4. **No negative keywords** — guaranteed wasted spend
5. **PMax without brand exclusions** — brand cannibalization
6. **Unrealistic tCPA target** — algorithm can't win auctions
7. **Missing Consent Mode v2 (EU/EEA)** — regulatory + tracking risk
8. **Learning Limited >50%** — algorithm stuck, unable to optimize
