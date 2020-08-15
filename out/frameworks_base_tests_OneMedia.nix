{ android_app }:
let

OneMedia = android_app {
    name = "OneMedia";
    srcs = [
        "src/com/android/onemedia/NotificationHelper.java"
        "src/com/android/onemedia/OnePlayerActivity.java"
        "src/com/android/onemedia/OnePlayerService.java"
        "src/com/android/onemedia/PlayerController.java"
        "src/com/android/onemedia/PlayerService.java"
        "src/com/android/onemedia/PlayerSession.java"
        "src/com/android/onemedia/playback/LocalRenderer.java"
        "src/com/android/onemedia/playback/MediaItem.java"
        "src/com/android/onemedia/playback/PlaybackError.java"
        "src/com/android/onemedia/playback/Renderer.java"
        "src/com/android/onemedia/playback/RequestUtils.java"
        "src/com/android/onemedia/IPlayerCallback.aidl"
        "src/com/android/onemedia/IPlayerService.aidl"
        "src/com/android/onemedia/playback/IRequestCallback.aidl"
    ];
    platform_apis = true;
    certificate = "platform";
    libs = ["org.apache.http.legacy"];
    optimize = {
        enabled = false;
    };
};

in { inherit OneMedia; }
