{ android_app, android_library, filegroup, genrule, java_defaults, java_library }:
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

documentsui_defaults = java_defaults {
    name = "documentsui_defaults";

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-v13"
        "androidx.legacy_legacy-support-v4"
        "androidx.recyclerview_recyclerview"
        "androidx.recyclerview_recyclerview-selection"
        "androidx.transition_transition"
        "apache-commons-compress"
        "com.google.android.material_material"
        "guava"
    ];

    privileged = true;

    certificate = "platform";

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    sdk_version = "system_current";
    min_sdk_version = "28";
    target_sdk_version = "28";

    plugins = ["java_api_finder"];
};

DocumentsUI-srcs = filegroup {
    name = "DocumentsUI-srcs";
    srcs = [
        "src/**/*.java"
        ":statslog-docsui-java-gen"
    ];
};

docsui-statsd = java_library {
    name = "docsui-statsd";
    srcs = [
        ":statslog-docsui-java-gen"
    ];
};

statslog-docsui-java-gen = genrule {
    name = "statslog-docsui-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module docsui --javaPackage com.android.documentsui --javaClass DocumentsStatsLog";
    out = ["com/android/documentsui/DocumentsStatsLog.java"];
};

DocumentsUI-res-lib = android_library {
    name = "DocumentsUI-res-lib";

    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
        "com.google.android.material_material"
    ];

    resource_dirs = [
        "res"
    ];

    aaptflags = [
        "--auto-add-overlay"
    ];

    min_sdk_version = "28";
    target_sdk_version = "28";
};

DocumentsUI = android_app {
    name = "DocumentsUI";

    defaults = ["documentsui_defaults"];

    manifest = "AndroidManifest.xml";

    srcs = [
        ":DocumentsUI-srcs"
    ];

    resource_dirs = [
        "res"
    ];

    required = ["privapp_whitelist_com.android.documentsui"];
};

in { inherit DocumentsUI DocumentsUI-res-lib DocumentsUI-srcs docsui-statsd documentsui_defaults statslog-docsui-java-gen; }
