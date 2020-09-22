{ filegroup }:
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

expectations_visibility = [
    "//cts/tests/libcore:__subpackages__"
];

libcore-expectations-knownfailures = filegroup {
    name = "libcore-expectations-knownfailures";
    visibility = expectations_visibility;
    srcs = ["knownfailures.txt"];
};

libcore-expectations-virtualdeviceknownfailures = filegroup {
    name = "libcore-expectations-virtualdeviceknownfailures";
    visibility = expectations_visibility;
    srcs = ["virtualdeviceknownfailures.txt"];
};

in { inherit libcore-expectations-knownfailures libcore-expectations-virtualdeviceknownfailures; }