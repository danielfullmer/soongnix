{ java_library }:
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

netlink-client = java_library {
    name = "netlink-client";
    srcs = [
        "src/android/net/netlink/ConntrackMessage.java"
        "src/android/net/netlink/InetDiagMessage.java"
        "src/android/net/netlink/NdOption.java"
        "src/android/net/netlink/NduseroptMessage.java"
        "src/android/net/netlink/NetlinkConstants.java"
        "src/android/net/netlink/NetlinkErrorMessage.java"
        "src/android/net/netlink/NetlinkMessage.java"
        "src/android/net/netlink/NetlinkSocket.java"
        "src/android/net/netlink/RtNetlinkNeighborMessage.java"
        "src/android/net/netlink/StructInetDiagMsg.java"
        "src/android/net/netlink/StructInetDiagReqV2.java"
        "src/android/net/netlink/StructInetDiagSockId.java"
        "src/android/net/netlink/StructNdMsg.java"
        "src/android/net/netlink/StructNdOptPref64.java"
        "src/android/net/netlink/StructNdaCacheInfo.java"
        "src/android/net/netlink/StructNfGenMsg.java"
        "src/android/net/netlink/StructNlAttr.java"
        "src/android/net/netlink/StructNlMsgErr.java"
        "src/android/net/netlink/StructNlMsgHdr.java"
        ":framework-annotations"
    ];
    libs = [
        "androidx.annotation_annotation"
    ];
    sdk_version = "system_current";
};

in { inherit netlink-client; }
