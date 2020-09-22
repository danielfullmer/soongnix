{ cc_binary_host, cc_defaults, cc_library_host_static, java_defaults }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

hidl-gen-defaults = cc_defaults {
    name = "hidl-gen-defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        host = {
            cflags = [
                "-O0"
                "-g"
            ];
        };
    };
};

#  This configuration is inherited by all hidl-gen-generated modules.
hidl-module-defaults = cc_defaults {
    name = "hidl-module-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra-semi"
    ];
    tidy_checks = [
        #  _hidl_cb and addOnewayTask are stuck because of the legacy ABI
        "-performance-unnecessary-value-param"
    ];
    product_variables = {
        debuggable = {
            cflags = ["-D__ANDROID_DEBUGGABLE__"];
        };
    };
};

#  This configuration is inherited by all hidl-gen-java modules
hidl-java-module-defaults = java_defaults {
    name = "hidl-java-module-defaults";
    #  TODO(b/68433855): allow HIDL java to build in the PDK
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

libhidl-gen = cc_library_host_static {
    name = "libhidl-gen";
    defaults = ["hidl-gen-defaults"];
    cflags = [
        "-Wno-bool-operation" #  found in ConstantExpression.cpp:105
    ];
    srcs = [
        "Annotation.cpp"
        "ArrayType.cpp"
        "CompoundType.cpp"
        "ConstantExpression.cpp"
        "DeathRecipientType.cpp"
        "DocComment.cpp"
        "EnumType.cpp"
        "FmqType.cpp"
        "HandleType.cpp"
        "HidlTypeAssertion.cpp"
        "Interface.cpp"
        "Location.cpp"
        "MemoryType.cpp"
        "Method.cpp"
        "NamedType.cpp"
        "PointerType.cpp"
        "ScalarType.cpp"
        "Scope.cpp"
        "StringType.cpp"
        "Type.cpp"
        "TypeDef.cpp"
        "VectorType.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    static_libs = [
        "libcrypto"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
    ];
    export_shared_lib_headers = ["libbase"];
    export_static_lib_headers = [
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
    ];
    export_include_dirs = ["."]; #  for tests
};

libhidl-gen-ast = cc_library_host_static {
    name = "libhidl-gen-ast";
    defaults = ["hidl-gen-defaults"];
    srcs = [
        "AST.cpp"
        "Coordinator.cpp"
        "generateCpp.cpp"
        "generateCppAdapter.cpp"
        "generateCppImpl.cpp"
        "generateDependencies.cpp"
        "generateFormattedHidl.cpp"
        "generateInheritanceHierarchy.cpp"
        "generateJava.cpp"
        "generateJavaImpl.cpp"
        "generateVts.cpp"
        "hidl-gen_l.ll"
        "hidl-gen_y.yy"
    ];
    shared_libs = [
        "libbase"
        "libjsoncpp"
    ];
    static_libs = [
        "libcrypto"
        "libhidl-gen"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
    ];
    export_shared_lib_headers = ["libbase"];
    export_static_lib_headers = [
        "libhidl-gen-hash"
        "libhidl-gen-utils"
    ];
    export_include_dirs = ["."]; #  for tests
    yacc = {
        gen_location_hh = true;
        gen_position_hh = true;
    };
};

hidl-gen = cc_binary_host {
    name = "hidl-gen";
    defaults = ["hidl-gen-defaults"];
    srcs = ["main.cpp"];
    static_libs = [
        "libbase"
        "libcrypto"
        "libhidl-gen"
        "libhidl-gen-ast"
        "libhidl-gen-hash"
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
        "libjsoncpp"
        "liblog"
    ];
};

in { inherit hidl-gen hidl-gen-defaults hidl-java-module-defaults hidl-module-defaults libhidl-gen libhidl-gen-ast; }
