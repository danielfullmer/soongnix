{ java_library_static }:
let

#  Copyright (C) 2016 The Android Open Source Project
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
#

#
#  Build support for jcommander within the Android Open Source Project
#  See https://source.android.com/source/building.html for more information
#

jcommander = java_library_static {
    name = "jcommander";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";

    srcs = [
        "src/main/java/com/beust/jcommander/DynamicParameter.java"
        "src/main/java/com/beust/jcommander/FuzzyMap.java"
        "src/main/java/com/beust/jcommander/IDefaultProvider.java"
        "src/main/java/com/beust/jcommander/IParameterValidator.java"
        "src/main/java/com/beust/jcommander/IParameterValidator2.java"
        "src/main/java/com/beust/jcommander/IStringConverter.java"
        "src/main/java/com/beust/jcommander/IStringConverterFactory.java"
        "src/main/java/com/beust/jcommander/IValueValidator.java"
        "src/main/java/com/beust/jcommander/IVariableArity.java"
        "src/main/java/com/beust/jcommander/JCommander.java"
        "src/main/java/com/beust/jcommander/MissingCommandException.java"
        "src/main/java/com/beust/jcommander/Parameter.java"
        "src/main/java/com/beust/jcommander/ParameterDescription.java"
        "src/main/java/com/beust/jcommander/ParameterException.java"
        "src/main/java/com/beust/jcommander/Parameterized.java"
        "src/main/java/com/beust/jcommander/Parameters.java"
        "src/main/java/com/beust/jcommander/ParametersDelegate.java"
        "src/main/java/com/beust/jcommander/ResourceBundle.java"
        "src/main/java/com/beust/jcommander/StringKey.java"
        "src/main/java/com/beust/jcommander/Strings.java"
        "src/main/java/com/beust/jcommander/WrappedParameter.java"
        "src/main/java/com/beust/jcommander/converters/BaseConverter.java"
        "src/main/java/com/beust/jcommander/converters/BigDecimalConverter.java"
        "src/main/java/com/beust/jcommander/converters/BooleanConverter.java"
        "src/main/java/com/beust/jcommander/converters/CommaParameterSplitter.java"
        "src/main/java/com/beust/jcommander/converters/DoubleConverter.java"
        "src/main/java/com/beust/jcommander/converters/FileConverter.java"
        "src/main/java/com/beust/jcommander/converters/FloatConverter.java"
        "src/main/java/com/beust/jcommander/converters/IParameterSplitter.java"
        "src/main/java/com/beust/jcommander/converters/ISO8601DateConverter.java"
        "src/main/java/com/beust/jcommander/converters/IntegerConverter.java"
        "src/main/java/com/beust/jcommander/converters/LongConverter.java"
        "src/main/java/com/beust/jcommander/converters/NoConverter.java"
        "src/main/java/com/beust/jcommander/converters/PathConverter.java"
        "src/main/java/com/beust/jcommander/converters/StringConverter.java"
        "src/main/java/com/beust/jcommander/converters/URIConverter.java"
        "src/main/java/com/beust/jcommander/converters/URLConverter.java"
        "src/main/java/com/beust/jcommander/defaultprovider/PropertyFileDefaultProvider.java"
        "src/main/java/com/beust/jcommander/internal/Console.java"
        "src/main/java/com/beust/jcommander/internal/DefaultConsole.java"
        "src/main/java/com/beust/jcommander/internal/DefaultConverterFactory.java"
        "src/main/java/com/beust/jcommander/internal/JDK6Console.java"
        "src/main/java/com/beust/jcommander/internal/Lists.java"
        "src/main/java/com/beust/jcommander/internal/Maps.java"
        "src/main/java/com/beust/jcommander/internal/Nullable.java"
        "src/main/java/com/beust/jcommander/internal/Sets.java"
        "src/main/java/com/beust/jcommander/validators/NoValidator.java"
        "src/main/java/com/beust/jcommander/validators/NoValueValidator.java"
        "src/main/java/com/beust/jcommander/validators/PositiveInteger.java"
    ];
    target = {
        android = {
            #  Filter out PathConverter since android is missing java.nio.file APIs.
            exclude_srcs = ["src/main/**/PathConverter.java"];
        };
    };

    errorprone = {
        javacflags = [
            "-Xep:CollectionIncompatibleType:WARN" #  b/74215153
        ];
    };
};

in { inherit jcommander; }
