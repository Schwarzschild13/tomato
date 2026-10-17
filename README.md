# Tomato

A calm Pomodoro timer with a to-do list, an Eisenhower matrix, a calendar and progress charts. It's one HTML file with no build step. It works without an account, with your data kept in the browser. If you want, you can sign in with your email to keep your data safe and use it on every device.

## Features

- **Focus**: 25-minute focus sessions with short (5 min) and long (15 min) breaks. Every fourth session is followed by a long break. Pick a task to focus on and each finished session is counted against it.
- **Tasks**: add tasks with a priority and a due date, tick them off and filter by open, done or all.
- **Priority matrix**: an Eisenhower 2×2 (Do first, Schedule, Delegate, Eliminate). Drag tasks between quadrants or add straight into one.
- **Calendar**: a month view shaded by how many sessions you did each day, with due dates marked. Click a day to see and add its tasks.
- **Progress**: today, this week, current streak and total focus time, a 14-day bar chart, tasks done by priority, and a GitHub-style heatmap of the last 52 weeks.
- **Light and dark themes**: switch with the cat in the top-right corner. The first visit follows your system setting.

## Run it

Open `index.html` in a browser. That's it.

To use it from any device, host the folder on any static host. For GitHub Pages: **Settings → Pages → Deploy from a branch → `main` / root**.

## Sign-in and sync (optional)

With sync set up, a **Sign in** button appears. Signing in uses email only: Tomato emails you a link, and opening it signs you in. There's no password. Once you're signed in, your tasks and history are saved to your account and kept the same on every device you sign in on. Without sync set up, Tomato works exactly as before.

Sync runs on [Supabase](https://supabase.com) (free plan is plenty). One-time setup:

1. **Create a project** at supabase.com.
2. **Create the table.** Open **SQL Editor → New query**, paste the contents of `supabase/schema.sql` and click **Run**. It creates one row per account and turns on row-level security, so a signed-in person can only ever read or change their own row.
3. **Set where sign-in links go.** Open **Authentication → URL Configuration**. Set **Site URL** to where Tomato is hosted (for example `https://kudukudu.wasmer.app/`). Under **Redirect URLs**, add that same URL, plus `http://localhost:8000/` if you want to test locally.
4. **Connect the app.** Open **Project Settings → API Keys** and copy the **Project URL** and the **publishable** key (or the legacy **anon** key) into `config.js`. Both are meant to be public. Never use the secret or `service_role` key.

Sign-in links only work when Tomato is served over `http(s)`, not opened as a file. To test locally, run `python3 -m http.server 8000` in this folder and open `http://localhost:8000/`.

Supabase's built-in email sender only allows a few emails an hour, and is meant for testing (it may only deliver to members of your Supabase team). That's fine for your own use. To let other people sign in, add your own SMTP provider (Resend has a free tier) under **Authentication → Emails → SMTP Settings**.

**Optional: a code in the email.** Once custom SMTP is set up, the email templates become editable. In both **Confirm signup** and **Magic link or OTP**, add a line such as `<p>Or enter this code in Tomato: <strong>{{ .Token }}</strong></p>`. People can then type the code under **Have a code instead?**, which helps on phones where the mail app opens links in its own browser.

## Your data

Without signing in, everything is saved in the browser's `localStorage`, so it belongs to that one browser on that one device. Clearing site data deletes it.

When you're signed in:

- **The browser still keeps a copy**, so Tomato works offline. Changes made offline sync when you're back online, and the footer shows whether everything is synced.
- **The first time you sign in on a device**, any tasks already in that browser are added to your account. Nothing is replaced.
- **Changes made on two devices at once are merged.** For each task the newer edit wins, deleted tasks stay deleted, and each day keeps the higher session count.
- **Signing out** first makes sure every change has reached your account. If you're offline, it waits until you're back. Then it removes the data from that browser. Sign in again to get it back.
- **Importing a backup while signed in** replaces the data in your account, on every device.

To move it to another browser or computer, or to keep a copy:

1. Scroll to the bottom of any page and click **Download backup**. This saves `tomato-backup-YYYY-MM-DD.json` with your tasks, session history and current task.
2. In the other browser, click **Import backup** and choose that file. Tomato shows what the file contains and asks before replacing anything. If that browser already has data, you can download it first.

The theme setting isn't part of the backup or sync, so each device keeps its own.

## Notes

- Drag and drop in the matrix works with a mouse but not on touch screens. On a phone, change a task's priority from the **Tasks** tab instead.
- Animations are turned off when your system asks for reduced motion.
- Built with [Alpine.js](https://alpinejs.dev) 3.17.4 and [supabase-js](https://github.com/supabase/supabase-js) 2.117.2 (MIT), both included in `vendor/` so the app works offline.
- `design-notes.md` describes the visual direction and how each screen behaves.
