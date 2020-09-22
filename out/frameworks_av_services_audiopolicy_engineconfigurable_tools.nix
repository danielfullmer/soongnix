{ genrule_defaults, python_binary_host, python_defaults }:
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
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

# ##################################################################################################
#  Tools for audio policy engine criterion type configuration file
#
"buildPolicyCriterionTypes.py" = python_binary_host {
    name = "buildPolicyCriterionTypes.py";
    main = "buildPolicyCriterionTypes.py";
    srcs = [
        "buildPolicyCriterionTypes.py"
    ];
    defaults = ["tools_default"];
};

buildpolicycriteriontypesrule = genrule_defaults {
    name = "buildpolicycriteriontypesrule";
    tools = ["buildPolicyCriterionTypes.py"];
    cmd = "cp $(locations :audio_policy_configuration_files) $(genDir)/. && " +
        "cp $(location :audio_policy_configuration_top_file) $(genDir)/audio_policy_configuration.xml && " +
        "$(location buildPolicyCriterionTypes.py) " +
        #  @todo update if 1428659 is merged "--androidaudiobaseheader $(location :android_audio_base_header_file) " +
        " --androidaudiobaseheader system/media/audio/include/system/audio-base.h " +
        "--audiopolicyconfigurationfile $(genDir)/audio_policy_configuration.xml " +
        "--criteriontypes $(location :audio_policy_engine_criterion_types_template) " +
        "--outputfile $(out)";
    srcs = [
        #  The commented inputs must be provided to use this genrule_defaults
        #  @todo uncomment if 1428659 is merged":android_audio_base_header_file",
        ":audio_policy_engine_criterion_types_template"
        #  ":audio_policy_configuration_top_file",
        #  ":audio_policy_configuration_files",
    ];
    out = ["audio_policy_engine_criterion_types.xml"];
};

# ##################################################################################################
#  Tools for audio policy engine parameter framework configurable domains
#
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

domaingeneratorpolicyrule = genrule_defaults {
    name = "domaingeneratorpolicyrule";
    tools = [
        "domainGeneratorPolicy.py"
        "domainGeneratorConnector"
    ];
    cmd = "mkdir -p $(genDir)/Structure/Policy && " +
        "cp $(locations :audio_policy_pfw_structure_files) $(genDir)/Structure/Policy && " +
        "cp $(location :audio_policy_pfw_toplevel) $(genDir)/top_level && " +
        "$(location domainGeneratorPolicy.py) " +
        "--validate " +
        "--domain-generator-tool $(location domainGeneratorConnector) " +
        "--toplevel-config $(genDir)/top_level " +
        "--criteria $(location :audio_policy_engine_criteria) " +
        "--criteriontypes $(location :audio_policy_engine_criterion_types) " +
        "--add-edds $(locations :edd_files) " +
        "--schemas-dir external/parameter-framework/upstream/schemas " +
        " > $(out)";
    srcs = [
        #  The commented inputs must be provided to use this genrule_defaults
        #  ":audio_policy_pfw_toplevel",
        #  ":audio_policy_pfw_structure_files",
        ":audio_policy_engine_criteria"
        #  ":audio_policy_engine_criterion_types",
        #  ":edd_files",
    ];
    out = ["PolicyConfigurableDomains.xml"];
};

# ##################################################################################################
#  Tools for policy parameter-framework product strategies structure file generation
#
"buildStrategiesStructureFile.py" = python_binary_host {
    name = "buildStrategiesStructureFile.py";
    main = "buildStrategiesStructureFile.py";
    srcs = [
        "buildStrategiesStructureFile.py"
    ];
    defaults = ["tools_default"];
};

buildstrategiesstructurerule = genrule_defaults {
    name = "buildstrategiesstructurerule";
    tools = ["buildStrategiesStructureFile.py"];
    cmd = "cp $(locations :audio_policy_engine_configuration_files) $(genDir) && ls -l $(genDir) &&" +
        "$(location buildStrategiesStructureFile.py) " +
        "--audiopolicyengineconfigurationfile $(genDir)/audio_policy_engine_configuration.xml " +
        "--productstrategiesstructurefile $(location :product_strategies_structure_template) " +
        "--outputfile $(out)";
    srcs = [
        #  The commented inputs must be provided to use this genrule_defaults
        #  ":audio_policy_engine_configuration_files",
        ":product_strategies_structure_template"
    ];
    out = ["ProductStrategies.xml"];
};

# ##################################################################################################
#  Tools for policy parameter-framework common type structure file generation
#
"buildCommonTypesStructureFile.py" = python_binary_host {
    name = "buildCommonTypesStructureFile.py";
    main = "buildCommonTypesStructureFile.py";
    srcs = [
        "buildCommonTypesStructureFile.py"
    ];
    defaults = ["tools_default"];
};

buildcommontypesstructurerule = genrule_defaults {
    name = "buildcommontypesstructurerule";
    tools = ["buildCommonTypesStructureFile.py"];
    cmd = "$(location buildCommonTypesStructureFile.py) " +
        "--androidaudiobaseheader $(location :libaudio_system_audio_base) " +
        "--commontypesstructure $(location :common_types_structure_template) " +
        "--outputfile $(out)";
    srcs = [
        ":common_types_structure_template"
        ":libaudio_system_audio_base"
    ];
    out = ["PolicySubsystem-CommonTypes.xml"];
};

in { inherit "buildCommonTypesStructureFile.py" "buildPolicyCriterionTypes.py" "buildStrategiesStructureFile.py" "domainGeneratorPolicy.py" buildcommontypesstructurerule buildpolicycriteriontypesrule buildstrategiesstructurerule domaingeneratorpolicyrule tools_default; }
