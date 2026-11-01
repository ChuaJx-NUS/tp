# Chua Choon Hsiang — Project Portfolio Page

## Overview

BusyNotFree is a Java command-line application that helps freelancers manage clients,
projects, dated tasks and events. My contributions focus on project summaries, task completion
and progress, and saving data between sessions.

## Summary of Contributions

- **Code contributed:** [RepoSense code dashboard](https://nus-cs2113-ay2627-s1.github.io/tp-dashboard/?search=ChuaJx-NUS&breakdown=true).

- **Project summaries:** Implemented `project.view PROJECT_ID`, `project.view all` and
  `project.view`. Summaries resolve the owning client, separate tasks from events and handle
  missing projects and empty sections. Added diagnostic logging and assertions to check
  internal lookup consistency. Evidence: [PR #32](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/32),
  [logging in PR #35](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/35) and
  [assertions in PR #36](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/36).

- **Saving and loading:** Implemented UTF-8 properties storage for clients, notes, projects,
  tasks and events, and connected saving to `exit`. Stored next-ID counters preserve identifiers
  after deletion and restart. Writes use a temporary file before replacement; invalid saved
  data is reported at startup. Added `save` to persist work without ending the session, using
  a shared save action so tests can simulate I/O failures. Evidence:
  [PR #32](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/32) and
  [save command in PR #83](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/83).

- **Task completion and project progress:** Implemented `task.mark` and `task.unmark`,
  `[COMPLETED]` / `[In Progress]` labels and a completed-task count for each project. Derived
  progress from the task list to avoid a separate count becoming stale. Extended storage to
  retain completion flags, defaulting missing flags to incomplete for older save files.
  Evidence: [PR #63](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/63) and
  [PR #82](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/82).

- **Testing:** Added JUnit tests for project summaries, completion changes, save/load round
  trips, older-file compatibility and failed saves. Added ten additional regression tests
  covering project isolation, malformed storage and application restarts in
  [PR #92](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/92).

- **User documentation:** Documented [project summaries](../UserGuide.md#view-a-project-summary-projectview),
  [task completion](../UserGuide.md#mark-a-task-complete-taskmark),
  [reopening tasks](../UserGuide.md#reopen-a-task-taskunmark) and
  [saving/loading](../UserGuide.md#save-without-exiting-save), including examples, validation
  and failure behaviour. Updated the v1.0 setup instructions and command summary in
  [PR #39](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/39).

- **Developer documentation:** Explained [project.view](../DeveloperGuide.md#viewing-project-details-projectview)
  and [task completion, progress and persistence](../DeveloperGuide.md#task-completion-project-progress-and-persistence),
  including the design choices and verification. Added the project-view, task-marking,
  save-command and task-restoration sequence diagrams and the task-completion class diagram.
  Evidence: [PR #83](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/83) and
  [DG revisions in PR #93](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/93).
  For v2.1, removed internal boolean returns to the human actor from the project-view
  and task-completion diagrams following peer feedback. Added the shared
  [architecture overview](../DeveloperGuide.md#architecture-overview),
  [command-processing explanation](../DeveloperGuide.md#shared-command-processing)
  and linked contents, and clarified the [Task/Event glossary](../DeveloperGuide.md#glossary).
