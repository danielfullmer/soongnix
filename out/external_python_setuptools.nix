{ python_library }:
let

#  Copyright 2017 Google Inc. All rights reserved.
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

py-setuptools = python_library {
    name = "py-setuptools";
    host_supported = true;
    srcs = [
        "pkg_resources/__init__.py"
        "pkg_resources/py31compat.py"
        "pkg_resources/extern/__init__.py"
        "pkg_resources/_vendor/__init__.py"
        "pkg_resources/_vendor/appdirs.py"
        "pkg_resources/_vendor/pyparsing.py"
        "pkg_resources/_vendor/six.py"
        "pkg_resources/_vendor/packaging/__about__.py"
        "pkg_resources/_vendor/packaging/__init__.py"
        "pkg_resources/_vendor/packaging/_compat.py"
        "pkg_resources/_vendor/packaging/_structures.py"
        "pkg_resources/_vendor/packaging/markers.py"
        "pkg_resources/_vendor/packaging/requirements.py"
        "pkg_resources/_vendor/packaging/specifiers.py"
        "pkg_resources/_vendor/packaging/utils.py"
        "pkg_resources/_vendor/packaging/version.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
    };
};

in { inherit py-setuptools; }
