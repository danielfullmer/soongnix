{ cc_library_shared }:
let

#
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
#

libmtp = cc_library_shared {
    name = "libmtp";
    srcs = [
        "MtpDataPacket.cpp"
        "MtpDebug.cpp"
        "MtpDescriptors.cpp"
        "MtpDevHandle.cpp"
        "MtpDevice.cpp"
        "MtpDeviceInfo.cpp"
        "MtpEventPacket.cpp"
        "MtpFfsCompatHandle.cpp"
        "MtpFfsHandle.cpp"
        "MtpObjectInfo.cpp"
        "MtpPacket.cpp"
        "MtpProperty.cpp"
        "MtpRequestPacket.cpp"
        "MtpResponsePacket.cpp"
        "MtpServer.cpp"
        "MtpStorage.cpp"
        "MtpStorageInfo.cpp"
        "MtpStringBuffer.cpp"
        "MtpUtils.cpp"
        "PosixAsyncIO.cpp"
    ];
    export_include_dirs = ["."];
    cflags = [
        "-DMTP_DEVICE"
        "-DMTP_HOST"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libasyncio"
        "libbase"
        "liblog"
        "libusbhost"
    ];
};

in { inherit libmtp; }
