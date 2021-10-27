import SwiftUI

extension View {
  /**
   Adds a modifier for this view that fires an action when the `ScenePhase` has changed.
   
   `action` is called on the main thread. Avoid performing long-running tasks on the main thread.
   */
  public func onScenePhaseChanged(_ action: @escaping (ScenePhase) -> Void) -> some View {
    modifier(ScenePhaseModifier(onChanged: action))
  }
}

/**
 A modifier that monitors the `ScenePhase` of the current scene and reports changes to the provided callback.
 */
private struct ScenePhaseModifier : ViewModifier {
  /**
   The current `ScenePhase` of the application scene.
   */
  @Environment(\.scenePhase) private var scenePhase: ScenePhase
  
  /**
   Callback to trigger whenever the `ScenePhase` has changed.
   */
  let onChanged: (ScenePhase) -> Void
  
  /**
   Attaches an `.onChange` modifier to the modified view that monitors changes in `ScenePhase`.
   */
  func body(content: Content) -> some View {
    content.onChange(of: scenePhase, perform: onChanged)
  }
}
