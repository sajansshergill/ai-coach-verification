# Verification Logic

This document explains how the AI assistant determines verification status, flags issues, and suggests upgrades.

---

## ⚠️ Critical: AI-Assisted, Not AI-Controlled

**The AI never approves or rejects verification automatically.**

The AI only:
- ✅ Assists with credential collection
- ✅ Checks completeness
- ✅ Flags missing items
- ✅ Summarizes trust signals
- ✅ Suggests missing steps

**All final verification decisions are made by human reviewers.** The AI flags profiles for manual review when uncertain, ensuring quality and safety. This is a **risk-controlled approach** that maintains human oversight while leveraging AI efficiency.

---

## Verification Tiers

### Basic (Minimum Verification)

**Required:**
- ✅ Coaching certification OR relevant training
- ✅ At least 6 months coaching experience OR clear coaching approach
- ✅ Basic profile information (name, bio, specialization)

**Benefits:**
- Basic visibility in search
- Can receive leads
- Standard support

**AI Action:**
- Collect minimum requirements
- Confirm completion
- Generate basic trust summary
- Flag for manual review if incomplete or uncertain
- **Note:** Even Basic tier requires human review for final approval (AI never auto-approves)

---

### Pro (Enhanced Verification)

**Required:**
- ✅ Everything in Basic, PLUS:
- ✅ Professional website OR LinkedIn profile with coaching focus
- ✅ At least 2 client testimonials OR payment proof
- ✅ Clear specialization/niche

**Benefits:**
- Higher visibility (top of search results)
- Featured in coach directory
- Priority support
- Access to premium leads

**AI Action:**
- Collect all Basic + Pro requirements
- Verify website/LinkedIn is active and relevant
- Review testimonials for authenticity (check for common patterns)
- Flag if testimonials seem generic or fake
- Suggest Pro if Basic is complete and coach has Pro requirements

---

### Premium (Full Verification)

**Required:**
- ✅ Everything in Pro, PLUS:
- ✅ Payment verification (screenshot or public review)
- ✅ At least 5 client testimonials with specific results
- ✅ Public coaching profile or case studies
- ✅ Consistent social presence

**Benefits:**
- Maximum visibility (always shown first)
- Premium lead access
- Dedicated account manager
- Marketing support

**AI Action:**
- Collect all requirements
- Verify payment proof is legitimate (check dates, amounts, blur quality)
- Review testimonials for specificity and authenticity
- Check social presence for consistency
- Flag if social presence is minimal or inconsistent
- Suggest Premium if Pro is complete and coach has Premium requirements

---

## Completeness Checks

### What the AI Checks For

1. **Presence** - Is the credential provided?
2. **Relevance** - Does it match coaching context?
3. **Validity** - Does it look legitimate?
4. **Completeness** - Is enough information provided?

---

## Credential Validation Rules

### Certifications
- ✅ **Strong:** Recognized organization, clear dates, verification links
- ⚠️ **Medium:** Mentioned but no link/proof
- ❌ **Weak:** Generic "certified" claim with no details

**AI Response:**
- Strong: "Great! I've verified your [Certification Name]."
- Medium: "Thanks for sharing! If you have a certificate link, that would strengthen your profile."
- Weak: "I'd love to verify your certification. Can you share the certifying organization and date?"

---

### Coaching Experience
- ✅ **Strong:** Specific years, client types, results/metrics
- ⚠️ **Medium:** General statement ("I've been coaching for a while")
- ❌ **Weak:** Vague or no experience mentioned

**AI Response:**
- Strong: "Excellent! Your [X years] of experience with [niche] is valuable."
- Medium: "Can you share more specifics? How long have you been coaching, and who do you typically work with?"
- Weak: "Tell me about your coaching background. Even if you're new, sharing your approach and training helps!"

---

### Websites
- ✅ **Strong:** Professional domain, coaching-focused content, active
- ⚠️ **Medium:** LinkedIn profile or social page (for Pro tier)
- ❌ **Weak:** Broken link, irrelevant content, personal blog

**AI Response:**
- Strong: "Perfect! Your website looks professional."
- Medium: "LinkedIn works great! I've verified your profile."
- Weak: "The link doesn't seem to work. Can you double-check, or share an alternative?"

---

