{ filegroup, genrule, prebuilt_etc }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#  Root soong_namespace for common components

"PolicyClass.xml" = prebuilt_etc {
    name = "PolicyClass.xml";
    vendor = true;
    src = ":PolicyClass";
    sub_dir = "parameter-framework/Structure/Policy";
};

"PolicySubsystem.xml" = prebuilt_etc {
    name = "PolicySubsystem.xml";
    vendor = true;
    src = ":PolicySubsystem";
    sub_dir = "parameter-framework/Structure/Policy";
};

"PolicySubsystem-CommonTypes.xml" = prebuilt_etc {
    name = "PolicySubsystem-CommonTypes.xml";
    vendor = true;
    src = ":buildcommontypesstructure_gen";
    sub_dir = "parameter-framework/Structure/Policy";
};

buildcommontypesstructure_gen = genrule {
    name = "buildcommontypesstructure_gen";
    defaults = ["buildcommontypesstructurerule"];
};

product_strategies_structure_template = filegroup {
    name = "product_strategies_structure_template";
    srcs = ["examples/common/Structure/ProductStrategies.xml.in"];
};

PolicySubsystem = filegroup {
    name = "PolicySubsystem";
    srcs = ["examples/common/Structure/PolicySubsystem.xml"];
};

PolicySubsystem-no-strategy = filegroup {
    name = "PolicySubsystem-no-strategy";
    srcs = ["examples/common/Structure/PolicySubsystem-no-strategy.xml"];
};

common_types_structure_template = filegroup {
    name = "common_types_structure_template";
    srcs = ["examples/common/Structure/PolicySubsystem-CommonTypes.xml.in"];
};

PolicyClass = filegroup {
    name = "PolicyClass";
    srcs = ["examples/common/Structure/PolicyClass.xml"];
};

"volumes.pfw" = filegroup {
    name = "volumes.pfw";
    srcs = ["examples/Settings/volumes.pfw"];
};

"device_for_input_source.pfw" = filegroup {
    name = "device_for_input_source.pfw";
    srcs = ["examples/Settings/device_for_input_source.pfw"];
};

"ParameterFrameworkConfigurationPolicy.userdebug.xml" = filegroup {
    name = "ParameterFrameworkConfigurationPolicy.userdebug.xml";
    srcs = ["examples/ParameterFrameworkConfigurationPolicy.userdebug.xml"];
};

"ParameterFrameworkConfigurationPolicy.user.xml" = filegroup {
    name = "ParameterFrameworkConfigurationPolicy.user.xml";
    srcs = ["examples/ParameterFrameworkConfigurationPolicy.user.xml"];
};

in { inherit "ParameterFrameworkConfigurationPolicy.user.xml" "ParameterFrameworkConfigurationPolicy.userdebug.xml" "PolicyClass.xml" "PolicySubsystem-CommonTypes.xml" "PolicySubsystem.xml" "device_for_input_source.pfw" "volumes.pfw" PolicyClass PolicySubsystem PolicySubsystem-no-strategy buildcommontypesstructure_gen common_types_structure_template product_strategies_structure_template; }
