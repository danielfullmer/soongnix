{ python_library }:
let

#  Copyright 2018 Google Inc. All rights reserved.
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
py-pyasn1-modules = python_library {
    name = "py-pyasn1-modules";
    host_supported = true;
    srcs = [
        "__init__.py"
        "pem.py"
        "rfc1155.py"
        "rfc1157.py"
        "rfc1901.py"
        "rfc1902.py"
        "rfc1905.py"
        "rfc2251.py"
        "rfc2314.py"
        "rfc2315.py"
        "rfc2437.py"
        "rfc2459.py"
        "rfc2511.py"
        "rfc2560.py"
        "rfc2634.py"
        "rfc2986.py"
        "rfc3161.py"
        "rfc3274.py"
        "rfc3279.py"
        "rfc3280.py"
        "rfc3281.py"
        "rfc3412.py"
        "rfc3414.py"
        "rfc3447.py"
        "rfc3560.py"
        "rfc3565.py"
        "rfc3709.py"
        "rfc3779.py"
        "rfc3852.py"
        "rfc4055.py"
        "rfc4073.py"
        "rfc4108.py"
        "rfc4210.py"
        "rfc4211.py"
        "rfc5035.py"
        "rfc5083.py"
        "rfc5084.py"
        "rfc5208.py"
        "rfc5280.py"
        "rfc5480.py"
        "rfc5649.py"
        "rfc5652.py"
        "rfc5915.py"
        "rfc5940.py"
        "rfc5958.py"
        "rfc6019.py"
        "rfc6402.py"
        "rfc7191.py"
        "rfc7296.py"
        "rfc8103.py"
        "rfc8226.py"
        "rfc8410.py"
        "rfc8418.py"
        "rfc8520.py"
        "rfc8619.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    libs = [
        "py-pyasn1"
    ];
    pkg_path = "pyasn1_modules";
};

in { inherit py-pyasn1-modules; }
