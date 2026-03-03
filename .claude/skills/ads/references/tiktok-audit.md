# TikTok Ads Audit Checklist

<!-- Updated: 2026-02-11 -->
<!-- Sources: Claude Research, Gemini Research -->
<!-- Total Checks: 25 | Categories: 5 | See scoring-system.md for weights and algorithm -->

## Quick Reference

| Category | Weight | Check Count |
|----------|--------|-------------|
| Creative Quality | 30% | T05-T10, T20-T25 (12 checks) |
| Technical Setup | 25% | T01-T02 (2 checks) + Advanced Matching (1) |
| Bidding & Learning | 20% | T11-T13 (3 checks) |
| Structure & Settings | 15% | T03-T04, T14-T16 (6 checks) |
| Performance | 10% | T17-T19 (3 checks) |

---

## Creative Quality (30% weight)

| ID | Check | Severity | Pass | Warning | Fail |
|----|-------|----------|------|---------|------|
| T05 | Creative volume per ad group | Critical | ≥6 creatives per ad group | 3-5 creatives | <3 creatives |
| T06 | Video format compliance | Critical | All video 9:16 vertical 1080×1920 | Mixed formats (some vertical) | Horizontal or square video only |
| T07 | Native-style content | High | Content looks like organic TikTok, not polished ad | Partially native (mix) | Corporate/studio look kills performance |
| T08 | Hook speed | High | Clear hook within 1-2 seconds of video start | Hook within 3-4 seconds | No clear hook; slow intro >5 seconds |
| T09 | Active creative age (declining) | High | No creative with declining CTR active >7 days | Declining creative 7-14 days old | Declining creative >14 days still running |
| T10 | Spark Ads | Medium | Spark Ads tested (~3% CTR vs ~2% standard) | — | Spark Ads never tested |
| T20 | TikTok Shop integration | Medium | Shop integration active for e-commerce (if applicable) | Shop set up but not fully configured | No Shop for eligible e-commerce |
| T21 | Video Shopping Ads | Medium | VSA format tested for Shop integration | — | Not tested |
| T22 | Caption SEO | Medium | Captions include high-intent keywords naturally | Generic captions | No caption optimization |
| T23 | Audio on all ads | Critical | All video ads have audio (never silent) | One ad running silent | Multiple silent ads |
| T24 | Custom CTA button | Low | Custom CTA configured, not default "Learn More" | — | Default CTA only |
| T25 | Safe zone compliance | High | All critical text/logos within X:40-940px, Y:150-1470px | Minor safe zone violations | Critical content (CTA, logo) in unsafe zone |

---

## Technical Setup (25% weight)

| ID | Check | Severity | Pass | Warning | Fail |
|----|-------|----------|------|---------|------|
| T01 | TikTok Pixel installed | Critical | Pixel firing on all pages with standard events | Pixel on most pages (>90%) | Pixel not installed or broken |
| T02 | Events API + ttclid passback | Critical | Events API active AND ttclid captured on first load, stored, and sent with ALL conversion events | Events API active but ttclid not passed | No Events API (client-side only) |
| T-AM | Advanced Matching | High | Hashed email and/or phone passed with events | One parameter configured | No advanced matching parameters |

### ttclid Passback Requirement
The TikTok Click ID (ttclid) is the most critical tracking element:
```
Step 1: Capture ttclid from URL on first page load
         ?ttclid=XXXXXXXXXXXXXXXX
Step 2: Store in session/cookie/server
Step 3: Send ttclid with ALL conversion events via Events API

WITHOUT ttclid: TikTok over-claims conversions through modeled attribution
               and optimization signals are degraded
```

### Standard Events to Configure
- `ViewContent` — product/service page views
- `AddToCart` — cart additions (e-commerce)
- `InitiateCheckout` — checkout begins
- `Purchase` — completed purchase
- `CompleteRegistration` — form completion, sign-up
- `Lead` — lead gen submissions

---

## Bidding & Learning (20% weight)

