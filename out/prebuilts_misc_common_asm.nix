{ java_defaults, java_import, java_import_host }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

"asm-5.2" = java_import_host {
    name = "asm-5.2";
    jars = ["asm-5.2.jar"];
};

"asm-analysis-5.2" = java_import_host {
    name = "asm-analysis-5.2";
    jars = ["asm-analysis-5.2.jar"];
};

"asm-commons-5.2" = java_import_host {
    name = "asm-commons-5.2";
    jars = ["asm-commons-5.2.jar"];
};

"asm-tree-5.2" = java_import_host {
    name = "asm-tree-5.2";
    jars = ["asm-tree-5.2.jar"];
};

#  These should be host-only, since there is no bytecode on the device to be
#  parsed with ASM, but jacocoagent currently needs them to compile (b/69671801)
"asm-6.0" = java_import {
    name = "asm-6.0";
    host_supported = true;
    jars = ["asm-6.0.jar"];
};

"asm-analysis-6.0" = java_import {
    name = "asm-analysis-6.0";
    host_supported = true;
    jars = ["asm-analysis-6.0.jar"];
};

"asm-commons-6.0" = java_import {
    name = "asm-commons-6.0";
    host_supported = true;
    jars = ["asm-commons-6.0.jar"];
};

"asm-tree-6.0" = java_import {
    name = "asm-tree-6.0";
    host_supported = true;
    jars = ["asm-tree-6.0.jar"];
};

"asm-util-6.0" = java_import {
    name = "asm-util-6.0";
    host_supported = true;
    jars = ["asm-util-6.0.jar"];
};

"asm-7.0-defaults" = java_defaults {
    name = "asm-7.0-defaults";
    apex_available = [
        "//apex_available:anyapex"
        "//apex_available:platform"
    ];
};

"asm-7.0" = java_import {
    name = "asm-7.0";
    host_supported = true;
    jars = ["asm-7.0.jar"];
    defaults = ["asm-7.0-defaults"];
};

"asm-analysis-7.0" = java_import {
    name = "asm-analysis-7.0";
    host_supported = true;
    jars = ["asm-analysis-7.0.jar"];
    defaults = ["asm-7.0-defaults"];
};

"asm-commons-7.0" = java_import {
    name = "asm-commons-7.0";
    host_supported = true;
    jars = ["asm-commons-7.0.jar"];
    defaults = ["asm-7.0-defaults"];
};

"asm-tree-7.0" = java_import {
    name = "asm-tree-7.0";
    host_supported = true;
    jars = ["asm-tree-7.0.jar"];
    defaults = ["asm-7.0-defaults"];
};

"asm-util-7.0" = java_import {
    name = "asm-util-7.0";
    host_supported = true;
    jars = ["asm-util-7.0.jar"];
    defaults = ["asm-7.0-defaults"];
};

in { inherit "asm-5.2" "asm-6.0" "asm-7.0" "asm-7.0-defaults" "asm-analysis-5.2" "asm-analysis-6.0" "asm-analysis-7.0" "asm-commons-5.2" "asm-commons-6.0" "asm-commons-7.0" "asm-tree-5.2" "asm-tree-6.0" "asm-tree-7.0" "asm-util-6.0" "asm-util-7.0"; }
