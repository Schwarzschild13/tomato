# Tomato

A calm Pomodoro timer with a to-do list, an Eisenhower matrix, a calendar and progress charts. It's one HTML file with no build step, no account and no server. Your data stays in your browser.

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

## Your data

Everything is saved in the browser's `localStorage`, so it belongs to that one browser on that one device. Clearing site data deletes it.

To move it to another browser or computer, or to keep a copy:

1. Scroll to the bottom of any page and click **Download backup**. This saves `tomato-backup-YYYY-MM-DD.json` with your tasks, session history and current task.
2. In the other browser, click **Import backup** and choose that file. Tomato shows what the file contains and asks before replacing anything. If that browser already has data, you can download it first.

The theme setting isn't part of the backup, so each device keeps its own.

## Notes

- Drag and drop in the matrix works with a mouse but not on touch screens. On a phone, change a task's priority from the **Tasks** tab instead.
- Animations are turned off when your system asks for reduced motion.
- Built with [Alpine.js](https://alpinejs.dev) 3.17.4, included in `vendor/` so the app works offline.
- `design-notes.md` describes the visual direction and how each screen behaves.
