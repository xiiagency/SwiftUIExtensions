import SwiftUI

/**
 A specialty view that has no visible representation (clear 0x0 pixel view) but can still have functionality attached (e.g. onChange(of:)).
 NOTE: If used in a container view that has spacing (e.g. VStack) this view will still be counted as one and will add unintended spacing.
 */
public struct HiddenView : View {
  public init() { }
  
  public var body: some View {
    Color.clear
      .frame(width: 0, height: 0)
  }
}
