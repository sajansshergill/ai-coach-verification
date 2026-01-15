# Admin Review Workflow

This document outlines the manual review process for coach verifications when AI flags profiles or handles edge cases.

---

## When Manual Review is Needed

### Automatic Review Triggers

**AI Flags Profile For Review When:**
1. 🚩 **Critical Flags** - Suspicious credentials, fake content, inconsistencies
2. ⚠️ **Warning Flags** - Edge cases, unclear credentials, coach disputes
3. ℹ️ **Info Flags** - Unusual but potentially valid credentials
4. ❓ **Missing Requirements** - Coach wants higher tier but lacks requirements
5. 📧 **Coach Requests Review** - Coach asks for manual review or appeals AI decision

---

## Review Process

### Step 1: Receive Notification

**Admin Gets Notified When:**
- AI flags a profile
- Coach requests review
- Critical issue detected

**Notification Methods:**
- Email alert
- Dashboard notification
- Slack/Teams message (optional)

**Notification Includes:**
- Coach name and email
- Flag type and reason
- AI assessment summary
- Link to profile

---

### Step 2: Access Profile

**Admin Actions:**
1. Log into admin dashboard
2. Navigate to "Needs Review" section
3. Click on flagged profile
4. Review full profile and credentials

---

### Step 3: Review Profile

**Review Checklist:**

#### Verify Credentials
- [ ] Certifications are legitimate (check issuing organization, dates)
- [ ] Experience matches stated years
- [ ] Website/social links are active and relevant
- [ ] Testimonials appear authentic (specific details, varied language)
- [ ] Payment proof is legitimate (dates, amounts, blur quality)

