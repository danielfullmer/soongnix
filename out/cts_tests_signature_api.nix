{ genrule, genrule_defaults }:
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

signature-cts-api-api-gz = genrule_defaults {
    name = "signature-cts-api-api-gz";
    cmd = "$(location metalava) --no-banner --compatible-output=no -convert2xmlnostrip $(in) $(genDir)/api.xml && gzip -c $(genDir)/api.xml > $(out)";
    tools = ["metalava"];
    visibility = [
        "//cts/tests/signature/api-check:__subpackages__"
        "//cts/tests/signature/intent-check"
    ];
};

cts-current-api-gz = genrule {
    name = "cts-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":frameworks-base-api-current.txt"
    ];
    out = [
        "current.api.gz"
    ];
};

cts-system-current-api-gz = genrule {
    name = "cts-system-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":frameworks-base-api-system-current.txt"
    ];
    out = [
        "system-current.api.gz"
    ];
};

cts-system-removed-api-gz = genrule {
    name = "cts-system-removed-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":frameworks-base-api-system-removed.txt"
    ];
    out = [
        "system-removed.api.gz"
    ];
};

cts-android-test-base-current-api-gz = genrule {
    name = "cts-android-test-base-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":android-test-base-current.txt"
    ];
    out = [
        "android-test-base-current.api.gz"
    ];
};

cts-android-test-mock-current-api-gz = genrule {
    name = "cts-android-test-mock-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":android-test-mock-current.txt"
    ];
    out = [
        "android-test-mock-current.api.gz"
    ];
};

cts-android-test-runner-current-api-gz = genrule {
    name = "cts-android-test-runner-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":android-test-runner-current.txt"
    ];
    out = [
        "android-test-runner-current.api.gz"
    ];
};

cts-apache-http-legacy-current-api-gz = genrule {
    name = "cts-apache-http-legacy-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":apache-http-legacy-current.txt"
    ];
    out = [
        "apache-http-legacy-current.api.gz"
    ];
};

cts-car-system-current-api-gz = genrule {
    name = "cts-car-system-current-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":car-api-system-current.txt"
    ];
    out = [
        "car-system-current.api.gz"
    ];
};

cts-car-system-removed-api-gz = genrule {
    name = "cts-car-system-removed-api-gz";
    defaults = ["signature-cts-api-api-gz"];
    srcs = [
        ":car-api-system-removed.txt"
    ];
    out = [
        "car-system-removed.api.gz"
    ];
};

in { inherit cts-android-test-base-current-api-gz cts-android-test-mock-current-api-gz cts-android-test-runner-current-api-gz cts-apache-http-legacy-current-api-gz cts-car-system-current-api-gz cts-car-system-removed-api-gz cts-current-api-gz cts-system-current-api-gz cts-system-removed-api-gz signature-cts-api-api-gz; }
