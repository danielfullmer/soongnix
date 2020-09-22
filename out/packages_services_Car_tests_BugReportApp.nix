{ android_app }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

BugReportApp = android_app {
    name = "BugReportApp";

    srcs = [
        "src/com/android/car/bugreport/BugInfoAdapter.java"
        "src/com/android/car/bugreport/BugReportActivity.java"
        "src/com/android/car/bugreport/BugReportInfoActivity.java"
        "src/com/android/car/bugreport/BugReportService.java"
        "src/com/android/car/bugreport/BugStorageProvider.java"
        "src/com/android/car/bugreport/BugStorageUtils.java"
        "src/com/android/car/bugreport/Config.java"
        "src/com/android/car/bugreport/FileUtils.java"
        "src/com/android/car/bugreport/JobSchedulingUtils.java"
        "src/com/android/car/bugreport/MetaBugReport.java"
        "src/com/android/car/bugreport/PackageUtils.java"
        "src/com/android/car/bugreport/SimpleUploaderAsyncTask.java"
        "src/com/android/car/bugreport/StartUpBootReceiver.java"
        "src/com/android/car/bugreport/Status.java"
        "src/com/android/car/bugreport/UploadJob.java"
        "src/com/android/car/bugreport/VoiceRecordingView.java"
        "src/com/android/car/bugreport/ZipUtils.java"
    ];

    resource_dirs = ["res"];

    platform_apis = true;

    aaptflags = ["--auto-add-overlay"];

    optimize = {
        enabled = false;
    };

    certificate = "platform";

    privileged = true;

    dex_preopt = {
        enabled = false;
    };

    libs = [
        "android.car"
    ];

    static_libs = [
        "androidx.recyclerview_recyclerview"
        "car-br-auto-value-jar"
        "car-br-google-api-client-android-jar"
        "car-br-google-api-java-client-jar"
        "car-br-google-http-client-android-jar"
        "car-br-google-http-client-jackson2-jar"
        "car-br-google-http-client-jar"
        "car-br-google-oauth-client-jar"
        "car-br-google-storage-services-jar"
        "car-br-jackson-core-jar"
        "car-br-grpc-context-jar"
        "car-br-opencensus-api-jar"
        "car-br-opencensus-contrib-http-util-jar"
        "guava"
        "jsr305"
    ];

    required = ["privapp_whitelist_com.android.car.bugreport"];

    #  Explicitly define annotation processors even if javac can find them from static_libs.
    plugins = ["car-br-auto-value"];
};

in { inherit BugReportApp; }