{ java_library_static }:
let

"services.accessibility" = java_library_static {
    name = "services.accessibility";
    srcs = [
        "java/com/android/server/accessibility/AbstractAccessibilityServiceConnection.java"
        "java/com/android/server/accessibility/AccessibilityGestureDetector.java"
        "java/com/android/server/accessibility/AccessibilityInputFilter.java"
        "java/com/android/server/accessibility/AccessibilityManagerService.java"
        "java/com/android/server/accessibility/AccessibilityServiceConnection.java"
        "java/com/android/server/accessibility/AccessibilityShellCommand.java"
        "java/com/android/server/accessibility/ActionReplacingCallback.java"
        "java/com/android/server/accessibility/AutoclickController.java"
        "java/com/android/server/accessibility/BaseEventStreamTransformation.java"
        "java/com/android/server/accessibility/EventStreamTransformation.java"
        "java/com/android/server/accessibility/FingerprintGestureDispatcher.java"
        "java/com/android/server/accessibility/GestureUtils.java"
        "java/com/android/server/accessibility/GlobalActionPerformer.java"
        "java/com/android/server/accessibility/KeyEventDispatcher.java"
        "java/com/android/server/accessibility/KeyboardInterceptor.java"
        "java/com/android/server/accessibility/MagnificationController.java"
        "java/com/android/server/accessibility/MagnificationGestureHandler.java"
        "java/com/android/server/accessibility/MotionEventInjector.java"
        "java/com/android/server/accessibility/TouchExplorer.java"
        "java/com/android/server/accessibility/UiAutomationManager.java"
    ];
    libs = ["services.core"];
};

in { inherit "services.accessibility"; }
