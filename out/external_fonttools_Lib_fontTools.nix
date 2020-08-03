{ python_defaults, python_library_host }:
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
fonttools_default = python_defaults {
    name = "fonttools_default";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

fontTools = python_library_host {
    name = "fontTools";
    defaults = ["fonttools_default"];
    pkg_path = "fontTools";
    srcs = [
        "**/*.py"
    ];
};

in { inherit fontTools fonttools_default; }
