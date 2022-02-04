#if os(macOS)
import AppKit
import SwiftFoundationExtensions
import os

/**
 Opens the given URL  via the current shared workspace.
 */
public func sendUserToApplicationUrl(_ url: URL) {
  if !NSWorkspace.shared.open(url) {
    Logger.loggerFor("sendUserToApplicationUrl")
      .warning("Unable to open URL: \(url, privacy: .public)")
  }
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

#endif
