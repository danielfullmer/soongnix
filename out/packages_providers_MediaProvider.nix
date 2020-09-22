{ android_app, filegroup, genrule, platform_compat_config }:
let

MediaProvider = android_app {
    name = "MediaProvider";
    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "guava"
    ];

    libs = [
        "unsupportedappusage"
        "app-compat-annotations"
        "framework-mediaprovider.impl"
        "framework_mediaprovider_annotation"
        "framework-statsd"
    ];

    jni_libs = [
        "libfuse_jni"
        "libfuse"
    ];

    resource_dirs = [
        "res"
    ];
    srcs = [
        ":mediaprovider-sources"
    ];

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    plugins = [
        "java_api_finder"
        "error_prone_mediaprovider"
    ];

    sdk_version = "module_current";

    certificate = "media";
    privileged = true;

    aaptflags = ["--custom-package com.android.providers.media"];

    errorprone = {
        javacflags = [
            "-Xep:FallThrough:ERROR"
            "-Xep:GuardedBy:ERROR"
            "-Xep:StreamResourceLeak:ERROR"

            #  Local checkers specific to this module
            "-Xep:MediaProviderLocaleRoot:ERROR"
            "-Xep:MediaProviderMimeType:ERROR"
        ];
    };
};

#  Used by MediaProvider and MediaProviderTests
mediaprovider-sources = filegroup {
    name = "mediaprovider-sources";
    srcs = [

        "src/com/android/providers/media/CacheClearingActivity.java"
        "src/com/android/providers/media/DatabaseHelper.java"
        "src/com/android/providers/media/IdleService.java"
        "src/com/android/providers/media/LocalCallingIdentity.java"
        "src/com/android/providers/media/MediaApplication.java"
        "src/com/android/providers/media/MediaDocumentsProvider.java"
        "src/com/android/providers/media/MediaProvider.java"
        "src/com/android/providers/media/MediaReceiver.java"
        "src/com/android/providers/media/MediaService.java"
        "src/com/android/providers/media/MediaUpgradeReceiver.java"
        "src/com/android/providers/media/PermissionActivity.java"
        "src/com/android/providers/media/fuse/ExternalStorageServiceImpl.java"
        "src/com/android/providers/media/fuse/FuseDaemon.java"
        "src/com/android/providers/media/playlist/M3uPlaylistPersister.java"
        "src/com/android/providers/media/playlist/Playlist.java"
        "src/com/android/providers/media/playlist/PlaylistPersister.java"
        "src/com/android/providers/media/playlist/PlsPlaylistPersister.java"
        "src/com/android/providers/media/playlist/WplPlaylistPersister.java"
        "src/com/android/providers/media/playlist/XspfPlaylistPersister.java"
        "src/com/android/providers/media/scan/LegacyMediaScanner.java"
        "src/com/android/providers/media/scan/MediaScanner.java"
        "src/com/android/providers/media/scan/ModernMediaScanner.java"
        "src/com/android/providers/media/scan/NullMediaScanner.java"
        "src/com/android/providers/media/util/BackgroundThread.java"
        "src/com/android/providers/media/util/CachedSupplier.java"
        "src/com/android/providers/media/util/DatabaseUtils.java"
        "src/com/android/providers/media/util/ExifUtils.java"
        "src/com/android/providers/media/util/FileUtils.java"
        "src/com/android/providers/media/util/ForegroundThread.java"
        "src/com/android/providers/media/util/HandlerExecutor.java"
        "src/com/android/providers/media/util/IsoInterface.java"
        "src/com/android/providers/media/util/Logging.java"
        "src/com/android/providers/media/util/LongArray.java"
        "src/com/android/providers/media/util/Memory.java"
        "src/com/android/providers/media/util/Metrics.java"
        "src/com/android/providers/media/util/MimeUtils.java"
        "src/com/android/providers/media/util/PermissionUtils.java"
        "src/com/android/providers/media/util/RedactingFileDescriptor.java"
        "src/com/android/providers/media/util/SQLiteQueryBuilder.java"
        "src/com/android/providers/media/util/SQLiteTokenizer.java"
        "src/com/android/providers/media/util/XmpInterface.java"
        ":mediaprovider-database-sources"
        ":statslog-mediaprovider-java-gen"
    ];
};

#  This is defined to give LegacyMediaProvider the bare minimum it needs
#  to keep the legacy database schema working while also building
#  against "system_current"
mediaprovider-database-sources = filegroup {
    name = "mediaprovider-database-sources";
    srcs = [
        "src/com/android/providers/media/DatabaseHelper.java"
        "src/com/android/providers/media/util/BackgroundThread.java"
        "src/com/android/providers/media/util/DatabaseUtils.java"
        "src/com/android/providers/media/util/FileUtils.java"
        "src/com/android/providers/media/util/ForegroundThread.java"
        "src/com/android/providers/media/util/HandlerExecutor.java"
        "src/com/android/providers/media/util/Logging.java"
        "src/com/android/providers/media/util/MimeUtils.java"
    ];
};

media-provider-platform-compat-config = platform_compat_config {
    name = "media-provider-platform-compat-config";
    src = ":MediaProvider";
};

statslog-mediaprovider-java-gen = genrule {
    name = "statslog-mediaprovider-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module mediaprovider --javaPackage com.android.providers.media --javaClass MediaProviderStatsLog";
    out = ["com/android/providers/media/MediaProviderStatsLog.java"];
};

in { inherit MediaProvider media-provider-platform-compat-config mediaprovider-database-sources mediaprovider-sources statslog-mediaprovider-java-gen; }
