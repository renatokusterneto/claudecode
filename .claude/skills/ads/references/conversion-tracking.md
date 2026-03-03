# Conversion Tracking Reference — All Platforms

<!-- Updated: 2026-02-10 -->
<!-- Sources: Google, Meta, TikTok, LinkedIn, Microsoft official docs + research -->

## Overview

Complete tracking stack requirements across all five major ad platforms. Server-side tracking is now architecturally necessary for:
- iOS 14.5+ privacy restrictions (30-40% client-side data loss)
- GDPR/CCPA/LGPD compliance (Consent Mode, cookie consent)
- Browser-based ad blockers (10-40% blocking rate depending on audience)

---

## Google Ads Tracking

### Required Stack

```
Client-side:  gtag.js OR Google Tag Manager (GTM)
Server-side:  Enhanced Conversions (hashed PII)
Compliance:   Consent Mode v2 (mandatory EU/EEA — July 2025+)
Attribution:  Data-Driven Attribution (DDA) — required Sep 2025+
```

### Implementation Requirements

| Component | Requirement | Status Check |
|-----------|------------|--------------|
| gtag.js / GTM | Firing on ALL conversion pages | Verify in Tag Assistant |
| Enhanced Conversions | Email + phone hashed via SHA-256 | Check Conversion Settings |
| Consent Mode v2 | Advanced mode (not Basic) | Check Consent Status report |
| Primary conversions | Correct actions set as "Primary" | Conversion Action settings |
| Attribution model | Data-Driven (DDA) mandatory | Attribution settings tab |
| Cross-device tracking | Active and reporting | Segments → Device |
| GA4 link | Connected, not double-counting | Linked accounts |

### Enhanced Conversions Setup

```javascript
// Minimal gtag Enhanced Conversions implementation
gtag('event', 'purchase', {
  transaction_id: 'ORDER_123',
  value: 99.99,
  currency: 'BRL',
  // Enhanced Conversions — hashed automatically by gtag
  user_data: {
    email_address: 'customer@email.com',  // gtag hashes automatically
    phone_number: '+5541999999999'
  }
});
```

### Consent Mode v2 (Advanced)

```javascript
// Must fire BEFORE any gtag/GTM calls
gtag('consent', 'default', {
  'ad_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'analytics_storage': 'denied'
});

// After user consent — update consent state
gtag('consent', 'update', {
  'ad_storage': 'granted',
  'ad_user_data': 'granted',
  'ad_personalization': 'granted',
  'analytics_storage': 'granted'
});
```

### Quality Gates

- ❌ Broad Match + Manual CPC = never acceptable
- ❌ Last-click attribution = flag as Warning (DDA required Sep 2025)
- ❌ Consent Mode missing for EU/EEA = Critical compliance failure
- ❌ GA4 import + gtag on same conversion = double-counting risk

---

## Meta Ads Tracking

### Required Stack

```
Client-side:  Meta Pixel (fbevents.js)
Server-side:  Conversions API (CAPI)
Dedup:        event_id matching (client + server must send same event_id)
Compliance:   Consent Mode / Cookie consent (EU/EEA)
Matching:     Advanced Matching (email, phone, external_id, fbp, fbc)
```

### Event Match Quality (EMQ) Targets

| Event | Target EMQ | Minimum | Data Parameters Needed |
|-------|-----------|---------|----------------------|
| Purchase | ≥8.0 (Excellent) | ≥6.0 | email, phone, external_id, fbp, fbc, ip |
| Lead | ≥7.0 | ≥5.0 | email, phone |
| CompleteRegistration | ≥7.0 | ≥5.0 | email, external_id |
| AddToCart | ≥6.0 | ≥4.0 | email, fbp |
| ViewContent | ≥5.0 | ≥3.0 | fbp, ip |

### Advanced Matching Parameters

```javascript
// Meta Pixel with Advanced Matching
fbq('init', 'PIXEL_ID', {
  em: 'sha256_hashed_email',   // email (hash before sending)
  ph: 'sha256_hashed_phone',   // phone (hash before sending)
  external_id: 'USER_ID_123'   // your internal user ID
});
```

### CAPI Implementation (Server-Side)