| ID | Check | Severity | Pass | Warning | Fail |
|----|-------|----------|------|---------|------|
| T11 | Bid strategy matches goal | High | Lowest Cost for volume; Cost Cap for margin control | Bid Cap (use sparingly) | No bid strategy review; default only |
| T12 | Budget sufficiency | Critical | Daily budget ≥50x target CPA per ad group | Daily budget 20-49x CPA | Daily budget <20x CPA |
| T13 | Learning phase health | Critical | ≥50 conversions per 7 days per ad group (exit learning) | 30-50 conversions/7 days (partial learning) | <30 conversions/7 days (stuck in learning) |

### Learning Phase Rules
- Never edit campaigns/ad groups during active learning phase
- Edits that reset learning: budget change, bid strategy change, audience change, creative change
- If learning is stuck: broaden audience, increase budget, or switch to higher-funnel event

---

## Structure & Settings (15% weight)

| ID | Check | Severity | Pass | Warning | Fail |
|----|-------|----------|------|---------|------|
| T03 | Campaign separation | High | Separate campaigns for prospecting vs retargeting | — | Prospecting and retargeting mixed |
| T04 | Smart+ campaigns tested | Medium | Smart+ tested alongside manual (42% adoption, 1.41-1.67 ROAS) | — | Smart+ never tested |
| T14 | Search Ads Toggle | Medium | Search Ads Toggle enabled in ad group settings | — | Toggle not enabled (Quick Win: 2 min) |
| T15 | Placement review | Medium | Placement selection reviewed (TikTok vs Pangle vs others) | Default placements, unreviewed | Pangle-only with poor performance ignored |
| T16 | Dayparting | Low | Ad schedule aligned with audience peak activity hours | — | No dayparting despite clear patterns |

### Smart+ Campaign Assessment
If Smart+ campaigns active:
- Up to 30 ad groups per campaign
- Up to 50 creatives per asset group
- Compare Smart+ performance vs manual campaigns for same objectives
- Expected ROAS range: 1.41-1.67

---

## Performance (10% weight)

| ID | Check | Severity | Pass | Warning | Fail |
|----|-------|----------|------|---------|------|
| T17 | CTR benchmark | High | In-feed CTR ≥1.0% | CTR 0.5-1.0% | CTR <0.5% |
| T18 | CPA target compliance | Critical | CPA within target; 3x Kill Rule applied | CPA 1.5-3x target | CPA >3x target (Kill Rule trigger) |
| T19 | Video watch time | High | Average video watch time ≥6 seconds | Watch time 3-6 seconds | Watch time <3 seconds |

---

## TikTok Context

| Setting | Value |
|---------|-------|
| CPM | 40-60% cheaper than Meta |
| Spark Ads CTR | ~3% (vs ~2% standard) |
| Smart+ adoption | 42% of advertisers |
| Smart+ ROAS | 1.41-1.67 |
| Shop CVR | >10% |
| Learning exit threshold | ~50 conversions in 7 days |
| Campaign minimum daily budget | $50/day |
| Ad group minimum daily budget | $20/day |

---

## Quick Wins (TikTok)

| Check | Fix | Time |
|-------|-----|------|
| T14 — Search Ads Toggle | Enable in ad group settings | 2 min |
| T23 — Silent video | Check and add audio to any silent ads | 5 min |
| T24 — Custom CTA | Change from default "Learn More" to specific action | 2 min |
| T06 — Format check | Identify any non-9:16 videos and flag for replacement | 5 min |
| T25 — Safe zone | Review active creatives in TikTok Ads Manager preview | 10 min |
| T02 — ttclid check | Verify ttclid is in Events API payload (check via Events Tester) | 10 min |

---

## Creative Fatigue Decision

For each active TikTok creative:
```
Check 1: Days since activation
Check 2: CTR trend (last 7d vs prior 7d)
Check 3: Average watch time trend

HEALTHY: Running <7 days with stable CTR
WARNING: Running 7-14 days OR CTR declining 15-30%
CRITICAL: Running >14 days with declining CTR, OR CTR declined >30%, OR watch time <3s

Action on CRITICAL: Pause immediately, create fresh creative with new hook
Action on WARNING: Prepare replacement creative; pause within 3-5 days if trend continues
```
