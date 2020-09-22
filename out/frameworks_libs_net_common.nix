{ filegroup, java_library }:
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

#  1. The "net-utils-framework-common" library is also compiled into the framework and placed on the
#     boot classpath. It uses jarjar rules so that anything outside the framework can use this
#     library directly.
#  2. The "net-utils-services-common" library is for use by modules and frameworks/base/services.
#     It does not need to be jarjared because it is not placed on the bootclasspath.
#  3. The "net-utils-telephony-common-srcs" filegroup is for use specifically by telephony, which
#     places many of its classes, even non-API service classes, on the boot classpath. Any file that
#     is added to this filegroup *must* have a corresponding jarjar rule in the telephony jarjar
#     rules file. Otherwise, it will end up on the boot classpath and other modules will not be able
#     to provide their own copy.

#  Note: all filegroups here must have the right path attribute because otherwise, if they are
#  included in the bootclasspath, they could incorrectly be included in the SDK documentation even
#  though they are not in the current.txt files.

net-utils-framework-common-srcs = filegroup {
    name = "net-utils-framework-common-srcs";
    srcs = [
        "src_frameworkcommon/android/net/util/IpRange.java"
        "src_frameworkcommon/android/net/util/LinkPropertiesUtils.java"
        "src_frameworkcommon/android/net/util/MacAddressUtils.java"
        "src_frameworkcommon/android/net/util/NetUtils.java"
        "src_frameworkcommon/android/net/util/nsd/DnsSdTxtRecord.java"
        "src_frameworkcommon/com/android/net/module/util/DnsPacket.java"
        "src_frameworkcommon/com/android/net/module/util/Inet4AddressUtils.java"
        "src_frameworkcommon/com/android/net/module/util/InetAddressUtils.java"
    ];
    path = "src_frameworkcommon";
    visibility = ["//frameworks/base"];
};

net-utils-framework-common = java_library {
    name = "net-utils-framework-common";
    srcs = [
        ":net-utils-framework-common-srcs"
        #  TODO: avoid including all framework annotations as they end up in library users jars
        #  and need jarjaring
        ":framework-annotations"
    ];
    sdk_version = "system_current";
    jarjar_rules = "jarjar-rules-shared.txt";
    visibility = [
        "//cts/tests/tests/net"
        "//frameworks/base/packages/Tethering"
        "//frameworks/opt/net/ike"
        "//frameworks/opt/telephony"
        "//packages/modules/NetworkStack"
        "//packages/modules/CaptivePortalLogin"
        "//frameworks/libs/net/common/tests:__subpackages__"
    ];
};

net-utils-services-common = java_library {
    name = "net-utils-services-common";
    srcs = [
        "src_servicescommon/android/net/NetworkFactory.java"
        ":framework-annotations"
    ];
    sdk_version = "system_current";
    visibility = [
        "//frameworks/base/services/net"
        "//frameworks/base/packages/Tethering"
        "//frameworks/opt/net/ike"
        "//packages/modules/NetworkStack"
        "//packages/modules/CaptivePortalLogin"
        "//frameworks/libs/net/common/tests:__subpackages__"
    ];
};

#  Use a filegroup and not a library for telephony sources, as framework-annotations cannot be
#  included either (some annotations would be duplicated on the bootclasspath).
net-utils-telephony-common-srcs = filegroup {
    name = "net-utils-telephony-common-srcs";
    srcs = [
        #  Any class here *must* have a corresponding jarjar rule in the telephony build rules.
        "src_servicescommon/android/net/NetworkFactory.java"
    ];
    path = "src_servicescommon";
    visibility = [
        "//frameworks/opt/telephony"
    ];
};

#  Use a filegroup and not a library for wifi sources, as this needs corresponding jar-jar
#  rules on the wifi side.
#  Any class here *must* have a corresponding jarjar rule in the wifi build rules.
net-utils-framework-wifi-common-srcs = filegroup {
    name = "net-utils-framework-wifi-common-srcs";
    srcs = [
        "src_frameworkcommon/android/net/util/nsd/DnsSdTxtRecord.java"
        "src_frameworkcommon/android/net/util/MacAddressUtils.java"
        "src_frameworkcommon/com/android/net/module/util/DnsPacket.java"
        "src_frameworkcommon/com/android/net/module/util/Inet4AddressUtils.java"
        "src_frameworkcommon/com/android/net/module/util/InetAddressUtils.java"
    ];
    path = "src_frameworkcommon";
    visibility = [
        "//frameworks/base"
    ];
};

#  Use a filegroup and not a library for wifi sources, as this needs corresponding jar-jar
#  rules on the wifi side.
#  Any class here *must* have a corresponding jarjar rule in the wifi build rules.
net-utils-wifi-service-common-srcs = filegroup {
    name = "net-utils-wifi-service-common-srcs";
    srcs = [
        "src_frameworkcommon/android/net/util/NetUtils.java"
        "src_servicescommon/android/net/NetworkFactory.java"
    ];
    visibility = [
        "//frameworks/opt/net/wifi/service"
    ];
};

in { inherit net-utils-framework-common net-utils-framework-common-srcs net-utils-framework-wifi-common-srcs net-utils-services-common net-utils-telephony-common-srcs net-utils-wifi-service-common-srcs; }
