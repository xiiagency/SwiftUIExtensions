import SwiftUI

extension View {
  /**
   Resets the text case of the View.
   Equivalent to: `textCase(nil)`
   */
  public func standardcase() -> some View {
    textCase(nil)
  }
  
  /**
   Sets the text case of the View to uppercase.
   Equivalent to: `textCase(.uppercase)`
   */
  public func uppercase() -> some View {
    textCase(.uppercase)
  }
  
  /**
   Sets the text case of the View to lowercase.
   Equivalent to `textCase(.lowercase)`
   */
  public func lowercase() -> some View {
    textCase(.lowercase)
  }
  
  /**
   Sets the view's frame to stretch to fill its parent by setting maxWidth (and/or) maxHeight based on the requested `Axis`.
   - By default it will stretch `.horizontal` as it's the more common scenario.
   - Also allows for adjusting internal alignment with `.center` used as the default.
   */
  public func stretch(
    _ axes: Axis.Set = [.horizontal],
    alignment: Alignment = .center
  ) -> some View {
    frame(
      maxWidth: axes.contains(.horizontal) ? .infinity : nil,
      maxHeight: axes.contains(.vertical) ? .infinity : nil,
      alignment: alignment
    )
  }
}

/**
 Provide static members for various standard sets of `Axis`.
 */
extension Axis.Set {
  /**
   An empty set of `Axis`.
   */
  public static let None: Axis.Set = []
  
  /**
   A set of `Axis` containing only `.horizontal`.
   */
  public static let Horizontal: Axis.Set = [.horizontal]
  
  /**
   A set of `Axis` containing only `.vertical`.
   */
  public static let Vertical: Axis.Set = [.vertical]
  
  /**
   A set of `Axis` containing both the `.horizontal` and `.vertical` values.
   */
  public static let All: Axis.Set = [.horizontal, .vertical]
}
