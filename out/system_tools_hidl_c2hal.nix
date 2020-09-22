{ cc_binary_host }:
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

c2hal = cc_binary_host {
    name = "c2hal";
    defaults = ["hidl-gen-defaults"];
    srcs = [
        "AST.cpp"
        "CompositeDeclaration.cpp"
        "Declaration.cpp"
        "Define.cpp"
        "EnumVarDeclaration.cpp"
        "Expression.cpp"
        "FunctionDeclaration.cpp"
        "Include.cpp"
        "Note.cpp"
        "Type.cpp"
        "TypeDef.cpp"
        "VarDeclaration.cpp"
        "c2hal_l.ll"
        "c2hal_y.yy"
        "main.cpp"
    ];

    shared_libs = [
        "libbase"
        "liblog"
    ];

    static_libs = [
        "libhidl-gen-host-utils"
        "libhidl-gen-utils"
        "libutils"
    ];
};

in { inherit c2hal; }
