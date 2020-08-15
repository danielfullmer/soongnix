{ android_app, filegroup }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

DownloadProvider = android_app {
    name = "DownloadProvider";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/providers/downloads/Constants.java"
        "src/com/android/providers/downloads/DownloadDrmHelper.java"
        "src/com/android/providers/downloads/DownloadIdleService.java"
        "src/com/android/providers/downloads/DownloadInfo.java"
        "src/com/android/providers/downloads/DownloadJobService.java"
        "src/com/android/providers/downloads/DownloadNotifier.java"
        "src/com/android/providers/downloads/DownloadProvider.java"
        "src/com/android/providers/downloads/DownloadReceiver.java"
        "src/com/android/providers/downloads/DownloadScanner.java"
        "src/com/android/providers/downloads/DownloadStorageProvider.java"
        "src/com/android/providers/downloads/DownloadThread.java"
        "src/com/android/providers/downloads/Helpers.java"
        "src/com/android/providers/downloads/MediaScanTriggerJob.java"
        "src/com/android/providers/downloads/MediaStoreDownloadsHelper.java"
        "src/com/android/providers/downloads/OpenHelper.java"
        "src/com/android/providers/downloads/RawDocumentsHelper.java"
        "src/com/android/providers/downloads/RealSystemFacade.java"
        "src/com/android/providers/downloads/StopRequestException.java"
        "src/com/android/providers/downloads/StorageUtils.java"
        "src/com/android/providers/downloads/SystemFacade.java"
    ];

    resource_dirs = [
        "res"
    ];

    platform_apis = true;

    certificate = "media";

    privileged = true;

    static_libs = ["guava"];

    jacoco = {
        include_filter = ["com.android.providers.downloads.*"];
    };
};

download_provider-files = filegroup {
    name = "download_provider-files";

    srcs = [
        "src/com/android/providers/downloads/Constants.java"
        "src/com/android/providers/downloads/DownloadDrmHelper.java"
        "src/com/android/providers/downloads/OpenHelper.java"
        "src/com/android/providers/downloads/RawDocumentsHelper.java"
        "src/com/android/providers/downloads/MediaStoreDownloadsHelper.java"
    ];
};

in { inherit DownloadProvider download_provider-files; }
