# Tomato — design notes

**Direction:** Paper (chosen from round-01). A calm, warm notebook; one tomato-red accent so the timer feels like a ritual, not a dashboard.
**Primary task:** start a focus session on a chosen task. Everything else supports that or reviews it.
**Type:** Georgia italic for headings and the timer; system sans for body.
**Palette:** #f6f1e7 paper, #2b2622 ink, #c8442b tomato, #6f8a62 sage (breaks, due dates). Heatmap tiles are five tomato tints.

## Screens
- Focus: ring timer (Focus / Short / Long break), today's tasks, 26-week tiles
- Tasks: add with priority and due date, filter open/done/all, change priority inline
- Matrix: Eisenhower 2x2, drag between quadrants, quick add per quadrant
- Calendar: month view tinted by sessions, due-date markers, per-day task list
- Progress: stats, 14-day bar chart, tasks done by priority, 52-week tile heatmap

## Behaviour
- Completing a focus session logs it to today and the active task; every 4th is followed by a long break
- Data is stored in the browser (localStorage). The app starts empty; there is no sample data
- Backup: the footer's "Download backup" saves `tomato-backup-YYYY-MM-DD.json` (tasks, session history, current task). "Import backup" checks the file, shows what it contains and asks before replacing this browser's data, with a link to download the current data first. Bad files are rejected without touching anything. The theme is not included
- Motion: tab fade-in, check pop, button press; all disabled for reduced-motion

## Not verified
- No independent visual review. Checked by me at 1280 and 390 widths.
- Drag-and-drop uses HTML5 drag events, so it works with a mouse but not touch; on mobile use the priority selector in Tasks.
