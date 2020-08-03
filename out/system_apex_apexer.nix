{ apex_key, apex_test, python_binary_host }:
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

apexer_tools = [
    "apexer"
    "aapt2"
    "avbtool"
    "e2fsdroid"
    "merge_zips"
    "mke2fs"
    "resize2fs"
    "sefcontext_compile"
    "soong_zip"
    "zipalign"
    #  TODO(b/124476339) apex doesn't follow 'required' dependencies so we need to include this
    #  manually for 'avbtool'.
    "fec"
];

apexer = python_binary_host {
    name = "apexer";
    srcs = [
        "apexer.py"
        "apex_manifest.py"
    ];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
    libs = [
        "apex_manifest_proto"
    ];
    required = apexer_tools;
};

"com.android.support.apexer.key" = apex_key {
    name = "com.android.support.apexer.key";
    public_key = "etc/com.android.support.apexer.avbpubkey";
    private_key = "etc/com.android.support.apexer.pem";
};

#  This is a host-apex that contains all the binaries needed to create new apex's seprate from
#  soong.
"com.android.support.apexer" = apex_test {
    name = "com.android.support.apexer";
    payload_type = "zip";
    host_supported = true;
    device_supported = false;
    manifest = "etc/manifest.json";
    ignore_system_library_special_case = true;
    key = "com.android.support.apexer.key";
    binaries = apexer_tools;
};

in { inherit "com.android.support.apexer" "com.android.support.apexer.key" apexer; }
