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
 Opens the given URL  if it can be opened on the current device. Does nothing otherwise.
 */
public func sendUserToApplicationUrl(_ url: URL) {
  // Ensure the url for the app can actually be opened.
  guard UIApplication.shared.canOpenURL(url) else {
    return
  }
  
  // Finally, send the user to the requested app url.
  UIApplication.shared.open(url)
}

/**
 Opens the given URL string if it can be parsed and opened on the current device. Does nothing otherwise.
 */
public func sendUserToApplicationUrl(_ urlString: String) {
  // Make sure the URL can be parsed first.
  guard let url = URL(string: urlString) else {
    return
  }
  
  sendUserToApplicationUrl(url)
}

/**
 Opens the App's setting screen in the OS' Settings app.
 */
public func sendUserToApplicationSettings() {
  sendUserToApplicationUrl(UIApplication.openSettingsURLString)
}
#endif
