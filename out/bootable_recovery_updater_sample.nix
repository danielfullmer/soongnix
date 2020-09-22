{ android_app }:
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

SystemUpdaterSample = android_app {
    name = "SystemUpdaterSample";
    sdk_version = "system_current";

    srcs = [
        "src/com/example/android/systemupdatersample/PayloadSpec.java"
        "src/com/example/android/systemupdatersample/UpdateConfig.java"
        "src/com/example/android/systemupdatersample/UpdateManager.java"
        "src/com/example/android/systemupdatersample/UpdaterState.java"
        "src/com/example/android/systemupdatersample/services/PrepareUpdateService.java"
        "src/com/example/android/systemupdatersample/ui/MainActivity.java"
        "src/com/example/android/systemupdatersample/util/FileDownloader.java"
        "src/com/example/android/systemupdatersample/util/PackageFiles.java"
        "src/com/example/android/systemupdatersample/util/PayloadSpecs.java"
        "src/com/example/android/systemupdatersample/util/UpdateConfigs.java"
        "src/com/example/android/systemupdatersample/util/UpdateEngineErrorCodes.java"
        "src/com/example/android/systemupdatersample/util/UpdateEngineProperties.java"
        "src/com/example/android/systemupdatersample/util/UpdateEngineStatuses.java"
    ];

    static_libs = [
        "guava"
    ];

    optimize = {
        proguard_flags_files = [
            "proguard.flags"
        ];
    };

    resource_dirs = ["res"];
};

in { inherit SystemUpdaterSample; }
