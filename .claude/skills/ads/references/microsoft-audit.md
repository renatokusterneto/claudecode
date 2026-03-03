# Microsoft Ads Audit Checklist — 20 Checks

<!-- Updated: 2026-02-10 -->
<!-- Sources: Microsoft Research, Claude Research, Gemini Research -->

## Category 1: Technical Setup (25% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| MS01 | UET (Universal Event Tracking) tag installed and firing on all pages | All pages verified | Partial | Not installed | Critical |
| MS02 | Enhanced Conversions enabled — improved cross-device matching | Active | Not enabled | N/A | High |
| MS03 | Google Ads import validated: URLs, extensions, bids, goals all correct | Validated post-import | Partial check | No validation done | Critical |

**Import Validation Checklist (MS03 sub-checks):**
- [ ] All landing page URLs work after import
- [ ] Bid amounts reduced 20-35% from Google levels
- [ ] Extensions reviewed (not all Google extensions exist in Microsoft)
- [ ] Conversion goals re-created natively (not relying on imported)
- [ ] Negative keyword shared lists verified
- [ ] Audience segments re-verified post-import

---

## Category 2: Syndication & Bidding (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| MS04 | Search partner network: reviewed, low-performers excluded | Reviewed + excluded | Not reviewed | Partners never checked | Medium |
| MS05 | Audience Network: enabled only if intentional (not accidental) | Intentional + reviewed | Active, not reviewed | On accidentally | High |
| MS06 | Bid targets 20-35% lower than equivalent Google campaigns | 20-35% lower | 10-20% lower | Same or higher (overpaying) | High |
| MS07 | Target New Customers enabled for PMax (Beta 2026) | Enabled + tested | Not tested | Not aware of feature | Low |

---

## Category 3: Campaign Structure (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| MS08 | Campaign structure mirrors Google or follows best practices | Well-structured | Minor issues | Poorly structured | Medium |
| MS09 | Budget proportional to Bing volume: 20-30% of Google budget | 20-30% | 10-20% or 30-40% | <10% or >40% | Medium |
| MS10 | LinkedIn Profile Targeting configured for B2B campaigns | Active (if B2B) | Not using (missed) | Not applicable (B2C) | High (B2B only) |

---

## Category 4: Creative & Extensions (20% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| MS11 | RSA: ≥8 unique headlines, ≥3 descriptions | ≥8 headlines, ≥3 desc | 6-7 headlines | <6 headlines | High |
| MS12 | Multimedia Ads tested — Microsoft-unique visual rich format | Tested + evaluated | Not tested | Not aware of format | Medium |
| MS13 | Ad copy optimized for Bing demographics (older, professional) | Tailored copy | Generic (Google copy) | No optimization | Medium |
| MS19 | Action Extension utilized — Microsoft-exclusive CTA button | Active | Not used | Not configured | Medium |
| MS20 | Filter Link Extension tested — Microsoft-exclusive | Tested | Not tested | Not configured | Low |

---

## Category 5: Settings & Performance (15% weight)

| ID | Check | Pass | Warning | Fail | Severity |
|----|-------|------|---------|------|----------|
| MS14 | Copilot Chat placement enabled for PMax (73% CTR lift) | Enabled + tracking | Enabled, not tracked | Disabled | High |
| MS15 | Conversion goals configured natively (not relying on import) | Native goals active | Mix of native + import | Import-only | High |
| MS16 | CPC 20-40% lower than Google for same keywords | 20-40% lower | 10-20% lower | Same or higher | High |
| MS17 | CVR comparable to Google (not >50% lower) | Within 20% | 20-50% lower | >50% lower (landing issue) | High |
| MS18 | Impression share tracked for brand and top terms | Tracked + action | Tracked, no action | Not tracked | Medium |

---

## Key Thresholds

| Metric | Pass | Warning | Fail |
|--------|------|---------|------|
| CTR (Search) | ≥2.83% | 1.5-2.83% | <1.5% |
| CPC (Search avg) | ≤$1.55 | $1.55-2.50 | >$2.50 |
| CPC vs Google | 20-40% lower | 10-20% lower | Same or higher |
| CVR vs Google | Within 20% | 20-50% lower | >50% lower |
| Brand Impression Share | ≥80% | 60-80% | <60% |

## Bing Audience Demographics

| Characteristic | Detail |
|---------------|--------|
| Age skew | 35-65+ over-indexed |
| Income | Top 25% income brackets |
| Device | Desktop-heavy (Windows + Edge + Bing default) |
| User type | Enterprise/corporate (Office 365) |
| B2B suitability | Strong — LinkedIn targeting available |
| Ad tone | Professional, reliability-focused |

## Copilot Integration (2026 Priority)

| Feature | Status | Impact |
|---------|--------|--------|
| Copilot Chat Placement | Available in PMax | 73% CTR lift reported |
| Copilot Checkout | Launched Jan 2026 | In-chat purchase flow |
| Natural language delivery | Active | Conversational ad context |

**Evaluation questions:**
- Is Copilot placement enabled? (If not → HIGH priority for PMax campaigns)
- What % of impressions come from Copilot placement?
- CTR/CVR comparison: Copilot vs traditional SERP placement?
- Does ad copy read naturally in a conversational context?

## Microsoft-Unique Features Checklist

| Feature | Check | Priority |
|---------|-------|----------|
| Multimedia Ads | Tested and evaluated? | Medium |
| Action Extension | CTA button active in ads? | Medium |
| Filter Link Extension | Filterable links tested? | Low |
| LinkedIn Profile Targeting | Company/industry/job targeting? | High (B2B) |
| Copilot Chat Placement | PMax ads in Copilot? | High |
| Target New Customers (PMax) | Beta feature enabled? | Low |

## Most Common Failures

1. **No post-import validation (MS03)** — URLs broken, bids too high, goals broken silently
2. **Bids not reduced post-import** — paying Google-level CPCs for Bing traffic
3. **Copilot placement disabled** — missing 73% CTR lift opportunity
4. **UET tag missing** — complete tracking blind spot
5. **Audience Network on accidentally** — budget wasted on non-search traffic
6. **B2B accounts not using LinkedIn Profile Targeting** — Microsoft's biggest competitive advantage
7. **Conversion goals not configured natively** — import goals often break silently
