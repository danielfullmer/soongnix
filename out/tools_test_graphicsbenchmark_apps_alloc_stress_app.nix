{ android_test_helper_app, cc_test_library }:
let

#  Copyright 2018, The Android Open Source Project
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

libstress = cc_test_library {
    name = "libstress";
    sdk_version = "26"; #  Oreo
    cppflags = ["-std=c++11"];
    srcs = ["src/cpp/alloc_stress_activity.cpp"];
    shared_libs = ["liblog"];
    stl = "c++_static";
};

GameQualificationAllocstress = android_test_helper_app {
    name = "GameQualificationAllocstress";
    sdk_version = "26"; #  Oreo
    jni_libs = ["libstress"];
    test_suites = ["device-tests"];
    srcs = ["src/java/com/android/game/qualification/allocstress/MainActivity.java"];
};

in { inherit GameQualificationAllocstress libstress; }
