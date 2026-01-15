# Credential Collection Automation

This document outlines what credentials to collect, how to collect them, and automation options.

---

## Credentials to Collect

### Required for All Tiers

1. **Basic Profile Information**
   - Full name
   - Email address
   - Phone number (optional)
   - Bio/short description
   - Coaching specialization/niche
   - Profile photo

2. **Coaching Experience**
   - Years of experience
   - Coaching background/history
   - Client types (if applicable)
   - Notable achievements (optional)

---

### Basic Tier Requirements

**Minimum for approval:**

1. **Certification OR Training**
   - Coaching certification (any recognized organization)
   - OR relevant training program completion
   - Certificate name, issuing organization, date

2. **Experience Confirmation**
   - At least 6 months coaching experience
   - OR clear coaching approach/methodology description

**Collection Method:**
- AI conversation (text input)
- Optional file upload (certificate image)

---

### Pro Tier Requirements

**Everything in Basic, PLUS:**

1. **Professional Presence**
   - Professional website URL
   - OR LinkedIn profile URL (with coaching focus)
   - Website must be active and coaching-related

2. **Social Proof**
   - At least 2 client testimonials (text or links)
   - OR payment proof (screenshot with PII blurred)
   - Testimonials should include specific results if possible

**Collection Method:**
- AI conversation (URLs and text)
- File upload (payment screenshots, testimonial images)

---

### Premium Tier Requirements

**Everything in Pro, PLUS:**

1. **Payment Verification**
   - Screenshot of payment from client (Stripe, PayPal, etc.)
   - OR link to public review/testimonial platform
   - Must show coaching-related transaction

2. **Extended Social Proof**
   - At least 5 client testimonials with specific results
   - OR public coaching profile/case studies
   - Testimonials should include outcomes (e.g., "increased revenue by 30%")

3. **Consistent Social Presence**
   - Active professional social media (LinkedIn, Twitter, etc.)
   - Consistent branding and content
   - Coaching-related posts/engagement

**Collection Method:**
- AI conversation (URLs, text)
- File uploads (screenshots, images)
- Link verification (AI checks if links are active)

---

## Collection Methods

### Method 1: AI Conversation (Primary)

**How It Works:**
1. AI assistant asks for credential in conversational format
2. Coach responds with information
3. AI confirms receipt and validates format
4. AI stores data in structured format
5. AI moves to next credential

**Example Flow:**
```
AI: "What coaching certifications do you have? You can list them here or upload a certificate image."

Coach: "I'm ICF certified and have an Executive Coaching Certificate from [Organization]."

AI: "Great! I've noted:
- ICF Certified
- Executive Coaching Certificate from [Organization]

Do you have the certification dates? That helps build credibility."

Coach: "ICF was 2020, Executive Coaching was 2019."

AI: "Perfect! ✅ I've recorded your certifications. Next, let's talk about your coaching experience..."
```

**Pros:**
- Natural, conversational experience
- Coach feels guided and supported
- AI can ask follow-ups and clarifications
- Reduces friction

**Cons:**
- Requires AI system (ChatGPT, Claude, custom chatbot)
- Longer conversation time
- Needs structured data extraction

---

### Method 2: Form-Based Collection

**How It Works:**
1. Coach fills out structured form
2. Form validates required fields
3. System saves responses
4. AI reviews and flags missing items

**Example Form Fields:**
- Name: [Text input]
- Email: [Email input]
- Years of Experience: [Number input]
- Certifications: [Text area]
- Website: [URL input]
- Testimonials: [Text area or file upload]

**Pros:**
- Faster for coaches who know what they need
- Easy to implement (standard form)
- Structured data from start

**Cons:**
- Less engaging
- Higher drop-off rates
- No conversational guidance

**Best Use:**
- Supplement to AI conversation
- Quick updates/additions
- Bulk credential collection

---

### Method 3: File Uploads

**How It Works:**
1. AI/form requests specific file
2. Coach uploads file (image, PDF, etc.)
3. System stores file securely
4. AI extracts data from file (optional - OCR)

**File Types to Accept:**
- Images (PNG, JPG) - Certificates, payment screenshots
- PDFs - Certificates, case studies
- Links (URLs) - Websites, social profiles, testimonials

**Pros:**
- Authentic proof (certificates, screenshots)
- High credibility
- Easy for coaches to provide

**Cons:**
- Storage requirements
- May need manual review
- File size limits

**Best Use:**
- Certificates
- Payment verification
- Case studies
- Any proof requiring visual verification

---

## Automation Options

### Option A: Manual (No Automation)

**Process:**
1. AI collects credentials via conversation
2. Admin reviews responses manually
3. Admin saves data to spreadsheet/database
4. Admin follows up if needed

**Tools:**
- ChatGPT/Claude for AI conversation
- Google Sheets/Airtable for data storage
- Email for follow-ups

**Time:** 15-30 minutes per coach  
**Best For:** Testing, small volume (< 20 coaches/month)

---

### Option B: Semi-Automated (Recommended)

**Process:**
1. AI conversation via API (OpenAI, Anthropic)
2. Structured data extraction (JSON format)
3. Automatic storage in database
4. Email notifications to admin for flags
5. Admin reviews flagged profiles only

