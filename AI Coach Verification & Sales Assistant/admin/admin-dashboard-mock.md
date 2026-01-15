# Admin Dashboard Mock

This document describes what an admin dashboard should display for reviewing and managing coach verifications.

---

## Dashboard Overview

**Purpose:** Give platform admins a clear view of coach verification status, flags, and actions needed.

---

## Main Dashboard View

### Top Stats Bar

```
┌─────────────────────────────────────────────────────────────┐
│  Total Coaches: 247  │  Verified: 189  │  Pending: 42  │   │
│  Needs Review: 8     │  Flags: 3       │  Today: 12    │   │
└─────────────────────────────────────────────────────────────┘
```

**Metrics:**
- **Total Coaches** - All coaches on platform
- **Verified** - Approved and active
- **Pending** - In verification process
- **Needs Review** - Flagged by AI for manual review
- **Flags** - Critical issues requiring attention
- **Today** - New signups today

---

## Coach List View

### Table Structure

| Coach Name | Email | Tier | Status | Trust Score | Flags | Actions |
|------------|-------|------|--------|-------------|-------|---------|
| Sarah Chen | sarah@example.com | Pro | ✅ Verified | 95 | - | View |
| John Smith | john@example.com | Basic | ⚠️ Pending | 65 | Missing cert | Review |
| Maria Lopez | maria@example.com | Premium | ✅ Verified | 100 | - | View |
| Tom Wilson | tom@example.com | Pro | 🚩 Flagged | 70 | Suspicious | Review |

**Columns:**
- **Coach Name** - Clickable to view full profile
- **Email** - Contact information
- **Tier** - Basic / Pro / Premium
- **Status** - Verified / Pending / Flagged / Rejected
- **Trust Score** - 0-100 score (internal)
- **Flags** - Quick view of issues
- **Actions** - View / Review / Approve / Reject buttons

---

## Filters & Search

**Filter Options:**
- Status: All / Verified / Pending / Flagged / Rejected
- Tier: All / Basic / Pro / Premium
- Flags: All / No Flags / Needs Review / Suspicious
- Date Range: Last 7 days / 30 days / All time
- Search: Name, email, specialization

---

## Coach Detail View

### Profile Information Section

```
┌─────────────────────────────────────────────────────────────┐
│  Coach: Sarah Chen                                    Edit  │
│  Email: sarah@example.com                                   │
│  Tier: Pro | Status: ✅ Verified                            │
│  Trust Score: 95/100                                         │
│  Joined: Jan 15, 2024                                       │
└─────────────────────────────────────────────────────────────┘
```

**Display:**
- Full name, email, tier, status
- Trust score breakdown
- Join date, last updated
- Quick actions (Edit / Approve / Reject)

---

### Verification Credentials Section

```
┌─────────────────────────────────────────────────────────────┐
│  Verification Credentials                                    │
├─────────────────────────────────────────────────────────────┤
│  ✅ Certifications                                           │
│     - ICF Certified (2020)                                   │
│     - Executive Coaching Certificate                         │
│                                                              │
│  ✅ Experience                                               │
│     5 years | Specialization: Executive coaching             │
│                                                              │
│  ✅ Website                                                  │
│     https://sarahchencoaching.com                            │
│                                                              │
│  ✅ Testimonials (3)                                         │
│     - "Helped me transition to VP role..."                  │
│     - "Increased confidence by 40%..."                      │
│     - "Best coaching investment..."                         │
│                                                              │
│  ✅ Payment Verified                                         │
│     Screenshot provided (Jan 10, 2024)                      │
└─────────────────────────────────────────────────────────────┘
```

**Display:**
- All credentials with checkmarks
- Links/files clickable
- Dates and details visible
- Status indicators (✅ ⚠️ ❌)

---

### AI Assessment Section

```
┌─────────────────────────────────────────────────────────────┐
│  AI Assessment                                               │
├─────────────────────────────────────────────────────────────┤
│  Verification Status: Complete                               │
│  Credentials: All verified                                   │
│  Trust Signals: Strong                                       │
│                                                              │
│  Summary:                                                    │
│  Profile is complete with strong credentials. All            │
│  requirements for Pro tier met. No flags detected.           │
│                                                              │
│  Trust Score Breakdown:                                      │
│  - Certifications: 20/20                                     │
│  - Experience: 20/20                                         │
│  - Social Proof: 20/20                                       │
│  - Payment Verification: 15/15                               │
│  - Profile Completeness: 20/20                               │
│                                                              │
│  Flags: None                                                 │
└─────────────────────────────────────────────────────────────┘
```

**Display:**
- AI's assessment summary
- Trust score breakdown
- Flags or warnings
- Confidence level

---

### Trust Profile Summary

```
┌─────────────────────────────────────────────────────────────┐
│  Trust Profile Summary (Public)                              │
├─────────────────────────────────────────────────────────────┤
│  [Generated summary text appears here]                       │
│                                                              │
│  [Regenerate Summary] [Edit]                                 │
└─────────────────────────────────────────────────────────────┘
```

