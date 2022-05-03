# SwiftUIExtensions Library

[![GitHub](https://img.shields.io/github/license/xiiagency/SwiftUIExtensions?style=for-the-badge)](./LICENSE)

An open source library with utilities and extensions for SwiftUI.

Developed as re-usable components for various projects at
[XII's](https://github.com/xiiagency) iOS, macOS, and watchOS applications.

## Installation

### Swift Package Manager

1. In Xcode, select File > Swift Packages > Add Package Dependency.
2. Follow the prompts using the URL for this repository
3. Select the `SwiftUIExtensions` library to add to your project

## Dependencies

- [xiiagency/SwiftFoundationExtensions](https://github.com/xiiagency/SwiftFoundationExtensions)

## License

See the [LICENSE](LICENSE) file.

## Text case shorthands ([Source](Sources/SwiftUIExtensions/View%2BExtensions.swift))

```Swift
extension View {
  func standardcase() -> some View

  func uppercase() -> some View

  func lowercase() -> some View
}
```

Shorthand for applying the `textCase` `ViewModifier`.

## Shorthand for stretching `View`s ([Source](Sources/SwiftUIExtensions/View%2BExtensions.swift))

```Swift
extension Axis.Set {
  static let None: Axis.Set
  static let Horizontal: Axis.Set
  static let Vertical: Axis.Set
  static let All: Axis.Set
}

extension View {
  func stretch(
    _ axes: Axis.Set = [.horizontal],
    alignment: Alignment = .center
  ) -> some View
}
```

Sets the view's frame to stretch to fill its parent by setting `maxWidth` (and/or) `maxHeight` based on the requested `Axis`.

- By default it will stretch `.Horizontal` as it's the more common scenario
- Also allows for adjusting internal alignment with `.center` used as the default

## `ScenePhase` change shorthand ([Source](Sources/SwiftUIExtensions/OnScenePhaseChangedModifier.swift))

```Swift
extension View {
  func onScenePhaseChanged(
    _ action: @escaping (ScenePhase) -> Void
  ) -> some View
}
```

Calls an `action` when the `ScenePhase` has changed. Avoid performing long-running tasks in `action` since it is called from the main thread.

## `URL` open helpers

### Cross platform ([iOS](Sources/SwiftUIExtensions/UrlOpenHelpers%2BiOS.swift) + [macOS](Sources/SwiftUIExtensions/UrlOpenHelpers%2BmacOS.swift))

```Swift
func sendUserToApplicationUrl(_ url: URL)

func sendUserToApplicationUrl(_ urlString: String)
```

### [iOS](Sources/SwiftUIExtensions/iOSHelpers.swift) only

```Swift
func sendUserToApplicationSettings()
```

## iOS keyboard helpers ([Source](Sources/SwiftUIExtensions/iOSHelpers.swift))

```Swift
func hideKeyboard()
```

## `HiddenView` shorthand ([Source](Sources/SwiftUIExtensions/HiddenView.swift))

```Swift
struct HiddenView : View {
  init()

  var body: some View { get }
}
```

A specialty view that has no visible representation (clear 0x0 pixel view) but can still have functionality attached (e.g. `onChange(of:)`).

**NOTE:** If used in a container view that has spacing (e.g. `VStack`) this view will still be counted as one and will add unintended spacing.

## Avoid animations ([Source](Sources/SwiftUIExtensions/DoWithoutAnimation.swift))

```Swift
func doWithoutAnimations(_ block: @escaping () -> Void)
```

Performs the provided block in a transaction with animations disabled.

Useful for cancelling some animations that are hard to control (e.g. navigation view transitions).

**NOTE:** This is a bit finicky, use at your own risk.

## `MomentarySwitch` Utility ([Source](Sources/SwiftUIExtensions/MomentarySwitch.swift))

```Swift
class MomentarySwitch {
  init()

  func trigger(
    offDelaySeconds: Double = 0.0,
    switchOn: @escaping () -> Void,
    switchOff: @escaping () -> Void
  )
}
```

An implementation of a momentary switch: one that has an on/off state, can be turned on repeatedly, turns off after a delay. If triggered multiple times before the off delay is elapses, it re-schedules the reaction (relative to the last time it was triggered). Ideally used for triggering animations on user interaction, and auto-reverting once they've stopped interacting for enough time.

**NOTE:** The switch itself will operate on the background thread, but the on/off callbacks are executed on the `@MainActor`.
