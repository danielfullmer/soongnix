{ python_library }:
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
py-asn1crypto = python_library {
    name = "py-asn1crypto";
    host_supported = true;
    srcs = [
        "__init__.py"
        "_errors.py"
        "_inet.py"
        "_int.py"
        "_iri.py"
        "_ordereddict.py"
        "_teletex_codec.py"
        "_types.py"
        "algos.py"
        "cms.py"
        "core.py"
        "crl.py"
        "csr.py"
        "keys.py"
        "ocsp.py"
        "parser.py"
        "pdf.py"
        "pem.py"
        "pkcs12.py"
        "tsp.py"
        "util.py"
        "version.py"
        "x509.py"

    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "asn1crypto";
};

in { inherit py-asn1crypto; }