### Testimonials
- ✅ **Strong:** Specific results, client names (optional), dates, authentic tone
- ⚠️ **Medium:** Generic praise, no specifics
- ❌ **Weak:** Clearly fake (similar wording, no context)

**AI Response:**
- Strong: "These testimonials are great—specific results really build trust!"
- Medium: "Thanks for sharing! Testimonials with specific outcomes (e.g., 'increased revenue by 30%') are most powerful."
- Weak: "[If clearly fake] These seem similar in wording. Can you share authentic client feedback, even if brief?"

---

### Payment Proof
- ✅ **Strong:** Screenshot with blurred PII, recent dates, reasonable amounts
- ⚠️ **Medium:** Link to public review/testimonial platform
- ❌ **Weak:** No proof, generic claim

**AI Response:**
- Strong: "Perfect! Payment verification is confirmed."
- Medium: "The public review works! That counts toward verification."
- Weak: "For Pro/Premium tiers, payment verification helps build trust. A screenshot with PII blurred, or a public review link, works great!"

---

## Flagging for Manual Review

### When AI Flags for Human Review

**Red Flags (Immediate Review):**
- Suspicious credentials (obvious fakes, stolen content)
- Inconsistent information (dates don't match, contradictory claims)
- Payment proof looks manipulated
- Testimonials are clearly fake

**Yellow Flags (Optional Review):**
- Unusual but potentially valid credentials
- Coach disputes AI assessment
- Edge cases not covered in logic

**AI Action:**
- Flag with reason
- Summarize issue clearly
- Provide coach explanation if available
- Move to admin dashboard for review

---

## Upgrade Suggestions

### When to Suggest Pro

Coach has Basic complete and:
- Has website or LinkedIn (even if not shared yet)
- Mentions client work or testimonials
- Expresses interest in better visibility

**AI Message:**
"Great job on Basic verification! I noticed you [have website / mention clients]. If you share [specific requirements], you could upgrade to Pro for higher visibility and better leads. Want to do that now?"

---

### When to Suggest Premium

Coach has Pro complete and:
- Has payment proof or multiple testimonials
- Mentions case studies or public profile
- Asks about maximum visibility

**AI Message:**
"You're doing great with Pro verification! Based on what you've shared, you're close to Premium tier. If you can add [specific requirements], you'll get maximum visibility and premium lead access. Interested?"

---

## Trust Score Calculation

**Simple Scoring (Internal Use):**

```
Basic Requirements Met: 30 points
- Certification: +10
- Experience: +10
- Profile Complete: +10

Pro Requirements Met: +40 points (70 total)
- Website/LinkedIn: +15
- Testimonials: +15
- Specialization: +10

Premium Requirements Met: +30 points (100 total)
- Payment Proof: +15
- 5+ Testimonials: +10
- Public Profile: +5
```

**Use score to:**
- Prioritize coach listings
- Suggest upgrades
- Identify high-quality coaches

---

## Inconsistency Detection

### What to Check

1. **Date Conflicts**
   - "Started coaching in 2020" but certification from 2023
   - Experience years don't match stated start date

2. **Content Mismatches**
   - Website says different specialization than profile
   - Testimonials mention different niche

3. **Suspicious Patterns**
   - All testimonials have similar wording
   - Payment screenshots are identical or suspiciously perfect

**AI Action:**
- Flag inconsistency
- Ask coach to clarify
- Note in admin review if unresolved

---

## Final Verification Status

### Auto-Approve (No Manual Review)
- ✅ All requirements met
- ✅ No flags raised
- ✅ Credentials verified by AI
- ✅ Score ≥ 70 (Pro tier) or 100 (Premium)

### Manual Review Required
- ⚠️ Red or yellow flags raised
- ⚠️ Edge case not covered
- ⚠️ Coach disputes assessment
- ⚠️ Inconsistencies detected

### Request Additional Info
- ❓ Missing requirements
- ❓ Credentials unclear
- ❓ Coach hasn't responded to follow-ups

---

## Implementation Notes

**AI Model:**
- Use GPT-4 or Claude 3 for best accuracy
- Provide clear examples in prompt
- Use structured output format for data extraction

**Validation:**
- Test with real coach profiles
- Refine flags based on false positives
- Update rules as edge cases emerge

**Safety:**
- Never approve without minimum requirements
- Always flag suspicious content
- Human review for borderline cases

---

**This logic should be encoded in your AI prompts and backend validation rules.**