```python
# Minimal CAPI implementation
from facebook_business.adobjects.serverside.event import Event
from facebook_business.adobjects.serverside.user_data import UserData

user_data = UserData(
    email='customer@email.com',     # library handles hashing
    phone='5541999999999',
    external_id='USER_123',
    client_ip_address=request.ip,
    client_user_agent=request.user_agent,
    fbc=cookie.get('_fbc'),         # Facebook Click ID
    fbp=cookie.get('_fbp')          # Facebook Browser ID
)

event = Event(
    event_name='Purchase',
    event_time=int(time.time()),
    event_source_url='https://site.com/obrigado',
    event_id='dedup_123',           # MUST match client-side event_id
    user_data=user_data,
    action_source='website',
    custom_data={'value': 99.99, 'currency': 'BRL'}
)
```

### Deduplication (Critical)

```javascript
// Client-side (Pixel) — MUST send event_id
fbq('track', 'Purchase', {value: 99.99, currency: 'BRL'}, {eventID: 'dedup_123'});

// Server-side (CAPI) — MUST send same event_id
// event_id: 'dedup_123'  ← matches above
```

**Deduplication rate target: ≥90%** — check in Events Manager → Event Match Quality

### Aggregated Event Measurement (AEM — iOS)

Configure top 8 conversion events in priority order (Events Manager → Data Sources → Configure Web Events):

1. Purchase (highest value)
2. Lead
3. CompleteRegistration
4. InitiateCheckout
5. AddToCart
6. ViewContent
7. Search
8. PageView

---

## TikTok Ads Tracking

### Required Stack

```
Client-side:  TikTok Pixel
Server-side:  Events API
CRITICAL:     ttclid passback — MANDATORY for accurate attribution
Matching:     Advanced Matching (email, phone, external_id)
```

### ttclid Passback — CRITICAL

ttclid is TikTok's click ID parameter. Without it, TikTok over-claims conversions through modeled attribution.

**Step 1 — Capture ttclid on landing page:**
```javascript
// Capture and store ttclid on first page load
const urlParams = new URLSearchParams(window.location.search);
const ttclid = urlParams.get('ttclid');
if (ttclid) {
  sessionStorage.setItem('ttclid', ttclid);
  // Also store in cookie for cross-page persistence
  document.cookie = `ttclid=${ttclid};path=/;max-age=86400`;
}
```

**Step 2 — Send ttclid with EVERY conversion event:**
```javascript
// TikTok Pixel — pass ttclid with all conversion events
ttq.track('CompletePayment', {
  content_id: 'PRODUCT_123',
  value: 99.99,
  currency: 'BRL'
}, {
  ttclid: sessionStorage.getItem('ttclid')  // MUST include
});
```

**Step 3 — Events API (server-side):**
```python
# Events API payload — must include ttclid
payload = {
    "data": [{
        "event": "CompletePayment",
        "event_time": int(time.time()),
        "event_id": "dedup_123",
        "user": {
            "email": hashlib.sha256("customer@email.com".encode()).hexdigest(),
            "ttclid": stored_ttclid,      # MUST be stored and passed back
            "external_id": "USER_123"
        },
        "properties": {
            "value": 99.99,
            "currency": "BRL"
        }
    }]
}
```

### Standard Events (TikTok)

| Event | When to Fire |
|-------|-------------|
| ViewContent | Product/service page view |
| AddToCart | Cart addition |
| InitiateCheckout | Checkout page load |
| AddPaymentInfo | Payment details entered |
| CompletePayment | Purchase confirmed |
| Subscribe | Subscription activated |
| Contact | Contact form submitted |
| SubmitForm | Lead form completed |

### Quality Gates

- ❌ **Missing ttclid passback** = Critical (all attribution data unreliable)
- ❌ **No Events API** = 30-40% data loss post-iOS 14.5
- ❌ **ttclid not stored cross-page** = partial tracking only

---

## LinkedIn Ads Tracking

### Required Stack

```
Client-side:  LinkedIn Insight Tag
Server-side:  Conversions API (CAPI — launched 2025)
Attribution:  30-day click, 7-day view (B2B default)
```

### Insight Tag Implementation

```html
<!-- LinkedIn Insight Tag — fires on all pages -->
<script type="text/javascript">
_linkedin_partner_id = "PARTNER_ID";
window._linkedin_data_partner_ids = window._linkedin_data_partner_ids || [];
window._linkedin_data_partner_ids.push(_linkedin_partner_id);
</script>
<script type="text/javascript">
(function(l) {
  if (!l){window.lintrk = function(a,b){window.lintrk.q.push([a,b])};
  window.lintrk.q=[]}
  var s = document.getElementsByTagName("script")[0];
  var b = document.createElement("script");
  b.type = "text/javascript";b.async = true;
  b.src = "https://snap.licdn.com/li.lms-analytics/insight.min.js";
  s.parentNode.insertBefore(b, s);
})(window.lintrk);
</script>
```

