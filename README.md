# Mirenva

Mirenva is a new iOS application built independently with SwiftUI. The initial foundation targets iPhone first and supports iPad where appropriate.

## App identity

- Display name: `Mirenva`
- Bundle identifier: `ETH.Mirenva.Mirenva`
- Apple Developer team ID: `U4R9TJ5FN4`
- Minimum deployment target: iOS 26.0
- App lifecycle: SwiftUI
- Swift language mode: Swift 6 with complete strict concurrency checking

The bundle identifier is an immutable project identity. Changing it requires an explicit architecture decision and coordinated Apple Developer and CI updates.

### Apple Developer checklist

- [ ] Confirm `ETH.Mirenva.Mirenva` is registered under team `U4R9TJ5FN4` in Certificates, Identifiers & Profiles.
- [ ] Confirm automatic signing resolves a development provisioning profile.
- [ ] Install a Debug build on a physical iPhone and verify the name “Mirenva” and placeholder icon.

These account and device checks cannot be proven by repository configuration alone.

## Requirements

- Xcode 26 or newer
- iOS 26 simulator or device
- Access to Apple Developer team `U4R9TJ5FN4` for device signing

## Build and test

1. Open `Mirenva.xcodeproj`.
2. Select the shared `Mirenva` scheme and an iOS 26 simulator.
3. Press **⌘B** to build or **⌘R** to run.
4. Press **⌘U** to run unit, package-integration, and UI tests.

CI runs the same build and test gate on every push and pull request.

## Branching convention

- `main` is always buildable and protected by CI.
- Create short-lived branches named `feature/<ticket>-<description>`, `fix/<ticket>-<description>`, or `chore/<description>`.
- Rebase or merge the latest `main`, obtain review, and squash-merge after CI passes.
- Do not commit directly to `main` except for an explicitly approved emergency fix.

## Repository map

- `Mirenva/` — application source and assets
- `MirenvaTests/` — Swift Testing unit coverage
- `MirenvaPackageIntegrationTests/` — public Auralis package API coverage
- `MirenvaUITests/` — XCUIAutomation launch and smoke coverage
- `.github/workflows/` — continuous integration
- `AGENTS.md` — durable project conventions for contributors and coding agents
- `Journal.md` — architectural decisions, lessons, and project history

