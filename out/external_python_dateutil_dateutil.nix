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
py-dateutil = python_library {
    name = "py-dateutil";
    host_supported = true;
    srcs = [
        "__init__.py"
        "_common.py"
        "easter.py"
        "relativedelta.py"
        "rrule.py"
        "tzwin.py"
        "utils.py"
        "parser/__init__.py"
        "parser/_parser.py"
        "parser/isoparser.py"
        "tz/__init__.py"
        "tz/_common.py"
        "tz/_factories.py"
        "tz/tz.py"
        "tz/win.py"
        "zoneinfo/__init__.py"
        "zoneinfo/rebuild.py"
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
        "py-six"
    ];
    pkg_path = "dateutil";
};

in { inherit py-dateutil; }
