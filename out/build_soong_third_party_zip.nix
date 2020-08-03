{ bootstrap_go_package }:
let

#  Copyright 2016 Google Inc. All rights reserved.
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

android-archive-zip = bootstrap_go_package {
    name = "android-archive-zip";
    pkgPath = "android/soong/third_party/zip";
    srcs = [
        "reader.go"
        "register.go"
        "struct.go"
        "writer.go"

        "android.go"
    ];
    testSrcs = [
        "android_test.go"
        "reader_test.go"
        "writer_test.go"
        "zip_test.go"
    ];
};

in { inherit android-archive-zip; }
