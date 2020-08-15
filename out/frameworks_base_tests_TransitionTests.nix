{ android_app }:
let

TransitionTests = android_app {
    name = "TransitionTests";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/transitiontests/ChangingText.java"
        "src/com/android/transitiontests/ClippingText.java"
        "src/com/android/transitiontests/ContactsExpansion.java"
        "src/com/android/transitiontests/CrossFadeDemo.java"
        "src/com/android/transitiontests/CrossfadeImage.java"
        "src/com/android/transitiontests/CrossfadeMultiple.java"
        "src/com/android/transitiontests/DelayedTransition.java"
        "src/com/android/transitiontests/Demo0.java"
        "src/com/android/transitiontests/Demo1.java"
        "src/com/android/transitiontests/Demo2.java"
        "src/com/android/transitiontests/Demo3.java"
        "src/com/android/transitiontests/Demo4.java"
        "src/com/android/transitiontests/Demo5.java"
        "src/com/android/transitiontests/FadingHierarchy.java"
        "src/com/android/transitiontests/FadingTest.java"
        "src/com/android/transitiontests/HierarchicalMove.java"
        "src/com/android/transitiontests/HitRectBug.java"
        "src/com/android/transitiontests/InstanceTargets.java"
        "src/com/android/transitiontests/InterruptionTest.java"
        "src/com/android/transitiontests/ListViewAddRemove.java"
        "src/com/android/transitiontests/ListViewAddRemoveNoTransition.java"
        "src/com/android/transitiontests/LoginActivity.java"
        "src/com/android/transitiontests/LoginActivityFromResources.java"
        "src/com/android/transitiontests/OverlayTest.java"
        "src/com/android/transitiontests/Reparenting.java"
        "src/com/android/transitiontests/ResourceLoadingTest.java"
        "src/com/android/transitiontests/ScenesTestAutoTargets.java"
        "src/com/android/transitiontests/ScenesTestAutoTransition.java"
        "src/com/android/transitiontests/ScenesTestAutoTransition2.java"
        "src/com/android/transitiontests/ScenesTestv21.java"
        "src/com/android/transitiontests/SequenceTest.java"
        "src/com/android/transitiontests/SequenceTestSimple.java"
        "src/com/android/transitiontests/SurfaceAndTextureViews.java"
        "src/com/android/transitiontests/UniqueIds.java"
    ];
    platform_apis = true;
    static_libs = ["android-common"];
    optimize = {
        enabled = false;
    };
};

in { inherit TransitionTests; }
