{ genrule, package }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

_missingName = package {
    default_visibility = ["//visibility:private"];
};

build = [
    "JavaLibrary.bp"
    "NativeCode.bp"
];

notices-for-framework-stubs = genrule {
    name = "notices-for-framework-stubs";
    visibility = [
        "//frameworks/base"
    ];
    tool_files = [
        "NOTICE"
        "ojluni/NOTICE"
    ];
    cmd = "cp -f $(location NOTICE) $(genDir)/NOTICES/libcore-NOTICE && cp -f $(location ojluni/NOTICE) $(genDir)/NOTICES/ojluni-NOTICE";
    out = [
        "NOTICES/libcore-NOTICE"
        "NOTICES/ojluni-NOTICE"
    ];
};

in { inherit _missingName notices-for-framework-stubs; }
