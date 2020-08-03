{ cc_binary, cc_binary_host, cc_defaults, cc_library_shared, cc_library_static, cc_prebuilt_binary, filegroup, prebuilt_etc_host, python_binary_host, python_library_host }:
let

#  Copyright (c) 2016, Intel Corporation
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without modification,
#  are permitted provided that the following conditions are met:
#
#  1. Redistributions of source code must retain the above copyright notice, this
#  list of conditions and the following disclaimer.
#
#  2. Redistributions in binary form must reproduce the above copyright notice,
#  this list of conditions and the following disclaimer in the documentation and/or
#  other materials provided with the distribution.
#
#  3. Neither the name of the copyright holder nor the names of its contributors
#  may be used to endorse or promote products derived from this software without
#  specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
#  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
#  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

pfw_defaults = cc_defaults {
    name = "pfw_defaults";
    host_supported = true;
    vendor_available = true;

    cflags = [
        "-frtti"
        "-fexceptions"
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    rtti = true;
};

libpfw_utility = cc_library_static {
    name = "libpfw_utility";
    defaults = ["pfw_defaults"];
    host_supported = true;
    vendor_available = true;

    export_include_dirs = ["upstream/utility"];

    srcs = [
        "upstream/utility/DynamicLibrary.cpp"
        "upstream/utility/posix/DynamicLibrary.cpp"
        "upstream/utility/Tokenizer.cpp"
        "upstream/utility/Utility.cpp"
    ];
};

libremote-processor-defaults = cc_defaults {
    name = "libremote-processor-defaults";
    defaults = ["pfw_defaults"];

    cflags = ["-Wno-implicit-fallthrough"];
    export_include_dirs = [
        "upstream/remote-processor"
        "support/android/remote-processor"
    ];

    srcs = [
        "upstream/remote-processor/RequestMessage.cpp"
        "upstream/remote-processor/Message.cpp"
        "upstream/remote-processor/AnswerMessage.cpp"
        "upstream/remote-processor/RemoteProcessorServer.cpp"
        "upstream/remote-processor/BackgroundRemoteProcessorServer.cpp"
    ];
    static_libs = ["libpfw_utility"];
};

libremote-processor = cc_library_shared {
    name = "libremote-processor";
    defaults = ["libremote-processor-defaults"];

    local_include_dirs = [
        "asio/include"
        "support/android/asio"
    ];
    cflags = ["-Wno-unused-local-typedef"];
};

libparameter-defaults = cc_defaults {
    name = "libparameter-defaults";
    defaults = ["pfw_defaults"];
    vendor_available = true;

    cppflags = [
        "-Wno-instantiation-after-specialization"
        "-Wno-implicit-fallthrough"
    ];
    export_include_dirs = [
        "upstream/parameter"
        "upstream/parameter/log/include"
        "upstream/parameter/include"
        "upstream/xmlserializer"
        "upstream/remote-processor"
        "support/android/parameter"
    ];
    shared_libs = [
        "libxml2"
    ];
    static_libs = [
        "libpfw_utility"
    ];

    srcs = [
        "upstream/parameter/ParameterMgrPlatformConnector.cpp"
        "upstream/parameter/LoggingElementBuilderTemplate.cpp"
        "upstream/parameter/StringParameterType.cpp"
        "upstream/parameter/SyncerSet.cpp"
        "upstream/parameter/BitParameter.cpp"
        "upstream/parameter/BaseParameter.cpp"
        "upstream/parameter/ParameterBlockType.cpp"
        "upstream/parameter/FloatingPointParameterType.cpp"
        "upstream/parameter/SelectionCriteriaDefinition.cpp"
        "upstream/parameter/EnumValuePair.cpp"
        "upstream/parameter/SelectionCriteria.cpp"
        "upstream/parameter/SelectionCriterionRule.cpp"
        "upstream/parameter/AreaConfiguration.cpp"
        "upstream/parameter/BitParameterBlockType.cpp"
        "upstream/parameter/ConfigurationAccessContext.cpp"
        "upstream/parameter/BitwiseAreaConfiguration.cpp"
        "upstream/parameter/ArrayParameter.cpp"
        "upstream/parameter/ParameterBlackboard.cpp"
        "upstream/parameter/InstanceConfigurableElement.cpp"
        "upstream/parameter/LogarithmicParameterAdaptation.cpp"
        "upstream/parameter/ConfigurableDomain.cpp"
        "upstream/parameter/FormattedSubsystemObject.cpp"
        "upstream/parameter/MappingData.cpp"
        "upstream/parameter/SubsystemElementBuilder.cpp"
        "upstream/parameter/BooleanParameterType.cpp"
        "upstream/parameter/FixedPointParameterType.cpp"
        "upstream/parameter/ComponentType.cpp"
        "upstream/parameter/EnumParameterType.cpp"
        "upstream/parameter/RuleParser.cpp"
        "upstream/parameter/VirtualSubsystem.cpp"
        "upstream/parameter/Element.cpp"
        "upstream/parameter/ParameterFrameworkConfiguration.cpp"
        "upstream/parameter/SelectionCriterionLibrary.cpp"
        "upstream/parameter/StringParameter.cpp"
        "upstream/parameter/CompoundRule.cpp"
        "upstream/parameter/ConfigurableDomains.cpp"
        "upstream/parameter/VirtualSyncer.cpp"
        "upstream/parameter/MappingContext.cpp"
        "upstream/parameter/LinearParameterAdaptation.cpp"
        "upstream/parameter/ComponentLibrary.cpp"
        "upstream/parameter/BitParameterBlock.cpp"
        "upstream/parameter/ParameterMgrFullConnector.cpp"
        "upstream/parameter/ConfigurableElement.cpp"
        "upstream/parameter/ConfigurableElementAggregator.cpp"
        "upstream/parameter/SubsystemObject.cpp"
        "upstream/parameter/TypeElement.cpp"
        "upstream/parameter/PathNavigator.cpp"
        "upstream/parameter/ElementLocator.cpp"
        "upstream/parameter/SimulatedBackSynchronizer.cpp"
        "upstream/parameter/Parameter.cpp"
        "upstream/parameter/ComponentInstance.cpp"
        "upstream/parameter/InstanceDefinition.cpp"
        "upstream/parameter/SubsystemObjectCreator.cpp"
        "upstream/parameter/ParameterType.cpp"
        "upstream/parameter/DomainConfiguration.cpp"
        "upstream/parameter/PluginLocation.cpp"
        "upstream/parameter/HardwareBackSynchronizer.cpp"
        "upstream/parameter/SystemClass.cpp"
        "upstream/parameter/ElementLibrary.cpp"
        "upstream/parameter/ParameterAccessContext.cpp"
        "upstream/parameter/XmlParameterSerializingContext.cpp"
        "upstream/parameter/ElementHandle.cpp"
        "upstream/parameter/ParameterMgr.cpp"
        "upstream/parameter/SelectionCriterionType.cpp"
        "upstream/parameter/Subsystem.cpp"
        "upstream/parameter/BaseIntegerParameterType.cpp"
        "upstream/parameter/BitParameterType.cpp"
        "upstream/parameter/SelectionCriterion.cpp"
        "upstream/parameter/XmlElementSerializingContext.cpp"
        "upstream/parameter/ElementLibrarySet.cpp"
        "upstream/parameter/FrameworkConfigurationLocation.cpp"
        "upstream/parameter/ParameterAdaptation.cpp"
        "upstream/parameter/XmlFileIncluderElement.cpp"
        "upstream/xmlserializer/XmlElement.cpp"
        "upstream/xmlserializer/XmlSerializingContext.cpp"
        "upstream/xmlserializer/XmlMemoryDocSource.cpp"
        "upstream/xmlserializer/XmlDocSource.cpp"
        "upstream/xmlserializer/XmlMemoryDocSink.cpp"
        "upstream/xmlserializer/XmlStreamDocSink.cpp"
        "upstream/parameter/CommandHandlerWrapper.cpp"
    ];
};

libparameter = cc_library_shared {
    name = "libparameter";
    defaults = ["libparameter-defaults"];
    shared_libs = [
        "libremote-processor"
    ];
};

#  Userdebug only, should not be used in a user build device image.
test-platform = cc_binary {
    name = "test-platform";
    defaults = ["pfw_defaults"];

    local_include_dirs = [
        "upstream/test/test-platform"
        "support/android/asio"
        "asio/include"
    ];
    srcs = [
        "upstream/test/test-platform/main.cpp"
        "upstream/test/test-platform/TestPlatform.cpp"
    ];
    cflags = [
        "-Wno-unused-local-typedef"
        "-Wno-implicit-fallthrough"
    ];
    static_libs = ["libpfw_utility"];
    shared_libs = [
        "libparameter"
        "libremote-processor"
    ];
};

domainGeneratorConnector = cc_binary_host {
    name = "domainGeneratorConnector";
    defaults = ["pfw_defaults"];

    owner = "intel";
    static_libs = ["libpfw_utility"];
    shared_libs = ["libparameter"];
    srcs = ["upstream/tools/xmlGenerator/domainGeneratorConnector.cpp"];
};

#  Resources are not compiled so the prebuild mechanism is used to export them.
#  Schemas are only used by host, in order to validate xml files
# ////////////////////////////////////////////////

"ParameterFrameworkConfiguration.xsd" = prebuilt_etc_host {
    name = "ParameterFrameworkConfiguration.xsd";
    owner = "intel";
    src = "upstream/schemas/ParameterFrameworkConfiguration.xsd";
    sub_dir = "parameter-framework/Schemas";
};

"ConfigurableDomain.xsd" = prebuilt_etc_host {
    name = "ConfigurableDomain.xsd";
    owner = "intel";
    src = "upstream/schemas/ConfigurableDomain.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = ["ParameterSettings.xsd"];
};

"ConfigurableDomains.xsd" = prebuilt_etc_host {
    name = "ConfigurableDomains.xsd";
    owner = "intel";
    src = "upstream/schemas/ConfigurableDomains.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = ["ConfigurableDomain.xsd"];
};

"SystemClass.xsd" = prebuilt_etc_host {
    name = "SystemClass.xsd";
    owner = "intel";
    src = "upstream/schemas/SystemClass.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = [
        "FileIncluder.xsd"
        "Subsystem.xsd"
    ];
};

