{ android_test_import }:
let

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

CtsCorruptApkTests_Compressed_Q = android_test_import {
    name = "CtsCorruptApkTests_Compressed_Q";
    apk = "compressed_Q.apk";
    presigned = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsCorruptApkTests_Compressed_R = android_test_import {
    name = "CtsCorruptApkTests_Compressed_R";
    apk = "compressed_R.apk";
    presigned = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsCorruptApkTests_Unaligned_Q = android_test_import {
    name = "CtsCorruptApkTests_Unaligned_Q";
    apk = "unaligned_Q.apk";
    presigned = true;
    preprocessed = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsCorruptApkTests_Unaligned_R = android_test_import {
    name = "CtsCorruptApkTests_Unaligned_R";
    apk = "unaligned_R.apk";
    presigned = true;
    preprocessed = true;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsCorruptApkTests_Compressed_Q CtsCorruptApkTests_Compressed_R CtsCorruptApkTests_Unaligned_Q CtsCorruptApkTests_Unaligned_R; }
