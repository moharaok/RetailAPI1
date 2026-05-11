# 90-Second Demo: Automated Incident Remediation with AWS DevOps Agent

## Demo Overview

**Audience:** Customers, SAs, leadership  
**Duration:** 90 seconds  
**Goal:** Show the end-to-end flow from alarm → auto-fix → PR ready for review  

---

## Pre-Demo Setup (Before Recording)

1. **Have a sample application deployed** with CloudWatch alarms configured (e.g., a Lambda-based API with an error rate alarm)
2. **Inject a bug** into the application code (e.g., a null pointer exception, incorrect API response parsing, or a misconfigured timeout)
3. **Pre-configure the DevOps Agent** with access to your repo, CloudWatch, and Slack
4. **Open these windows/tabs side by side:**
   - CloudWatch Alarms console (showing the alarm in OK state)
   - Your Slack channel (where notifications will post)
   - Your code repository (GitHub/CodeCommit PR page)
5. **Start screen recording** with all three visible

---

## Demo Script (Narration + Actions)

### 🎬 [0:00–0:10] — Set the Scene

**Narration:**
> "Let me show you how we reduced our Mean Time to Resolution from hours to minutes using AWS DevOps Agent. I'm going to trigger an application error and show you what happens — completely hands-free."

**On screen:** Show the CloudWatch alarm in OK state.

---

### 🚨 [0:10–0:20] — Trigger the Incident

**Narration:**
> "I've just deployed a code change that introduces a bug. Watch the CloudWatch alarm — within seconds, the error rate breaches our threshold."

**Action:** Trigger the error (invoke the buggy endpoint, or deploy the bad code). Show the alarm transitioning to ALARM state.

---

### 🤖 [0:20–0:40] — DevOps Agent Investigates

**Narration:**
> "The moment that alarm fires, it automatically invokes our AWS DevOps Agent. The agent is now pulling CloudWatch logs, analyzing metrics, and reviewing the application code in our repository — all without any human intervention."

**On screen:** Show the DevOps Agent investigation in progress (if you have a console view or logs showing the agent working). Alternatively, show a brief "investigating..." status or transition animation.

---

### 🔍 [0:40–0:55] — Root Cause Found + Fix Created

**Narration:**
> "In under a minute, the agent identified the root cause — a code defect in our request handler. It's already generated a fix, created a new branch, and opened a pull request. Let me switch to Slack."

**Action:** Switch to the Slack channel showing the notification with:
- Root cause summary
- Link to the PR
- Relevant metrics

---

### ✅ [0:55–1:20] — Show the Pull Request

**Narration:**
> "Here's the Slack notification — root cause identified, fix applied, PR created. Let me open the pull request..."

**Action:** Click the PR link. Show:
- The PR description (root cause analysis + fix explanation)
- The code diff (before/after)

**Narration:**
> "Look at this — I didn't investigate anything. I didn't write a single line of code. The agent analyzed the logs, found the bug, wrote the fix, and created this PR. My only job now is to review and approve."

---

### 🎯 [1:20–1:30] — Closing Statement

**Narration:**
> "This is the shift — from engineers reacting to problems, to engineers reviewing solutions. What used to take 1–3 hours now takes minutes, and it happens whether I'm at my desk or not. That's the power of automated remediation with AWS DevOps Agent."

---

## Key Talking Points (If Questions Come Up)

| Question | Answer |
|----------|--------|
| "What if the fix is wrong?" | The agent creates a PR, not a direct deploy. Human review is still in the loop. |
| "What types of issues can it fix?" | Application code defects — null pointers, logic errors, misconfigurations in code. Infra issues get flagged but not auto-fixed. |
| "Does it work with any language?" | It supports the languages the DevOps Agent supports in your repository. |
| "What about security?" | Agent has scoped permissions — read logs/metrics, read/write to repo branches. No production deploy access. |

---

## Demo Tips

- **Keep it fast-paced** — 90 seconds goes quickly. Rehearse the narration so you're not fumbling
- **Pre-stage everything** — don't wait for real-time propagation; have the alarm ready to flip
- **Use a simple, relatable bug** — something the audience can immediately understand in the diff (e.g., `response.data` instead of `response.body`)
- **Show, don't tell** — the Slack message + PR diff are your money shots. Spend the most time there
- **End on the mindset shift** — "reviewing solutions, not investigating problems" is the sticky message

---

## Timeline Summary

| Timestamp | What's Happening | What's On Screen |
|-----------|-----------------|-----------------|
| 0:00–0:10 | Set the scene | CloudWatch alarm (OK state) |
| 0:10–0:20 | Trigger the error | Alarm transitions to ALARM |
| 0:20–0:40 | Agent investigates | Agent activity / transition |
| 0:40–0:55 | Root cause + fix | Slack notification |
| 0:55–1:20 | Show the PR | GitHub/CodeCommit PR + diff |
| 1:20–1:30 | Closing statement | PR still on screen |
