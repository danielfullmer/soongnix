{ filegroup, genrule, java_test_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

deqp_master_caselists = filegroup {
    name = "deqp_master_caselists";
    srcs = [
        "master/egl-master-risky.txt"
        "master/egl-master.txt"
        "master/gles2-master-risky.txt"
        "master/gles2-master.txt"
        "master/gles3-565-no-depth-no-stencil.txt"
        "master/gles3-master-risky.txt"
        "master/gles3-master.txt"
        "master/gles3-multisample.txt"
        "master/gles3-rotate-landscape.txt"
        "master/gles3-rotate-portrait.txt"
        "master/gles3-rotate-reverse-landscape.txt"
        "master/gles3-rotate-reverse-portrait.txt"
        "master/gles31-565-no-depth-no-stencil.txt"
        "master/gles31-master-risky.txt"
        "master/gles31-master.txt"
        "master/gles31-multisample.txt"
        "master/gles31-rotate-landscape.txt"
        "master/gles31-rotate-portrait.txt"
        "master/gles31-rotate-reverse-landscape.txt"
        "master/gles31-rotate-reverse-portrait.txt"
        "master/vk-master-risky.txt"
        "master/vk-master.txt"
    ];
    path = "master";
};

deqp_nyc_caselists = genrule {
    name = "deqp_nyc_caselists";
    srcs = [
        "nyc/vk-master.txt"
        "nyc/gles31-master.txt"
        "nyc/egl-master.txt"
    ];
    out = [
        "nyc-vk-master.txt"
        "nyc-gles31-master.txt"
        "nyc-egl-master.txt"
    ];
    cmd = "for i in $(in); do cp $$i $(genDir)/nyc-$$(basename $$i); done";
};

deqp_angle_exclude_caselists = filegroup {
    name = "deqp_angle_exclude_caselists";
    srcs = [
        "angle/egl-angle-excluded.txt"
        "angle/gles2-angle-excluded.txt"
    ];
    path = "angle";
};

CtsDeqpTestCases = java_test_host {
    name = "CtsDeqpTestCases";

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];

    srcs = [
        "runner/src/com/drawelements/deqp/runner/BatchRunConfiguration.java"
        "runner/src/com/drawelements/deqp/runner/DeqpTestRunner.java"
    ];
    libs = [
        "cts-tradefed"
        "compatibility-host-util"
        "tradefed"
    ];

    data = [
        ":deqp_master_caselists"
        ":deqp_nyc_caselists"
        ":deqp_angle_exclude_caselists"
    ];
};

in { inherit CtsDeqpTestCases deqp_angle_exclude_caselists deqp_master_caselists deqp_nyc_caselists; }
