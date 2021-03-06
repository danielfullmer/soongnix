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

py-funcsigs = python_library {
    name = "py-funcsigs";
    host_supported = true;
    srcs = [
        "__init__.py"
        "odict.py"
        "version.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    pkg_path = "funcsigs";
};

in { inherit py-funcsigs; }