"ParameterSettings.xsd" = prebuilt_etc_host {
    name = "ParameterSettings.xsd";
    owner = "intel";
    src = "upstream/schemas/ParameterSettings.xsd";
    sub_dir = "parameter-framework/Schemas";
};

"FileIncluder.xsd" = prebuilt_etc_host {
    name = "FileIncluder.xsd";
    owner = "intel";
    src = "upstream/schemas/FileIncluder.xsd";
    sub_dir = "parameter-framework/Schemas";
};

"Subsystem.xsd" = prebuilt_etc_host {
    name = "Subsystem.xsd";
    owner = "intel";
    src = "upstream/schemas/Subsystem.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = ["ComponentLibrary.xsd"];
};

"ComponentLibrary.xsd" = prebuilt_etc_host {
    name = "ComponentLibrary.xsd";
    owner = "intel";
    src = "upstream/schemas/ComponentLibrary.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = [
        "ComponentTypeSet.xsd"
        "W3cXmlAttributes.xsd"
    ];
};

"ComponentTypeSet.xsd" = prebuilt_etc_host {
    name = "ComponentTypeSet.xsd";
    owner = "intel";
    src = "upstream/schemas/ComponentTypeSet.xsd";
    sub_dir = "parameter-framework/Schemas";
    required = [
        "Parameter.xsd"
        "W3cXmlAttributes.xsd"
    ];
};

