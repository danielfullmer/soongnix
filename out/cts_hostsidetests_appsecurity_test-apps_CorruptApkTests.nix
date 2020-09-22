{ android_test_import }:
let

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

CtsCorruptApkTests_b71360999 = android_test_import {
    name = "CtsCorruptApkTests_b71360999";
    apk = "b71360999.apk";
    presigned = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsCorruptApkTests_b71361168 = android_test_import {
    name = "CtsCorruptApkTests_b71361168";
    apk = "b71361168.apk";
    presigned = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsCorruptApkTests_b79488511 = android_test_import {
    name = "CtsCorruptApkTests_b79488511";
    apk = "b79488511.apk";
    presigned = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsCorruptApkTests_b71360999 CtsCorruptApkTests_b71361168 CtsCorruptApkTests_b79488511; }