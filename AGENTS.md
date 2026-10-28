# Mirenva Project Guide

## Project overview

Mirenva is a new iOS 26 SwiftUI application. It is not an Auralis app clone; Auralis may be consumed only through explicit Swift package dependencies and public APIs.

## Architecture decisions

- SwiftUI owns the application lifecycle and UI composition.
- Swift 6 concurrency checking is complete; new code must remain warning-free.
- Dependencies are injected at boundaries so production services can be replaced in tests.
- Persistence and governed execution are represented behind small protocols rather than global state.
- Debug fixtures compile only in Debug builds and must never become Release behavior.
- Swift Testing is used for unit and integration tests. XCTest remains in use for XCUIAutomation UI tests.

## Conventions

- Types use PascalCase; properties and methods use camelCase.
- Prefer immutable `let` values and `@State private` for view-owned state.
- Prefer async/await and actors over callbacks, Combine, or manually synchronized shared state.
- Avoid force unwraps and force casts.
- Keep SwiftUI views small and accessible, using native controls, semantic text styles, and adaptive layouts.
- Add no entitlement until an implemented feature demonstrably requires it.
- Update `Journal.md` for significant features, non-trivial fixes, architectural choices, and new gotchas.

## Build and run

- Open `Mirenva.xcodeproj` in Xcode 26 or newer.
- Use the shared `Mirenva` scheme.
- Build with **⌘B**, run with **⌘R**, and execute the complete test suite with **⌘U**.
- The minimum supported operating system is iOS 26.0.
- Debug and Release use automatic signing with team `U4R9TJ5FN4`.

## Git workflow

`main` must stay green. Use `feature/<ticket>-<description>`, `fix/<ticket>-<description>`, or `chore/<description>` branches and merge only after CI passes.

## Quirks and gotchas

- Apple Developer identifier registration and physical-device icon verification are external checks; do not infer success from a simulator build.
- The app bundle ID is locked to `ETH.Mirenva.Mirenva`.
- The integration target intentionally consumes an Auralis package; application-target source must not be copied from Auralis.
- Debug fixtures must be guarded with `#if DEBUG` and referenced only from Debug launch paths.

