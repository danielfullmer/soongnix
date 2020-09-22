{ android_test }:
let

# ########################################################################
#  Build WmTests package
# ########################################################################

WmTests = android_test {
    name = "WmTests";

    #  We only want this apk build for tests.

    #  Include all test java files.
    srcs = [
        "src/com/android/server/policy/PhoneWindowManagerTests.java"
        "src/com/android/server/wm/ActivityDisplayTests.java"
        "src/com/android/server/wm/ActivityLeakTests.java"
        "src/com/android/server/wm/ActivityMetricsLaunchObserverTests.java"
        "src/com/android/server/wm/ActivityOptionsTest.java"
        "src/com/android/server/wm/ActivityRecordTests.java"
        "src/com/android/server/wm/ActivityStackSupervisorTests.java"
        "src/com/android/server/wm/ActivityStackTests.java"
        "src/com/android/server/wm/ActivityStartControllerTests.java"
        "src/com/android/server/wm/ActivityStartInterceptorTest.java"
        "src/com/android/server/wm/ActivityStarterTests.java"
        "src/com/android/server/wm/ActivityTaskManagerServiceTests.java"
        "src/com/android/server/wm/ActivityTestsBase.java"
        "src/com/android/server/wm/AnimatingActivityRegistryTest.java"
        "src/com/android/server/wm/AppChangeTransitionTests.java"
        "src/com/android/server/wm/AppTransitionControllerTest.java"
        "src/com/android/server/wm/AppTransitionTests.java"
        "src/com/android/server/wm/AppWindowTokenAnimationTests.java"
        "src/com/android/server/wm/AppWindowTokenTests.java"
        "src/com/android/server/wm/AssistDataRequesterTest.java"
        "src/com/android/server/wm/ClientLifecycleManagerTests.java"
        "src/com/android/server/wm/ConfigurationContainerTests.java"
        "src/com/android/server/wm/DimmerTests.java"
        "src/com/android/server/wm/DisplayAreaOrganizerTest.java"
        "src/com/android/server/wm/DisplayAreaPolicyBuilderTest.java"
        "src/com/android/server/wm/DisplayAreaProviderTest.java"
        "src/com/android/server/wm/DisplayAreaTest.java"
        "src/com/android/server/wm/DisplayContentTests.java"
        "src/com/android/server/wm/DisplayPolicyInsetsTests.java"
        "src/com/android/server/wm/DisplayPolicyLayoutTests.java"
        "src/com/android/server/wm/DisplayPolicyTests.java"
        "src/com/android/server/wm/DisplayPolicyTestsBase.java"
        "src/com/android/server/wm/DisplayRotationTests.java"
        "src/com/android/server/wm/DisplayWindowSettingsTests.java"
        "src/com/android/server/wm/DragDropControllerTests.java"
        "src/com/android/server/wm/FrameRateSelectionPriorityTests.java"
        "src/com/android/server/wm/HighRefreshRateBlacklistTest.java"
        "src/com/android/server/wm/ImeInsetsSourceProviderTest.java"
        "src/com/android/server/wm/InsetsPolicyTest.java"
        "src/com/android/server/wm/InsetsSourceProviderTest.java"
        "src/com/android/server/wm/InsetsStateControllerTest.java"
        "src/com/android/server/wm/KeyguardDisableHandlerTest.java"
        "src/com/android/server/wm/LaunchParamsControllerTests.java"
        "src/com/android/server/wm/LaunchParamsPersisterTests.java"
        "src/com/android/server/wm/LetterboxTest.java"
        "src/com/android/server/wm/LockTaskControllerTest.java"
        "src/com/android/server/wm/MockSurfaceControlBuilder.java"
        "src/com/android/server/wm/PendingRemoteAnimationRegistryTest.java"
        "src/com/android/server/wm/PersisterQueueTests.java"
        "src/com/android/server/wm/ProtoLogIntegrationTest.java"
        "src/com/android/server/wm/RecentTasksTest.java"
        "src/com/android/server/wm/RecentsAnimationControllerTest.java"
        "src/com/android/server/wm/RecentsAnimationTest.java"
        "src/com/android/server/wm/RefreshRatePolicyTest.java"
        "src/com/android/server/wm/RemoteAnimationControllerTest.java"
        "src/com/android/server/wm/RootActivityContainerTests.java"
        "src/com/android/server/wm/RootWindowContainerTests.java"
        "src/com/android/server/wm/RunningTasksTest.java"
        "src/com/android/server/wm/SafeActivityOptionsTest.java"
        "src/com/android/server/wm/ScreenDecorWindowTests.java"
        "src/com/android/server/wm/SizeCompatTests.java"
        "src/com/android/server/wm/StubTransaction.java"
        "src/com/android/server/wm/SurfaceAnimationRunnerTest.java"
        "src/com/android/server/wm/SurfaceAnimatorTest.java"
        "src/com/android/server/wm/SystemServiceTestsBase.java"
        "src/com/android/server/wm/SystemServicesTestRule.java"
        "src/com/android/server/wm/SystemServicesTestRuleTest.java"
        "src/com/android/server/wm/TaskDisplayAreaTests.java"
        "src/com/android/server/wm/TaskLaunchParamsModifierTests.java"
        "src/com/android/server/wm/TaskPersisterTest.java"
        "src/com/android/server/wm/TaskPositionerTests.java"
        "src/com/android/server/wm/TaskPositioningControllerTests.java"
        "src/com/android/server/wm/TaskRecordTests.java"
        "src/com/android/server/wm/TaskSnapshotCacheTest.java"
        "src/com/android/server/wm/TaskSnapshotControllerTest.java"
        "src/com/android/server/wm/TaskSnapshotLowResDisabledTest.java"
        "src/com/android/server/wm/TaskSnapshotPersisterLoaderTest.java"
        "src/com/android/server/wm/TaskSnapshotPersisterTestBase.java"
        "src/com/android/server/wm/TaskSnapshotSurfaceTest.java"
        "src/com/android/server/wm/TaskStackChangedListenerTest.java"
        "src/com/android/server/wm/TaskStackTests.java"
        "src/com/android/server/wm/TaskTests.java"
        "src/com/android/server/wm/TestDisplayContent.java"
        "src/com/android/server/wm/TestIWindow.java"
        "src/com/android/server/wm/TestWindowManagerPolicy.java"
        "src/com/android/server/wm/UnknownAppVisibilityControllerTest.java"
        "src/com/android/server/wm/WallpaperControllerTests.java"
        "src/com/android/server/wm/WindowAnimationSpecTest.java"
        "src/com/android/server/wm/WindowConfigurationTests.java"
        "src/com/android/server/wm/WindowContainerTests.java"
        "src/com/android/server/wm/WindowContainerThumbnailTest.java"
        "src/com/android/server/wm/WindowContainerTraversalTests.java"
        "src/com/android/server/wm/WindowFrameTests.java"
        "src/com/android/server/wm/WindowManagerConstantsTest.java"
        "src/com/android/server/wm/WindowManagerGlobalLockRule.java"
        "src/com/android/server/wm/WindowManagerServiceTests.java"
        "src/com/android/server/wm/WindowManagerSettingsTests.java"
        "src/com/android/server/wm/WindowOrganizerTests.java"
        "src/com/android/server/wm/WindowProcessControllerMapTests.java"
        "src/com/android/server/wm/WindowProcessControllerTests.java"
        "src/com/android/server/wm/WindowStateTests.java"
        "src/com/android/server/wm/WindowTestRunner.java"
        "src/com/android/server/wm/WindowTestUtils.java"
        "src/com/android/server/wm/WindowTestsBase.java"
        "src/com/android/server/wm/WindowTokenTests.java"
        "src/com/android/server/wm/WindowTracingTest.java"
        "src/com/android/server/wm/ZOrderingTests.java"
        "src/com/android/server/wm/testing/Assert.java"
        "src/com/android/server/wm/testing/AssertTest.java"
        "src/com/android/server/wm/utils/CoordinateTransformsTest.java"
        "src/com/android/server/wm/utils/DisplayRotationUtilTest.java"
        "src/com/android/server/wm/utils/FakeDeviceConfigInterface.java"
        "src/com/android/server/wm/utils/InsetUtilsTest.java"
        "src/com/android/server/wm/utils/MockTracker.java"
        "src/com/android/server/wm/utils/RotationAnimationUtilsTest.java"
        "src/com/android/server/wm/utils/RotationCacheTest.java"
        "src/com/android/server/wm/utils/WmDisplayCutoutTest.java"
    ];

    static_libs = [
        "frameworks-base-testutils"
        "services.core"
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-extended-minus-junit4"
        "platform-test-annotations"
        "servicestests-utils"
        "testng"
        "truth-prebuilt"
        "testables"
        "ub-uiautomator"
        "hamcrest-library"
        "compatibility-device-util-axt"
    ];

    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";

    dxflags = ["--multi-dex"];

    optimize = {
        enabled = false;
    };

};

in { inherit WmTests; }
