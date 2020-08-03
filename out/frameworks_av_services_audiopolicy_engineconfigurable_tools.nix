{ python_binary_host, python_defaults }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

tools_default = python_defaults {
    name = "tools_default";
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

"buildPolicyCriterionTypes.py" = python_binary_host {
    name = "buildPolicyCriterionTypes.py";
    main = "buildPolicyCriterionTypes.py";
    srcs = [
        "buildPolicyCriterionTypes.py"
    ];
    defaults = ["tools_default"];
};

"domainGeneratorPolicy.py" = python_binary_host {
    name = "domainGeneratorPolicy.py";
    main = "domainGeneratorPolicy.py";
    srcs = [
        "domainGeneratorPolicy.py"
    ];
    defaults = ["tools_default"];
    libs = [
        "EddParser.py"
        "hostConfig.py"
        "PFWScriptGenerator.py"
    ];
    required = [
        "domainGeneratorConnector"
    ];
};

"buildStrategiesStructureFile.py" = python_binary_host {
    name = "buildStrategiesStructureFile.py";
    main = "buildStrategiesStructureFile.py";
    srcs = [
        "buildStrategiesStructureFile.py"
    ];
    defaults = ["tools_default"];
};

in { inherit "buildPolicyCriterionTypes.py" "buildStrategiesStructureFile.py" "domainGeneratorPolicy.py" tools_default; }
