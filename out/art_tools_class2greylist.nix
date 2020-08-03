{ java_binary_host, java_library_host }:
let

#
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
#

class2greylistlib = java_library_host {
    name = "class2greylistlib";
    srcs = ["src/**/*.java"];
    static_libs = [
        "commons-cli-1.2"
        "apache-bcel"
        "guava"
    ];
};

class2greylist = java_binary_host {
    name = "class2greylist";
    manifest = "src/class2greylist.mf";
    static_libs = [
        "class2greylistlib"
    ];
};

in { inherit class2greylist class2greylistlib; }
