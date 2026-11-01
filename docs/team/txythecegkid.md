# Tan Xuan You - Project Portfolio Page

## Overview

BusyNotFree is a Java command-line application that helps freelancers manage clients, projects, dated tasks and events.
It supports saving work between sessions. My contributions focus on creating and editing projects, tasks and events,
the shared command-argument parsing and validation they rely on, and the matching design documentation.

## Summary of Contributions

- **Code contributed:** [tP Code Dashboard](https://nus-cs2113-ay2627-s1.github.io/tp-dashboard/?search=txythecegkid&breakdown=true).

- **Enhancements implemented:**
  - **Creating projects, tasks and events (v1.0):** Implemented `project.add`, `task.add` and `event.add`, with the
    `Project`, `ScheduledItem`, `Task` and `Event` model classes and `ProjectManager`.
    - **Argument parsing:** Wrote the shared `ArgumentParser`, which accepts prefixes in any order and keeps slashes
      inside values (e.g. `name/Review UI/UX mockup`).
    - **Validation:** Missing, blank, repeated and unexpected prefixes are rejected. Dates are checked strictly, so
      impossible dates such as `2026-02-30` are rejected instead of being silently corrected.
    - **IDs:** Each type has its own ID sequence (`P001`, `T001`, `E001`), and IDs are allocated only after a command
      succeeds, so failed commands leave no gaps.
    - **Parallel development:** `ProjectManager` checks clients through a `ClientLookup` interface, so project creation
      was built and tested before client management existed and then connected to `ClientManager` without changes.
    - Evidence: [PR #26](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/26).
  - **Exception hierarchy:** Introduced the unchecked `BusyNotFreeException` base class and its subclasses for each
    layer, so the command loop reports expected errors without hiding programming errors. All six exception classes
    in the application now extend it, including teammates' client exceptions.
  - **Editing tasks and events (v2.0):** Implemented `task.edit` and `event.edit` to change an item's description and
    date in one step.
    - **No partial edits:** Every check runs before any field is changed, so an invalid edit leaves the item untouched.
    - **Identity preserved:** The ID and owning project are `final`, the task's completion state is kept, and
      `project/` is rejected so an edit cannot move an item.
    - Added the application-wide `getEvent` lookup, later reused by `event.delete`.
    - Evidence: [PR #71](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/71), closing issues #42 to #45.
  - **Usability:** Confirmations now name the project, task, event and client (e.g. `Created project P001 "Website
    redesign" for client C001 "Acme Studio".`). Missing-ID errors point to the command that lists valid IDs; the
    project hint also helps `project.status` and `project.delete`.
  - **Code quality:** Added assertions, null checks and `FINE`-level logging that records only IDs, never client or
    task details. Brought my code in line with the course's Java coding standard and moved a test-only stub out of
    the production code.

- **Testing:** Created the JUnit test classes for parsing, creation, editing and the model. These include 159
  generated cases in `AddCommandValidationTest` (every argument order, invalid dates, free-text names) and 56 in
  `EditCommandTest`. Each rejected command is checked to leave data unchanged and not to use up an ID.

- **Contributions to the User Guide:** Wrote the [edit a task](../UserGuide.md#edit-a-task-taskedit) and
  [edit an event](../UserGuide.md#edit-an-event-eventedit) sections and their command-summary rows. Updated the
  [add a project](../UserGuide.md#add-a-project-projectadd), [add a task](../UserGuide.md#add-a-task-taskadd) and
  [add an event](../UserGuide.md#add-an-event-eventadd) sections with the new confirmation messages and tips on
  looking up IDs.

- **Contributions to the Developer Guide:** Wrote
  [Creating projects, tasks and events](../DeveloperGuide.md#creating-projects-tasks-and-events-projectadd-taskadd-and-eventadd)
  and [Editing tasks and events](../DeveloperGuide.md#editing-tasks-and-events-taskedit-and-eventedit), covering the
  model, parsing, error handling and design alternatives. Added the user stories for these features.
  - UML diagrams added: the model class diagram (`CreationModelClassDiagram`), an object diagram of the model after a
    sample session (`CreationObjectDiagram`), and the `project.add` and `task.add` sequence diagrams
    (`AddProjectSequenceDiagram`, `AddTaskSequenceDiagram`).
  - Revised these diagrams after the DG peer review: removed return arrows to the user, showed the client lookup
    after project creation, and redrew the class diagram so that no lines cross. Evidence:
    [PR #97](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/97),
    [PR #101](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/101).

- **Contributions to team-based tasks:**
  - Helped set up the issue tracker: created v1.0 epics and user stories for teammates' features as well as my own
    (#6 to #10), and the epic, user stories and tasks for my v2.0 feature (#41 to #45).
  - Reviewed and merged a teammate's [PR #63](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/63) so that work
    depending on it could continue.
  - Reported [issue #72](https://github.com/AY2627S1-CS2113-T10-3/tp/issues/72): the client UI regression test's
    expected output was out of date and the test was not run in CI. Both were then fixed by the team.

- **Review/mentoring contributions:** Reviewed and approved 14 teammate PRs, including feature PRs
  [#27](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/27), [#32](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/32),
  [#63](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/63), [#80](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/80),
  [#82](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/82), [#83](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/83),
  [#89](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/89) and [#92](https://github.com/AY2627S1-CS2113-T10-3/tp/pull/92).

- **Contributions beyond the project team:** Reviewed the Developer Guide of team CS2113-W12-4, with comments on
  their diagrams and explanations
  ([1](https://github.com/NUS-CS2113-AY2627-S1/tp/pull/9#discussion_r4408059242),
  [2](https://github.com/NUS-CS2113-AY2627-S1/tp/pull/9#discussion_r4408067956),
  [3](https://github.com/NUS-CS2113-AY2627-S1/tp/pull/9#discussion_r4408073988),
  [4](https://github.com/NUS-CS2113-AY2627-S1/tp/pull/9#discussion_r4408096727),
  [5](https://github.com/NUS-CS2113-AY2627-S1/tp/pull/9#discussion_r4408114337)).
