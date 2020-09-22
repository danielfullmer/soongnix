{ java_library_host }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

compatibility-host-util-axt = java_library_host {
    #  The -axt suffix stands for "Android eXTension".
    name = "compatibility-host-util-axt";
    defaults = ["cts_error_prone_rules"];

    srcs = [
        "src/com/android/compatibility/common/util/LocationModeSetter.java"
        "src/com/android/compatibility/common/util/WindowManagerUtil.java"
    ];

    static_libs = [
    ];

    libs = [
        "tradefed"
    ];
};

in { inherit compatibility-host-util-axt; }