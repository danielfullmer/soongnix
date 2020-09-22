{ java_device_for_host, java_genrule, java_host_for_device, java_library, java_library_host, robolectric_build_props }:
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

robolectric_android-all-stub = java_library {
    name = "robolectric_android-all-stub";

    static_libs = [
        "conscrypt"
        "core-icu4j"
        "core-libart"
        "ext"
        "framework-all"
        "icu4j-icudata-jarjar"
        "icu4j-icutzdata-jarjar"
        "ims-common"
        "android.test.base_static"
        "libphonenumber-platform"
        "okhttp"
        "services"
        "services.accessibility"
        "telephony-common"

        "robolectric_tzdata"
        "robolectric_framework_res"
        "robolectric_framework_raw_res"
    ];

    java_resources = [
        #  Copy the build.prop
        ":robolectric_build_props"
    ];
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dest = "android-all-robolectric.jar";
    };
};

#  build.prop file created by module type defined in soong/robolectric.go
_bp2nix_robolectric_build_props = robolectric_build_props {
    name = "robolectric_build_props";
};

#  package the framework raw/uncompiled resources and assets into a jar
#  This logic can be removed once the transition to binary resources is complete
robolectric_framework_raw_res_orig = java_library {
    name = "robolectric_framework_raw_res_orig";
    java_resources = [":robolectric_framework_raw_res_files"];
};

#  Move the raw/uncompiled resources and assets into raw-res/
#  This logic can be removed once the transition to binary resources is complete
robolectric_framework_raw_res = java_genrule {
    name = "robolectric_framework_raw_res";
    out = ["robolectric_framework_raw_res.jar"];
    srcs = [":robolectric_framework_raw_res_orig"];
    tools = ["zip2zip"];
    cmd = "$(location zip2zip) " +
        "-i $(location :robolectric_framework_raw_res_orig) " +
        "-o $(location robolectric_framework_raw_res.jar) " +
        "-x META-INF/**/* " +
        "**/*:raw-res/";
};

robolectric_framework_res = java_genrule {
    name = "robolectric_framework_res";
    tools = ["zip2zip"];
    srcs = [":framework-res"];
    out = ["robolectric_framework_res.jar"];
    cmd = "$(location zip2zip) " +
        "-i $(location :framework-res) " +
        "-o $(location robolectric_framework_res.jar) " +
        "-x classes.dex " +
        "-x META-INF/**/* " +
        "-0 resources.arsc";
};

#  Make robolectric_android-all-stub available as a host jar
robolectric-host-android_all = java_device_for_host {
    name = "robolectric-host-android_all";
    libs = ["robolectric_android-all-stub"];
};

# #############################################
#  Assemble Robolectric_all
# #############################################

Robolectric_all = java_library_host {
    name = "Robolectric_all";

    static_libs = [
        "Robolectric_shadows_androidx_fragment"
        "Robolectric_shadows_httpclient"
        "Robolectric_shadows_framework"
        "Robolectric_shadows_supportv4"
        "Robolectric_shadows_multidex"
        "Robolectric_robolectric"
        "Robolectric_annotations"
        "Robolectric_resources"
        "Robolectric_shadowapi"
        "Robolectric_sandbox"
        "Robolectric_junit"
        "Robolectric_utils"
        "asm-6.0" #  if upgrading to ASM 7.0+, unset my_require_v53_or_lower_class_files in robotest-internal.mk (requires robolectric 4.0.x, see b/135459087)
        "junit"
        "asm-tree-6.0"
        "guava"
        "asm-commons-6.0"
        "bouncycastle-unbundled"
        "robolectric-sqlite4java-0.282"
        "hamcrest"
        "hamcrest-library"
        "robolectric-host-androidx-test-runner"
        "robolectric-host-org_apache_http_legacy"
    ];

    java_resource_dirs = [
        "shadows/framework/src/main/resources"
        "src/main/resources"
    ];
};

#  Make Robolectric_all available as a target jar
Robolectric_all-target = java_host_for_device {
    name = "Robolectric_all-target";
    libs = ["Robolectric_all"];
};

#  Make dependencies available as host jars
robolectric-host-androidx-test-core = java_device_for_host {
    name = "robolectric-host-androidx-test-core";
    libs = ["androidx.test.core"];
};

robolectric-host-androidx-test-ext-junit = java_device_for_host {
    name = "robolectric-host-androidx-test-ext-junit";
    libs = ["androidx.test.ext.junit"];
};

robolectric-host-androidx-test-monitor = java_device_for_host {
    name = "robolectric-host-androidx-test-monitor";
    libs = ["androidx.test.monitor"];
};

robolectric-host-androidx-test-runner = java_device_for_host {
    name = "robolectric-host-androidx-test-runner";
    libs = ["androidx.test.runner"];
};

robolectric-host-androidx = java_device_for_host {
    name = "robolectric-host-androidx";
    libs = ["androidx.fragment_fragment"];
};

robolectric-host-android-support-v4 = java_device_for_host {
    name = "robolectric-host-android-support-v4";
    libs = ["android-support-v4"];
};

robolectric-host-android-support-multidex = java_device_for_host {
    name = "robolectric-host-android-support-multidex";
    libs = ["android-support-multidex"];
};

robolectric-host-org_apache_http_legacy = java_device_for_host {
    name = "robolectric-host-org_apache_http_legacy";
    libs = ["org.apache.http.legacy.stubs"];
};

in { inherit Robolectric_all Robolectric_all-target robolectric-host-android-support-multidex robolectric-host-android-support-v4 robolectric-host-android_all robolectric-host-androidx robolectric-host-androidx-test-core robolectric-host-androidx-test-ext-junit robolectric-host-androidx-test-monitor robolectric-host-androidx-test-runner robolectric-host-org_apache_http_legacy robolectric_android-all-stub robolectric_framework_raw_res robolectric_framework_raw_res_orig robolectric_framework_res; robolectric_build_props = _bp2nix_robolectric_build_props; }