**Actions:**
- View generated summary
- Regenerate if needed
- Edit manually if required

---

### Actions Section

```
┌─────────────────────────────────────────────────────────────┐
│  Actions                                                     │
├─────────────────────────────────────────────────────────────┤
│  [✅ Approve]  [⚠️ Request Changes]  [❌ Reject]  [📧 Email] │
│                                                              │
│  Notes:                                                      │
│  [Text area for admin notes]                                 │
│                                                              │
│  [Save Notes]                                                │
└─────────────────────────────────────────────────────────────┘
```

**Actions:**
- **Approve** - Approve verification and activate profile
- **Request Changes** - Send email requesting specific updates
- **Reject** - Reject verification with reason
- **Email** - Send direct email to coach
- **Notes** - Internal admin notes (not visible to coach)

---

## Flagged Profiles View

### Flags Overview

**Critical Flags (🚩):**
- Suspicious credentials
- Inconsistent information
- Fake testimonials
- Manipulated payment proof

**Warning Flags (⚠️):**
- Missing requirements
- Edge cases
- Coach disputes

**Info Flags (ℹ️):**
- Unusual but valid credentials
- Admin attention recommended

---

### Flag Detail View

```
┌─────────────────────────────────────────────────────────────┐
│  Flagged Profile: Tom Wilson                                 │
│  Flag Type: 🚩 Suspicious                                     │
├─────────────────────────────────────────────────────────────┤
│  Issue:                                                      │
│  Testimonials show identical wording, possible fake          │
│                                                              │
│  AI Reasoning:                                               │
│  Three testimonials use very similar language and            │
│  structure. This pattern often indicates fake reviews.       │
│                                                              │
│  Coach Response:                                             │
│  "These are from my coaching program graduates..."          │
│                                                              │
│  Admin Decision:                                             │
│  [✅ Approve]  [⚠️ Request Changes]  [❌ Reject]              │
│                                                              │
│  Admin Notes:                                                │
│  [Text area]                                                 │
└─────────────────────────────────────────────────────────────┘
```

---

## Bulk Actions

**Available Bulk Actions:**
- Approve selected (if all meet criteria)
- Send email to selected
- Export selected to CSV
- Update tier for selected

---

## Reports & Analytics

### Verification Metrics

- **Verification Rate** - % of signups that complete verification
- **Average Verification Time** - Time from signup to verified
- **Tier Distribution** - Breakdown of Basic/Pro/Premium
- **Flag Rate** - % of profiles flagged for review
- **Conversion by Tier** - How many complete each tier

### Charts/Graphs

- Verification trends over time
- Tier distribution pie chart
- Flag categories breakdown
- Trust score distribution

---

## Email Templates

### Request Changes

**Template:**
```
Subject: Action Required: Complete Your Profile Verification

Hi [Coach Name],

Thanks for signing up! We're reviewing your profile and noticed a few items that would help us verify your credentials:

- [Specific item 1]
- [Specific item 2]
- [Specific item 3]

Once you provide these, we can complete your verification and activate your profile.

[Link to profile completion]

Best,
[Admin Name]
```

### Approval

**Template:**
```
Subject: Your Profile is Verified! ✅

Hi [Coach Name],

Great news! Your profile has been verified and is now live on [Platform Name].

You're approved for [Tier] tier, which includes:
- [Benefit 1]
- [Benefit 2]
- [Benefit 3]

[Link to profile] | [Link to dashboard]

Best,
[Admin Name]
```

### Rejection

**Template:**
```
Subject: Profile Verification Update

Hi [Coach Name],

Thanks for your interest in [Platform Name]. After reviewing your profile, we weren't able to verify your credentials at this time.

Reason: [Specific reason]

If you have additional information or credentials to share, please reply to this email and we'll review again.

Best,
[Admin Name]
```

---

## Implementation Options

### Option A: Simple Spreadsheet
- Google Sheets / Airtable
- Manual review process
- Basic filtering and search
- **Time: 1 hour to set up**

### Option B: Custom Dashboard
- Web app (React, Vue, etc.)
- Database integration
- Real-time updates
- **Time: 1-2 days to build**

### Option C: No-Code Platform
- Bubble.io, Retool, Softr
- Visual dashboard builder
- Database connections
- **Time: 4-6 hours to build**

**Recommendation:** Start with Option A or C, then build Option B if needed.

---

## Security & Permissions

**Admin Roles:**
- **Super Admin** - Full access, can approve/reject
- **Reviewer** - Can review and flag, cannot approve/reject
- **Viewer** - Read-only access

**Data Privacy:**
- All coach data encrypted
- Admin actions logged
- Export permissions limited
- GDPR compliance considerations

---

**This dashboard structure provides clear visibility into verification status and makes manual review efficient.**