**Tools:**
- OpenAI API or Anthropic API
- Database (Airtable, Firebase, PostgreSQL)
- Zapier/Make.com for workflows
- Email service (SendGrid, Mailgun)

**Time:** 5-10 minutes per coach (mostly automated)  
**Best For:** Medium volume (20-100 coaches/month)

**Setup Steps:**
1. Create AI conversation prompt (see `ai-onboarding/coach-onboarding-prompt.txt`)
2. Set up API integration
3. Configure data extraction and storage
4. Set up email notifications
5. Test with sample coach

---

### Option C: Fully Automated

**Process:**
1. AI conversation via custom chatbot interface
2. Real-time data extraction and validation
3. Automatic file uploads and storage
4. Automatic profile generation
5. Auto-approve if no flags (with admin notification)
6. Admin only reviews flagged profiles

**Tools:**
- Custom chatbot (React, Vue, etc.)
- Backend API (Node.js, Python, etc.)
- Database (PostgreSQL, MongoDB)
- File storage (S3, Cloudinary)
- AI API (OpenAI, Anthropic)

**Time:** 2-5 minutes per coach (fully automated)  
**Best For:** High volume (100+ coaches/month)

**Setup Steps:**
1. Build chatbot interface
2. Integrate AI API
3. Set up database and file storage
4. Implement data extraction logic
5. Set up auto-approval rules
6. Configure admin dashboard
7. Test end-to-end

---

## Data Storage Format

### Recommended Structure

```json
{
  "coach_id": "unique-id",
  "profile": {
    "name": "Coach Name",
    "email": "coach@example.com",
    "phone": "optional",
    "bio": "Coaching description",
    "specialization": "Executive coaching",
    "photo_url": "url-to-photo"
  },
  "credentials": {
    "certifications": [
      {
        "name": "ICF Certified",
        "organization": "ICF",
        "date": "2020-01-15",
        "certificate_url": "url-to-file"
      }
    ],
    "experience": {
      "years": 5,
      "background": "Coaching description",
      "client_types": ["Executives", "Leaders"]
    },
    "website": {
      "url": "https://example.com",
      "verified": true
    },
    "social_links": {
      "linkedin": "url",
      "twitter": "url"
    },
    "testimonials": [
      {
        "text": "Testimonial text",
        "client_name": "Name (optional)",
        "date": "2024-01-15",
        "source_url": "url-if-public"
      }
    ],
    "payment_proof": {
      "verified": true,
      "screenshot_url": "url-to-file",
      "date": "2024-01-15"
    }
  },
  "verification": {
    "tier": "Pro",
    "status": "pending",
    "trust_score": 85,
    "flags": [],
    "collected_at": "2024-01-15T10:00:00Z",
    "verified_at": null
  }
}
```

---

## Validation Rules

### URL Validation

**Check:**
- URL format is valid
- Link is accessible (not broken)
- Website is active and relevant
- Content matches coaching focus

**Auto-Check:**
- URL accessibility (HTTP status code)
- Domain age (if suspicious)
- Content analysis (AI checks for coaching-related content)

---

### Email Validation

**Check:**
- Email format is valid
- Email domain exists
- Email is not a disposable/temporary email

---

### File Validation

**Check:**
- File type is allowed (PNG, JPG, PDF)
- File size is within limits (max 5MB)
- Image quality is readable (for certificates/screenshots)
- No malicious content (virus scan)

---

### Date Validation

**Check:**
- Dates are valid format (YYYY-MM-DD)
- Dates are not in the future
- Experience dates make sense (e.g., certification date before experience start)

---

## Status Updates

### Email Notifications

**Send Emails When:**

1. **Credential Collection Started**
   - Welcome email when coach begins verification
   - Set expectations and timeline

2. **Missing Credentials**
   - Reminder if coach hasn't completed
   - Specific list of missing items
   - Link to complete verification

3. **Credential Collection Complete**
   - Confirmation that all credentials received
   - Next steps (review timeline)
   - Link to view profile status

**Templates:** See `automations/status-updates.md`

---

### SMS Notifications (Optional)

**Send SMS When:**
- Credential collection complete (if urgent)
- Verification approved (time-sensitive)
- Missing critical credentials (urgent follow-up)

**Tools:**
- Twilio
- MessageBird
- Native platform SMS

---

## Best Practices

### Do's
- ✅ Collect credentials in logical order (easiest first)
- ✅ Validate data in real-time (catch errors early)
- ✅ Provide clear examples of acceptable formats
- ✅ Allow coaches to save progress and return later
- ✅ Send friendly reminders (not pushy)

### Don'ts
- ❌ Overwhelm with too many questions at once
- ❌ Require credentials that are difficult to obtain
- ❌ Accept data without validation
- ❌ Lose data if coach closes browser
- ❌ Make coaches repeat information

---

## Security & Privacy

### Data Protection

**Store Securely:**
- Encrypt sensitive data (payment info, PII)
- Use secure file storage (S3 with encryption)
- Limit access to admin dashboard
- Comply with GDPR/CCPA if applicable

### Privacy Considerations

**Handle Carefully:**
- Payment screenshots (PII should be blurred)
- Client testimonials (respect client privacy)
- Personal information (only collect what's needed)

---

**This credential collection system ensures comprehensive, efficient, and secure gathering of coach verification data.**
