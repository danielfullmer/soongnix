{ android_app }:
let

LegacyCamera = android_app {
    name = "LegacyCamera";

    srcs = [
        "src/com/android/camera/ActivityBase.java"
        "src/com/android/camera/Camera.java"
        "src/com/android/camera/CameraAppImpl.java"
        "src/com/android/camera/CameraButtonIntentReceiver.java"
        "src/com/android/camera/CameraDisabledException.java"
        "src/com/android/camera/CameraErrorCallback.java"
        "src/com/android/camera/CameraHardwareException.java"
        "src/com/android/camera/CameraHolder.java"
        "src/com/android/camera/CameraPreference.java"
        "src/com/android/camera/CameraSettings.java"
        "src/com/android/camera/ComboPreferences.java"
        "src/com/android/camera/EffectsRecorder.java"
        "src/com/android/camera/Exif.java"
        "src/com/android/camera/FocusManager.java"
        "src/com/android/camera/IconListPreference.java"
        "src/com/android/camera/IntArray.java"
        "src/com/android/camera/ListPreference.java"
        "src/com/android/camera/LocationManager.java"
        "src/com/android/camera/MenuHelper.java"
        "src/com/android/camera/ModePicker.java"
        "src/com/android/camera/OnClickAttr.java"
        "src/com/android/camera/OnScreenHint.java"
        "src/com/android/camera/PreferenceGroup.java"
        "src/com/android/camera/PreferenceInflater.java"
        "src/com/android/camera/PreviewFrameLayout.java"
        "src/com/android/camera/RecordLocationPreference.java"
        "src/com/android/camera/RotateDialogController.java"
        "src/com/android/camera/ShutterButton.java"
        "src/com/android/camera/Storage.java"
        "src/com/android/camera/Thumbnail.java"
        "src/com/android/camera/Util.java"
        "src/com/android/camera/VideoCamera.java"
        "src/com/android/camera/panorama/Mosaic.java"
        "src/com/android/camera/panorama/MosaicFrameProcessor.java"
        "src/com/android/camera/panorama/MosaicRenderer.java"
        "src/com/android/camera/panorama/MosaicRendererSurfaceView.java"
        "src/com/android/camera/panorama/MosaicRendererSurfaceViewRenderer.java"
        "src/com/android/camera/panorama/PanoProgressBar.java"
        "src/com/android/camera/panorama/PanoUtil.java"
        "src/com/android/camera/panorama/PanoramaActivity.java"
        "src/com/android/camera/ui/AbstractIndicatorButton.java"
        "src/com/android/camera/ui/AbstractSettingPopup.java"
        "src/com/android/camera/ui/BasicSettingPopup.java"
        "src/com/android/camera/ui/CameraPicker.java"
        "src/com/android/camera/ui/ControlPanelLayout.java"
        "src/com/android/camera/ui/EffectSettingPopup.java"
        "src/com/android/camera/ui/ExpandedGridView.java"
        "src/com/android/camera/ui/FaceView.java"
        "src/com/android/camera/ui/FocusIndicator.java"
        "src/com/android/camera/ui/FocusIndicatorView.java"
        "src/com/android/camera/ui/InLineSettingItem.java"
        "src/com/android/camera/ui/InLineSettingKnob.java"
        "src/com/android/camera/ui/InLineSettingRestore.java"
        "src/com/android/camera/ui/InLineSettingSwitch.java"
        "src/com/android/camera/ui/IndicatorButton.java"
        "src/com/android/camera/ui/IndicatorControl.java"
        "src/com/android/camera/ui/IndicatorControlBar.java"
        "src/com/android/camera/ui/IndicatorControlBarContainer.java"
        "src/com/android/camera/ui/IndicatorControlContainer.java"
        "src/com/android/camera/ui/IndicatorControlWheel.java"
        "src/com/android/camera/ui/IndicatorControlWheelContainer.java"
        "src/com/android/camera/ui/OnIndicatorEventListener.java"
        "src/com/android/camera/ui/OneRowGridView.java"
        "src/com/android/camera/ui/OtherSettingIndicatorButton.java"
        "src/com/android/camera/ui/OtherSettingsPopup.java"
        "src/com/android/camera/ui/PopupManager.java"
        "src/com/android/camera/ui/RightAlignedHorizontalScrollView.java"
        "src/com/android/camera/ui/Rotatable.java"
        "src/com/android/camera/ui/RotateImageView.java"
        "src/com/android/camera/ui/RotateLayout.java"
        "src/com/android/camera/ui/RotateTextToast.java"
        "src/com/android/camera/ui/SecondLevelIndicatorControlBar.java"
        "src/com/android/camera/ui/SharePopup.java"
        "src/com/android/camera/ui/StackLayout.java"
        "src/com/android/camera/ui/TwoStateImageView.java"
        "src/com/android/camera/ui/ZoomControl.java"
        "src/com/android/camera/ui/ZoomControlBar.java"
        "src/com/android/camera/ui/ZoomControlWheel.java"
    ];

    # sdk_version: "current",

    platform_apis = true;

    jni_libs = ["libjni_legacymosaic"];

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

};

in { inherit LegacyCamera; }