### Conversion Events Setup

Configure in Campaign Manager → Analyze → Conversion Tracking:
- Page URL-based (simplest — trigger on thank-you page URL)
- Event-based (JavaScript `window.lintrk('track', {conversion_id: ID})`)
- Lead Gen Form submissions (auto-tracked when LGF is active)

### CAPI (2025 — B2B Attribution)

LinkedIn CAPI is especially valuable for B2B long sales cycles where:
- Prospect sees LinkedIn ad → converts weeks later via organic
- Cross-device journey (LinkedIn on mobile, converts on desktop)
- Last-touch misses LinkedIn's influence entirely

**Most LinkedIn accounts have NOT yet deployed CAPI — high priority.**

### Attribution Windows (LinkedIn)

| Window | Default | Notes |
|--------|---------|-------|
| Click | 30 days | Longer than other platforms (B2B sales cycle) |
| View | 7 days | View-through attribution |
| Recommendation | Don't change | Aligned to B2B buying timelines |

---

## Microsoft Ads Tracking

### Required Stack

```
Client-side:  UET (Universal Event Tracking) tag
Server-side:  Enhanced Conversions
Goals:        Configured natively (not relying on Google Ads import)
```

### UET Tag Implementation

```html
<!-- UET Tag — fires on all pages -->
<script>
(function(w,d,t,r,u){
  var f,n,i;w[u]=w[u]||[];
  f=function(){var o={ti:"TAG_ID"};
  o.q=w[u];w[u]=new UET(o);w[u].push("pageLoad");};
  n=d.createElement(t);n.src=r;n.async=1;n.onload=n.onreadystatechange=function(){
    var s=this.readyState;
    if(s&&s!=="loaded"&&s!=="complete")return;
    f();n.onload=n.onreadystatechange=null;
  };
  i=d.getElementsByTagName(t)[0];i.parentBefore(n,i)
})(window,document,"script","//bat.bing.com/bat.js","uetq");
</script>
```

### Conversion Event Tracking

```javascript
// Microsoft Ads conversion event
window.uetq = window.uetq || [];
window.uetq.push('event', 'purchase', {
  'event_label': 'Purchase',
  'revenue_value': 99.99,
  'currency': 'BRL'
});
```

### Post-Import Validation (Critical — MS03)

After every Google Ads import, manually validate:

```
☐ All landing page URLs respond with 200 (no broken redirects)
☐ Bid amounts are 20-35% lower than Google (don't import as-is)
☐ Extension mapping checked (not all Google extensions have MS equivalents)
☐ Conversion goals re-created natively in Microsoft Ads
☐ Negative keyword shared lists transferred correctly
☐ Audience segments verified and present
☐ Auto-import schedule configured (or disabled for manual control)
```

**Most common silent failure:** Conversion goals break on import but still appear "active" — test manually by checking UET tag in Microsoft Clarity or browser network tab.

---

## Cross-Platform Tracking Consistency

### Attribution Window Comparison

| Platform | Click Window | View Window | Notes |
|----------|------------|------------|-------|
| Google Ads | 30 days (default) | 1 day | DDA required Sep 2025+ |
| Meta Ads | 7 days | 1 day | Standard since iOS 14.5 changes |
| LinkedIn Ads | 30 days | 7 days | Longer for B2B |
| TikTok Ads | 7 days | 1 day | ttclid passback required |
| Microsoft Ads | 30 days | 1 day | Mirrors Google |

### Double-Counting Risks

| Scenario | Risk | Mitigation |
|----------|------|-----------|
| GA4 + gtag both tracking Google conversions | High | Use only one source |
| Meta Pixel + CAPI without deduplication | High | event_id matching required |
| Multiple pixels from different agencies | Critical | Audit with Pixel Helper |
| Cross-platform attribution overlap | Medium | Use unified MTA tool |

### Server-Side Tracking Decision Matrix

| Platform | Client-Only Data Loss | Server-Side Required? |
|----------|----------------------|----------------------|
| Google | ~15-20% (iOS + blockers) | Strongly recommended |
| Meta | 30-40% (iOS 14.5+) | **Yes, mandatory** |
| TikTok | 30-40% without ttclid | **Yes, ttclid passback** |
| LinkedIn | 10-20% | Recommended (B2B cycles) |
| Microsoft | ~15% | Recommended |
