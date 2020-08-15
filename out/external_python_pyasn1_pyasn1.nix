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
py-pyasn1 = python_library {
    name = "py-pyasn1";
    host_supported = true;
    srcs = [
        "__init__.py"
        "debug.py"
        "error.py"
        "codec/__init__.py"
        "codec/ber/__init__.py"
        "codec/ber/decoder.py"
        "codec/ber/encoder.py"
        "codec/ber/eoo.py"
        "codec/cer/__init__.py"
        "codec/cer/decoder.py"
        "codec/cer/encoder.py"
        "codec/der/__init__.py"
        "codec/der/decoder.py"
        "codec/der/encoder.py"
        "codec/native/__init__.py"
        "codec/native/decoder.py"
        "codec/native/encoder.py"
        "compat/__init__.py"
        "compat/binary.py"
        "compat/calling.py"
        "compat/dateandtime.py"
        "compat/integer.py"
        "compat/octets.py"
        "compat/string.py"
        "type/__init__.py"
        "type/base.py"
        "type/char.py"
        "type/constraint.py"
        "type/error.py"
        "type/namedtype.py"
        "type/namedval.py"
        "type/opentype.py"
        "type/tag.py"
        "type/tagmap.py"
        "type/univ.py"
        "type/useful.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "pyasn1";
};

in { inherit py-pyasn1; }
