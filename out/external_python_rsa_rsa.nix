{ python_library }:
let

#  Copyright 2018 Google Inc. All rights reserved.
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
py-rsa = python_library {
    name = "py-rsa";
    host_supported = true;
    srcs = [
        "__init__.py"
        "_compat.py"
        "asn1.py"
        "cli.py"
        "common.py"
        "core.py"
        "key.py"
        "machine_size.py"
        "parallel.py"
        "pem.py"
        "pkcs1.py"
        "pkcs1_v2.py"
        "prime.py"
        "randnum.py"
        "transform.py"
        "util.py"
    ];
    libs = [
        "py-pyasn1"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "rsa";
};

in { inherit py-rsa; }
