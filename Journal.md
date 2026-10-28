# The Mirenva Journal

## The Big Picture

Mirenva is at the “fresh notebook, first clean page” stage: an iPhone-first app with an intentionally small foundation and enough engineering guardrails to grow without becoming a junk drawer. The first milestone is not flashy screens. It is identity, repeatable builds, tests, and a front door that always opens.

## Architecture Deep Dive

Think of the app as a restaurant before opening night. SwiftUI is the dining room, describing what guests see. Small injected services are the kitchen stations: each has one job, and a test double can stand in during rehearsal. The app entry point is the host who seats everyone, while persistence is the pantry—useful, deliberately controlled, and never accessed by random diners.

The test suite has three safety nets. Unit tests check individual recipes, package-integration tests confirm ingredients from Auralis arrive as advertised, and UI tests walk through the front door to ensure the restaurant actually opens.

## The Codebase Map

- `Mirenva/` contains the app entry point, root view, models, services, fixtures, and assets.
- `MirenvaTests/` checks app-owned behavior with Swift Testing.
- `MirenvaPackageIntegrationTests/` exercises one public Auralis package API.
- `MirenvaUITests/` launches the real app with XCUIAutomation.
- `.github/workflows/` is the tireless robot colleague that builds and tests every push.
- `README.md` is the public signpost; `AGENTS.md` is the workshop rulebook; this journal records why the workshop looks this way.

## Tech Stack & Why

- **SwiftUI** keeps the UI declarative and naturally aligned with Dynamic Type, VoiceOver, and platform behavior.
- **Swift 6 concurrency** turns data-race risks into compiler feedback instead of late-night production mysteries.
- **Swift Testing** gives unit and integration tests concise expectations and parallel execution by default.
- **XCUIAutomation** tests the assembled application, because a pile of correct parts can still produce a door that will not open.
- **GitHub Actions** makes the quality gate repeatable instead of relying on someone remembering a checklist.

## The Journey

### 2026-10-28 — The foundation audit

The first inspection found a project that built cleanly but was wearing the wrong name tags: iOS 27, Swift 5 language mode, minimal concurrency checking, no test targets, and no app icon. The useful lesson was that “build succeeded” and “acceptance criteria satisfied” are cousins, not twins.

### 2026-10-28 — Identity and engineering rails

We locked the repository identity around Mirenva, recorded the bundle and team identifiers, documented a short-lived branch workflow, and designed three distinct test layers. The bundle ID is treated like a passport number: changing the display name is easy; changing identity has consequences everywhere.

### 2026-10-28 — Test-target wiring war story

The three generated targets initially looked healthy because their files existed, but the main scheme discovered zero tests. Running each target directly exposed the difference between owning a test file and having a runnable test configuration. The unit and integration runners now pass independently, as does the UI automation runner. The remaining scheme association and real Auralis dependency are explicit open work rather than green checkmarks painted on cardboard.

### 2026-10-28 — The bundle-ID escape hatch

The UI runner was built with Mirenva available as a dependency, yet `XCUIApplication()` failed because Xcode had not assigned a default target application. Launching `XCUIApplication(bundleIdentifier:)` made that dependency explicit and unlocked real smoke coverage. The suite now proves the root screen appears, a Debug fixture survives a full terminate-and-relaunch cycle, and governed execution rejects an empty action. Sometimes the app is backstage and ready; the test just needs its exact dressing-room number.

## Engineer's Wisdom

- Make the compiler the strict teammate early. Swift 6 concurrency is much cheaper before mutable state spreads.
- Test boundaries, not trivia. A unit test should protect behavior; an integration test should prove a contract; a UI smoke test should prove launchability.
- Keep entitlements boring. Every extra capability expands signing complexity and the app's security surface.
- Never let Debug convenience leak into Release. Fixtures belong behind compile-time guards, not hopeful runtime conventions.
- Record external verification honestly. A checked-in bundle ID does not prove Apple registered it, and a simulator does not prove a physical device shows the right icon.

## If I Were Starting Over...

I would still start with the same unglamorous foundation, but I would create the test targets and CI in the same breath as the app target. Retrofitting quality gates is like installing smoke detectors after the first suspicious smell: possible, but unnecessarily exciting.
