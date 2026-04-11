# WHO2MEET Cloud Functions

## Setup

### 1. Install dependencies

```bash
cd functions && npm install
```

### 2. Configure Resend API Key

Get your API key from [resend.com](https://resend.com) and configure one of these:

Preferred (Secret Manager):

```bash
firebase functions:secrets:set RESEND_API_KEY
```

Legacy fallback (Runtime Config):

```bash
firebase functions:config:set resend.api_key="re_xxxxxxxx"
```

Optional from-address override:

```bash
firebase functions:config:set resend.from="WHO2MEET <noreply@yourdomain.com>"
```

### 3. Deploy

```bash
firebase deploy --only functions
```

## sendTeamResultsEmail

Callable function that sends team matching results to an email address.

- **HTML email**: Full team data with styling (inline CSS for email client compatibility)
- **Screenshot**: Placeholder for future implementation (Puppeteer or external API)
- **Validation**: Email format, session code (6 chars), session existence, teams presence
- **API key resolution order**: `RESEND_API_KEY` secret → `process.env.RESEND_API_KEY` → `functions.config().resend.api_key`
- **From address**: `process.env.RESEND_FROM_EMAIL` → `functions.config().resend.from` → `WHO2MEET <onboarding@resend.dev>`

### Resend sandbox

When using `onboarding@resend.dev` (default), you can only send to:
- `delivered@resend.dev` — test successful delivery
- `bounced@resend.dev` — test bounce
- `complained@resend.dev` — test spam complaint

For production (sending to any email), verify your domain in [Resend Dashboard](https://resend.com/domains) and update the `from` address.
