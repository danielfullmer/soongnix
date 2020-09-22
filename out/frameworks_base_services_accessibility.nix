{ filegroup, java_library_static }:
let

"services.accessibility-sources" = filegroup {
    name = "services.accessibility-sources";
    srcs = [
        "java/com/android/server/accessibility/AbstractAccessibilityServiceConnection.java"
        "java/com/android/server/accessibility/AccessibilityInputFilter.java"
        "java/com/android/server/accessibility/AccessibilityManagerService.java"
        "java/com/android/server/accessibility/AccessibilitySecurityPolicy.java"
        "java/com/android/server/accessibility/AccessibilityServiceConnection.java"
        "java/com/android/server/accessibility/AccessibilityShellCommand.java"
        "java/com/android/server/accessibility/AccessibilityUserState.java"
        "java/com/android/server/accessibility/AccessibilityWindowManager.java"
        "java/com/android/server/accessibility/ActionReplacingCallback.java"
        "java/com/android/server/accessibility/AutoclickController.java"
        "java/com/android/server/accessibility/BaseEventStreamTransformation.java"
        "java/com/android/server/accessibility/EventStreamTransformation.java"
        "java/com/android/server/accessibility/FingerprintGestureDispatcher.java"
        "java/com/android/server/accessibility/FullScreenMagnificationGestureHandler.java"
        "java/com/android/server/accessibility/KeyEventDispatcher.java"
        "java/com/android/server/accessibility/KeyboardInterceptor.java"
        "java/com/android/server/accessibility/MagnificationController.java"
        "java/com/android/server/accessibility/MotionEventInjector.java"
        "java/com/android/server/accessibility/SystemActionPerformer.java"
        "java/com/android/server/accessibility/UiAutomationManager.java"
        "java/com/android/server/accessibility/gestures/EventDispatcher.java"
        "java/com/android/server/accessibility/gestures/GestureManifold.java"
        "java/com/android/server/accessibility/gestures/GestureMatcher.java"
        "java/com/android/server/accessibility/gestures/GestureUtils.java"
        "java/com/android/server/accessibility/gestures/MultiFingerMultiTap.java"
        "java/com/android/server/accessibility/gestures/MultiFingerMultiTapAndHold.java"
        "java/com/android/server/accessibility/gestures/MultiFingerSwipe.java"
        "java/com/android/server/accessibility/gestures/MultiTap.java"
        "java/com/android/server/accessibility/gestures/MultiTapAndHold.java"
        "java/com/android/server/accessibility/gestures/SecondFingerMultiTap.java"
        "java/com/android/server/accessibility/gestures/Swipe.java"
        "java/com/android/server/accessibility/gestures/TouchExplorer.java"
        "java/com/android/server/accessibility/gestures/TouchState.java"
        "java/com/android/server/accessibility/magnification/MagnificationGestureHandler.java"
        "java/com/android/server/accessibility/magnification/WindowMagnificationConnectionWrapper.java"
        "java/com/android/server/accessibility/magnification/WindowMagnificationManager.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.accessibility" = java_library_static {
    name = "services.accessibility";
    defaults = ["services_defaults"];
    srcs = [":services.accessibility-sources"];
    libs = ["services.core"];
};

in { inherit "services.accessibility" "services.accessibility-sources"; }
