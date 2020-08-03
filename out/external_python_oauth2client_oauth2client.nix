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
py-oauth2client = python_library {
    name = "py-oauth2client";
    host_supported = true;
    srcs = [
        "*.py"
        "contrib/*.py"
        "contrib/django_util/*.py"
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
        "py-httplib2"
        "py-pyasn1"
        "py-pyasn1-modules"
        "py-rsa"
        "py-six"
    ];
    pkg_path = "oauth2client";
};

in { inherit py-oauth2client; }
