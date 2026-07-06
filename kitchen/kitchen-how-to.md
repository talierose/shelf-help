# Shelf Help: Kitchen — Natalie's How-To Page

*The food app. Lives inside your existing shelf-help site, uses the same login.*

---

## The important addresses

| What | Where |
|---|---|
| **The kitchen app** | https://talierose.github.io/shelf-help/kitchen/ |
| **The code** (same repository as Shelf Help) | https://github.com/talierose/shelf-help |
| **The database** (same Supabase project) | https://supabase.com/dashboard — sign in with GitHub |

## One-time setup (two steps, ~5 minutes)

### 1. Create the database tables
1. Go to https://supabase.com/dashboard → open your shelf-help project
2. Left sidebar → **SQL Editor** → **New query**
3. Open `kitchen-setup.sql` (in the kitchen folder), copy ALL of it, paste it in, press **Run**
4. It should say "Success. No rows returned" — done. (Safe to run twice by accident.)

### 2. Allow the login link to point at the kitchen page
1. Same dashboard → **Authentication** → **URL Configuration**
2. Under **Redirect URLs**, add: `https://talierose.github.io/shelf-help/kitchen/`
3. Save

### 3. Upload to GitHub
1. Go to https://github.com/talierose/shelf-help → **Add file → Upload files**
2. Drag the whole **kitchen** folder in (GitHub keeps the folder structure — you should see files listed as `kitchen/index.html`, `kitchen/manifest.json`, etc.)
3. **Commit changes**, wait ~1–2 minutes, check the **Actions** tab for the green tick
4. Visit https://talierose.github.io/shelf-help/kitchen/ — log in with your email, same as the main app

## Getting it on your phone as its own app

Open https://talierose.github.io/shelf-help/kitchen/ in your phone's browser → menu → **Add to Home Screen**. Because the kitchen has its own manifest and icon, it installs as a *separate* app from Shelf Help — green icon with a plate and carrot.

## Using it day-to-day

- **🥫 Food in** — everything you've got, sorted so the stuff that needs eating soonest is at the top. Each item shows portions left, use-by badge, and tags. Buttons: **🍴 ate a portion** (knocks one portion off; the item disappears when it hits zero), **🗑 went bad** (bins ALL remaining portions and logs it — this is the honest button that helps you buy less of it next time), **✏️ edit**, **✖ remove** (deletes without logging — for typos, not spoilage!).
- **➕ Add** — name, portions, use-by date, tags (savoury / sweet / snack / main meal / ingredient… tap previous ones), and keywords ("spicy, rice, comfort food") that help the matcher.
- **🍽️ What should I eat?** — type what you fancy. Every word you type scores each item: name match +3, tag match +2, keyword/notes match +1. Then urgency is added on: past use-by +3, **use by today +2, tomorrow +1** — so things that need eating float up. Top match gets a green edge. Tap **🍴 ate a portion** right from the results.
- **📊 Stats** — pick a period (7/30/90/365 days): portions eaten vs binned (with your waste percentage), what you ate, eaten by tag, and **"went bad — consider buying less"** — that last list is your shopping-trip cheat sheet.

## Where your data lives

Everything (food, history) is in your Supabase database, per-account — so phone and laptop always agree, and logging in on a new device brings it all back. Nothing food-related is stored in the browser, so no backups needed for this one.

## When things go wrong

Same fixes as the main app: login email in spam / wait an hour; old version showing → **Ctrl+Shift+R**; failed deploy → GitHub Actions → **Re-run all jobs**. If the app says "Problem loading…" the free database may have paused after a quiet week — open the Supabase dashboard and it'll offer to restore it.

## Asking Claude for changes

Attach `kitchen/index.html` and this file, and describe what you want. The whole app is that one file — Claude gives you a new one, you upload it over the old one at `kitchen/index.html` in the repo (Add file → Upload files → drag it in — but into the kitchen folder: easiest is to upload the whole kitchen folder again).