#### Check for Red Flags
- [ ] Suspicious patterns (identical testimonials, fake-looking certificates)
- [ ] Inconsistencies (dates don't match, contradictory information)
- [ ] Stolen content (copied from other profiles, stock images)
- [ ] Manipulated documents (photoshopped certificates, fake screenshots)

#### Assess Quality
- [ ] Profile is complete for requested tier
- [ ] Credentials match specialization
- [ ] Trust signals are strong
- [ ] Overall credibility is high

---

### Step 4: Make Decision

**Decision Options:**

#### ✅ Approve
**Use When:**
- All credentials verified
- No red flags
- Meets tier requirements
- Quality is good

**Action:**
1. Click "Approve"
2. Add optional admin notes
3. System sends approval email to coach
4. Profile goes live

---

#### ⚠️ Request Changes
**Use When:**
- Missing required credentials
- Credentials are unclear or need clarification
- Coach needs to provide additional information
- Edge case needs resolution

**Action:**
1. Click "Request Changes"
2. Specify required changes in notes
3. System sends email with specific requests
4. Coach receives notification to update profile
5. Profile returns to pending status

**Email Template:**
```
Hi [Coach Name],

Thanks for your profile submission! We're reviewing your verification and need a few additional details:

- [Specific item 1 - e.g., "Can you provide a clearer screenshot of your certification?"]
- [Specific item 2 - e.g., "Your testimonials would be stronger with specific results. Can you update them?"]
- [Specific item 3 - e.g., "Your website link appears broken. Can you provide the correct URL?"]

Once you provide these, we can complete your verification.

[Link to update profile]

Best,
[Admin Name]
```

---

#### ❌ Reject
**Use When:**
- Credentials are fake or stolen
- Critical red flags cannot be resolved
- Coach refuses to provide required information
- Platform policies violated

**Action:**
1. Click "Reject"
2. Provide clear reason for rejection
3. System sends rejection email to coach
4. Profile status changes to "Rejected"
5. Coach can appeal if they dispute

**Email Template:**
```
Hi [Coach Name],

Thanks for your interest in [Platform Name]. After reviewing your profile, we weren't able to verify your credentials at this time.

Reason: [Specific, clear reason]

If you have additional information or believe this is an error, please reply to this email and we'll review again.

Best,
[Admin Name]
```

---

### Step 5: Document Decision

**Admin Notes Should Include:**
- Reason for decision (approve/request/reject)
- Specific details reviewed
- Any concerns or observations
- Follow-up actions if needed

**Example Admin Notes:**
```
Approved - Pro tier
- ICF certification verified on ICF website
- Website is active and professional
- 3 testimonials are authentic with specific results
- Payment proof confirmed (screenshot from Jan 2024)
- Trust score: 95/100
- No flags detected
```

---

## Handling Edge Cases

### Case 1: Coach Has Unusual Credentials

**Scenario:** Coach has certification from obscure organization or non-traditional background.

**Process:**
1. Research credential legitimacy (Google search, organization website)
2. Check if credential is relevant to coaching specialization
3. Consider alternative verification methods (client testimonials, public profile)
4. If unsure, request additional proof or context

**Decision:**
- If legitimate → Approve (with note)
- If questionable → Request changes (ask for alternative verification)
- If fake → Reject

---

### Case 2: Coach Disputes AI Assessment

**Scenario:** Coach believes AI incorrectly flagged or assessed their profile.

**Process:**
1. Review coach's explanation
2. Re-examine credentials with coach's context
3. Check if AI made an error
4. Make independent assessment

**Decision:**
- If AI was wrong → Approve (update AI logic if needed)
- If coach's explanation resolves issue → Request changes (ask coach to update profile with clarification)
- If AI was correct → Maintain flag, explain to coach

---

### Case 3: Coach Wants Higher Tier but Lacks Requirements

**Scenario:** Coach wants Pro/Premium but doesn't have all requirements.

**Process:**
1. Review what coach has
2. Identify what's missing
3. Consider alternatives (can website be replaced with LinkedIn? Can testimonials be replaced with case studies?)
4. Make recommendation

**Decision:**
- If alternatives work → Approve for higher tier (note alternatives used)
- If no alternatives → Approve for lower tier, suggest how to upgrade
- If coach insists → Request changes (specify exact requirements)

---

### Case 4: Inconsistent Information

**Scenario:** Dates don't match, information contradicts across credentials.

**Process:**
1. Identify inconsistency
2. Review all sources of information
3. Request clarification from coach if needed
4. Determine if it's an error or red flag

**Decision:**
- If innocent error → Request changes (ask coach to clarify/update)
- If suspicious → Reject (explain inconsistency)
- If clarified → Approve (with note about resolution)

---

## Review Timeline

### Target Review Times

**Critical Flags:** Within 24 hours  
**Warning Flags:** Within 2-3 business days  
**Info Flags:** Within 5 business days  
**General Pending:** Within 7 business days

### Priority Order

1. 🚩 Critical flags (suspicious content)
2. ⚠️ Warning flags (missing requirements)
3. 📧 Coach requests/appeals
4. ℹ️ Info flags (unusual credentials)
5. ⏳ General pending (waiting for coach)

---

## Quality Assurance

### Random Spot Checks

**Process:**
- Review 10% of auto-approved profiles randomly
- Verify AI assessment accuracy
- Update AI logic if patterns emerge
- Document findings

### Feedback Loop

**Process:**
- Track approval/rejection rates
- Monitor flag accuracy (false positives/negatives)
- Update verification logic based on findings
- Train AI on edge cases

---

## Escalation Process

### When to Escalate

**Escalate to Senior Admin When:**
- High-profile coach or controversial case
- Policy interpretation needed
- Potential legal or compliance issue
- Systemic issue detected

**Escalation Steps:**
1. Document issue clearly
2. Flag for senior review
3. Provide all context and evidence
4. Wait for senior decision

---

## Best Practices

### Do's
- ✅ Review objectively and fairly
- ✅ Give coaches benefit of doubt when reasonable
- ✅ Provide clear, specific feedback
- ✅ Document decisions thoroughly
- ✅ Respond within target timelines

### Don'ts
- ❌ Reject without clear reason
- ❌ Make assumptions without verifying
- ❌ Rush through reviews
- ❌ Ignore coach explanations
- ❌ Approve obviously fake credentials

---

## Tools & Resources

### Verification Resources

**Useful Tools:**
- ICF directory (for ICF certifications)
- Google search (verify organizations, websites)
- LinkedIn (verify professional backgrounds)
- Domain checkers (verify website ownership)
- Screenshot analyzers (check image manipulation)

**Reference Documents:**
- Platform policies and requirements
- Tier requirements checklist
- Flag definitions and examples
- Email templates

---

## Metrics to Track

### Review Performance

- Average review time
- Approval rate
- Rejection rate
- Request changes rate
- Appeal rate
- False positive/negative rate

### Coach Experience

- Coach satisfaction with review process
- Time to resolution
- Clarification requests
- Re-submission success rate

---

**This workflow ensures consistent, fair, and efficient manual review while maintaining high quality standards.**
