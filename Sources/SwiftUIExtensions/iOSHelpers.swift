#if os(iOS)
import UIKit

/**
 Dismisses the keyboard from anywhere in the application.
 NOTE: Only available on iOS.
 */
public func hideKeyboard() {
  UIApplication.shared
    .sendAction(
      #selector(UIResponder.resignFirstResponder),
      to: nil,
      from: nil,
      for: nil
    )
}

/**
 Opens the App's setting screen in the OS' Settings app.
 */
public func sendUserToApplicationSettings() {
  sendUserToApplicationUrl(UIApplication.openSettingsURLString)
}
#endif
