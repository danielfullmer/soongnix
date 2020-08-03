{ cc_binary, cc_binary_host, cc_defaults, cc_library, cc_library_static }:
let

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

subdirs = [
    "test"
];

libvintf-defaults = cc_defaults {
    name = "libvintf-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra-semi"
    ];

    target = {
        android = {
            cflags = ["-DLIBVINTF_TARGET"];
        };
    };
};

libvintf = cc_library {
    name = "libvintf";
    defaults = ["libvintf-defaults"];
    host_supported = true;
    recovery_available = true;
    srcs = [
        "parse_string.cpp"
        "parse_xml.cpp"
        "CompatibilityMatrix.cpp"
        "FileSystem.cpp"
        "HalManifest.cpp"
        "HalInterface.cpp"
        "KernelConfigTypedValue.cpp"
        "KernelConfigParser.cpp"
        "KernelInfo.cpp"
        "RuntimeInfo.cpp"
        "ManifestHal.cpp"
        "ManifestInstance.cpp"
        "MatrixHal.cpp"
        "MatrixInstance.cpp"
        "MatrixKernel.cpp"
        "PropertyFetcher.cpp"
        "Regex.cpp"
        "SystemSdk.cpp"
        "TransportArch.cpp"
        "VintfObject.cpp"
        "XmlFile.cpp"
    ];
    shared_libs = [
        "libbase"
        "libhidl-gen-utils"
        "liblog"
        "libselinux"
        "libtinyxml2"
        "libz"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
    local_include_dirs = ["include/vintf"];

    export_shared_lib_headers = [
        "libhidl-gen-utils"
    ];

    target = {
        host = {
            srcs = [
                "RuntimeInfo-host.cpp"
            ];
        };
        android = {
            srcs = [
                "RuntimeInfo-target.cpp"
            ];
        };
    };
};

vintf = cc_binary {
    name = "vintf";
    defaults = ["libvintf-defaults"];
    shared_libs = [
        "libbase"
        "libhidl-gen-utils"
        "libvintf"
    ];
    srcs = [
        "main.cpp"
    ];
};

checkvintf = cc_binary_host {
    name = "checkvintf";
    defaults = ["libvintf-defaults"];
    static_libs = [
        "libbase"
        "libhidl-gen-utils"
        "libvintf"
        "libutils"
        "libtinyxml2"
    ];
    stl = "libc++_static";
    srcs = [
        "check_vintf.cpp"
    ];
};

libassemblevintf = cc_library_static {
    name = "libassemblevintf";
    host_supported = true;
    defaults = ["libvintf-defaults"];
    shared_libs = [
        "libvintf"
        "libbase"
    ];
    srcs = [
        "AssembleVintf.cpp"
    ];
    export_include_dirs = ["include-test"];
};

assemble_vintf = cc_binary_host {
    name = "assemble_vintf";
    defaults = ["libvintf-defaults"];
    shared_libs = [
        "libvintf"
        "libbase"
    ];
    static_libs = [
        "libassemblevintf"
    ];
    srcs = [
        "assemble_vintf_main.cpp"
    ];
};

libvintf_recovery = cc_library_static {
    name = "libvintf_recovery";
    recovery_available = true;
    defaults = ["libvintf-defaults"];
    srcs = ["VintfObjectRecovery.cpp"];
    export_include_dirs = ["include"];
    local_include_dirs = ["include/vintf"];
    static_libs = [
        "libbase"
        "libvintf"
        "libhidl-gen-utils"
        "libfs_mgr"
    ];
    export_static_lib_headers = ["libhidl-gen-utils"];
};

in { inherit assemble_vintf checkvintf libassemblevintf libvintf libvintf-defaults libvintf_recovery vintf; }
