import Foundation

/**
 An implementation of a momentary switch: one that has an on/off state, can be turned on repeatedly, turns off after a delay.
 
 If triggered multiple times before the off delay is elapses, it re-schedules the reaction (relative to the last time it was triggered).

 Ideally used for triggering animations on user interaction, and auto-reverting once they've stopped interacting for enough time.
 
 NOTE: The switch itself will operate on the background thread, but the on/off callbacks are executed on the `@MainActor`.
 */
public class MomentarySwitch {
  /**
   Reference to the currently scheduled task to fire the latest known "off" event.
   */
  private var scheduledOffTask: Task<Void, Never>? = nil
  
  public init() { }

  /**
   Triggers the supplied `switchOn `closure and schedules to run the supplied `switchOff` closure after a delay.
   If there's already an unfinished task (switch is on):
   - we will cancel the previous "off" task and create a new one with an updated time and `switchOff` closure.
   - the `switchOn` callback will NOT be called.
   */
  public func trigger(
    offDelaySeconds: Double = 0.0,
    switchOn: @escaping () -> Void,
    switchOff: @escaping () -> Void
  ) {
    if let scheduledOffTask = scheduledOffTask {
      // If there is a scheduled off task, cancel it.
      scheduledOffTask.cancel()
    } else {
      // Otherwise, trigger the "on" action.
      switchOn()
    }

    // Start a task to trigger the "off" action after the requested delay.
    scheduledOffTask = Task {
      // The task is kicked off right away, but we need to wait for the requested delay.
      try? await Task.sleep(nanoseconds: UInt64(offDelaySeconds * 1_000_000_000))
      
      // If the task was cancelled while we were waiting, nothing to do.
      if Task.isCancelled {
        return
      }
      
      // Otherwise, trigger the "off" action on the main actor.
      Task { @MainActor in
        switchOff()
      }
      
      // Also clear the task reference.
      scheduledOffTask = nil
    }
  }
}
