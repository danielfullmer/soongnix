{ java_library_host }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

layoutlib-validator = java_library_host {
    name = "layoutlib-validator";

    srcs = [
        "src/ResourceConverter.java"
        "src/com/android/tools/idea/validator/LayoutValidator.java"
        "src/com/android/tools/idea/validator/ValidatorData.java"
        "src/com/android/tools/idea/validator/ValidatorResult.java"
        "src/com/android/tools/idea/validator/accessibility/AccessibilityValidator.java"
        "src/com/android/tools/idea/validator/accessibility/AtfBufferedImage.java"
    ];
    java_resource_dirs = ["resources"];

    libs = [
        "tools-common-prebuilt"
        "temp_layoutlib"
        "layoutlib-common"
        "guava"
    ];

    static_libs = [
        "hamcrest"
        "jsoup-1.6.3"
        "protobuf-lite"
    ];
};

in { inherit layoutlib-validator; }