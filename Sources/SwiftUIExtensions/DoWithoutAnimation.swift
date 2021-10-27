import SwiftUI

/**
 Performs the provided block in a transaction with animations disabled.
 Useful for cancelling some animations that are hard to control (e.g. navigation view transitions).
 NOTE: This is a bit finicky, use at your own risk.
 */
public func doWithoutAnimations(_ block: @escaping () -> Void) {
  var transaction = Transaction(animation: nil)
  transaction.disablesAnimations = true
  withTransaction(transaction, block)
}
