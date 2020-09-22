{ filegroup, python_library }:
let

#  Copyright 2019 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
py-cffi = python_library {
    name = "py-cffi";
    host_supported = true;
    srcs = [
        "__init__.py"
        "api.py"
        "backend_ctypes.py"
        "cffi_opcode.py"
        "commontypes.py"
        "cparser.py"
        "error.py"
        "ffiplatform.py"
        "lock.py"
        "model.py"
        "pkgconfig.py"
        "recompiler.py"
        "setuptools_ext.py"
        "vengine_cpy.py"
        "vengine_gen.py"
        "verifier.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    data = [
        ":py-cffi-headers"
    ];
    libs = [
        "py-cffi-backend"
        "py-cffi-backend-libffi"
        "py-pycparser"
    ];
    pkg_path = "cffi";
};

py-cffi-headers = filegroup {
    name = "py-cffi-headers";
    srcs = [
        "_cffi_errors.h"
        "_cffi_include.h"
        "_embedding.h"
        "parse_c_type.h"
    ];
};

in { inherit py-cffi py-cffi-headers; }
