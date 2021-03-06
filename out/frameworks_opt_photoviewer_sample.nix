{ android_app }:
let

#  Copyright 2011, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# #################################################
#  Build APK

PhotoViewerSample = android_app {
    name = "PhotoViewerSample";

    libs = ["androidx.annotation_annotation"];

    static_libs = [
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.fragment_fragment"
        "libphotoviewer"
    ];

    sdk_version = "current";

    srcs = [
        "src/com/example/photoviewersample/MainActivity.java"
        "src/com/example/photoviewersample/SampleProvider.java"

    ];
    resource_dirs = ["res"];
};

# #################################################
#  Build APK
AppcompatPhotoViewerSample = android_app {
    name = "AppcompatPhotoViewerSample";

    libs = ["androidx.annotation_annotation"];

    static_libs = [
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.fragment_fragment"
        "androidx.media_media"
        "androidx.appcompat_appcompat"
        "libphotoviewer_appcompat"
    ];

    sdk_version = "current";

    srcs = [
        "src/com/example/photoviewersample/MainActivity.java"
        "src/com/example/photoviewersample/SampleProvider.java"

    ];
    resource_dirs = ["res"];

};

in { inherit AppcompatPhotoViewerSample PhotoViewerSample; }