"W3cXmlAttributes.xsd" = prebuilt_etc_host {
    name = "W3cXmlAttributes.xsd";
    owner = "intel";
    src = "upstream/schemas/W3cXmlAttributes.xsd";
    sub_dir = "parameter-framework/Schemas";
};

"Parameter.xsd" = prebuilt_etc_host {
    name = "Parameter.xsd";
    owner = "intel";
    src = "upstream/schemas/Parameter.xsd";
    sub_dir = "parameter-framework/Schemas";
};

"EddParser.py-srcs" = filegroup {
    name = "EddParser.py-srcs";
    srcs = ["upstream/tools/xmlGenerator/EddParser.py"];
    path = "upstream/tools/xmlGenerator/";
};

"EddParser.py" = python_library_host {
    name = "EddParser.py";
    defaults = ["pfw_defaults"];
    owner = "intel";

    srcs = [":EddParser.py-srcs"];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

"PfwBaseTranslator.py-srcs" = filegroup {
    name = "PfwBaseTranslator.py-srcs";
    srcs = ["upstream/tools/xmlGenerator/PfwBaseTranslator.py"];
    path = "upstream/tools/xmlGenerator/";
};

"PfwBaseTranslator.py" = python_library_host {
    name = "PfwBaseTranslator.py";
    defaults = ["pfw_defaults"];
    owner = "intel";

    srcs = [":PfwBaseTranslator.py-srcs"];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

"PFWScriptGenerator.py-srcs" = filegroup {
    name = "PFWScriptGenerator.py-srcs";
    srcs = ["upstream/tools/xmlGenerator/PFWScriptGenerator.py"];
    path = "upstream/tools/xmlGenerator/";
};

"PFWScriptGenerator.py" = python_library_host {
    name = "PFWScriptGenerator.py";
    defaults = ["pfw_defaults"];
    owner = "intel";

    srcs = [":PFWScriptGenerator.py-srcs"];
    libs = [
        "PfwBaseTranslator.py"
        "EddParser.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

"updateRoutageDomains.sh" = cc_prebuilt_binary {
    name = "updateRoutageDomains.sh";
    defaults = ["pfw_defaults"];
    owner = "intel";

    host_supported = true;
    srcs = ["upstream/tools/xmlGenerator/updateRoutageDomains.sh"];
};

"hostConfig.py-srcs" = filegroup {
    name = "hostConfig.py-srcs";
    srcs = ["upstream/tools/xmlGenerator/hostConfig.py"];
    path = "upstream/tools/xmlGenerator/";
};

"hostConfig.py" = python_library_host {
    name = "hostConfig.py";
    defaults = ["pfw_defaults"];
    owner = "intel";

    srcs = [":hostConfig.py-srcs"];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

"domainGenerator.py" = python_binary_host {
    name = "domainGenerator.py";
    defaults = ["pfw_defaults"];
    owner = "intel";

    main = "upstream/tools/xmlGenerator/domainGenerator.py";
    srcs = ["upstream/tools/xmlGenerator/domainGenerator.py"];
    libs = [
        "EddParser.py"
        "hostConfig.py"
        "PFWScriptGenerator.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
    required = [
        "domainGeneratorConnector"
    ];
};

"domainGenerator.sh" = cc_prebuilt_binary {
    name = "domainGenerator.sh";
    defaults = ["pfw_defaults"];
    owner = "intel";

    host_supported = true;
    srcs = ["upstream/tools/xmlGenerator/domainGenerator.sh"];
};

"lightRoutingUpdate.sh" = cc_prebuilt_binary {
    name = "lightRoutingUpdate.sh";
    defaults = ["pfw_defaults"];
    owner = "intel";

    host_supported = true;
    srcs = ["upstream/tools/xmlGenerator/lightRoutingUpdate.sh"];
};

# ////////////////////////////////////////////////

remote-process = cc_binary {
    name = "remote-process";
    defaults = ["pfw_defaults"];

    srcs = ["upstream/remote-process/main.cpp"];
    local_include_dirs = [
        "upstream/utility"
        "support/android/asio"
        "asio/include"
    ];
    cflags = ["-Wno-unused-local-typedef"];
    shared_libs = ["libremote-processor"];
};

in { inherit "ComponentLibrary.xsd" "ComponentTypeSet.xsd" "ConfigurableDomain.xsd" "ConfigurableDomains.xsd" "EddParser.py" "EddParser.py-srcs" "FileIncluder.xsd" "PFWScriptGenerator.py" "PFWScriptGenerator.py-srcs" "Parameter.xsd" "ParameterFrameworkConfiguration.xsd" "ParameterSettings.xsd" "PfwBaseTranslator.py" "PfwBaseTranslator.py-srcs" "Subsystem.xsd" "SystemClass.xsd" "W3cXmlAttributes.xsd" "domainGenerator.py" "domainGenerator.sh" "hostConfig.py" "hostConfig.py-srcs" "lightRoutingUpdate.sh" "updateRoutageDomains.sh" domainGeneratorConnector libparameter libparameter-defaults libpfw_utility libremote-processor libremote-processor-defaults pfw_defaults remote-process test-platform; }
