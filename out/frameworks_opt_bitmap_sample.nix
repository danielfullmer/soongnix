{ android_app }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

bitmapcache-sample = android_app {
    name = "bitmapcache-sample";
    static_libs = ["android-opt-bitmap"];
    sdk_version = "18";
    srcs = [
        "src/com/example/bitmapsample/BitmapRequestKeyImpl.java"
        "src/com/example/bitmapsample/BitmapView.java"
        "src/com/example/bitmapsample/MainActivity.java"

    ];
    resource_dirs = ["res"];

    optimize = {
        proguard_flags_files = ["proguard-config.pro"];
    };

};

in { inherit bitmapcache-sample; }
