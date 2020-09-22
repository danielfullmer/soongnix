{ android_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

UpdateExternalLocTestApp_v2_none = android_test {
    name = "UpdateExternalLocTestApp_v2_none";
    srcs = ["src/com/android/framework/updateexternalloctestapp/UpdateExternalLocTestAppActivity.java"];
    sdk_version = "current";
};

in { inherit UpdateExternalLocTestApp_v2_none; }