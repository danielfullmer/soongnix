{ java_import, java_library, java_library_host, java_test }:
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

# -------------------------------
#  build a target jar

junit-params = java_library {
    name = "junit-params";
    host_supported = true;
    hostdex = true;
    srcs = [
        "src/main/java/junitparams/FileParameters.java"
        "src/main/java/junitparams/JUnitParamsRunner.java"
        "src/main/java/junitparams/Parameters.java"
        "src/main/java/junitparams/converters/ConversionFailedException.java"
        "src/main/java/junitparams/converters/ConvertParam.java"
        "src/main/java/junitparams/converters/Converter.java"
        "src/main/java/junitparams/converters/Nullable.java"
        "src/main/java/junitparams/converters/NullableConverter.java"
        "src/main/java/junitparams/converters/Param.java"
        "src/main/java/junitparams/converters/ParamAnnotation.java"
        "src/main/java/junitparams/converters/ParamConverter.java"
        "src/main/java/junitparams/custom/CustomParameters.java"
        "src/main/java/junitparams/custom/FileParametersProvider.java"
        "src/main/java/junitparams/custom/ParametersProvider.java"
        "src/main/java/junitparams/custom/combined/Cartesian.java"
        "src/main/java/junitparams/custom/combined/CombinedParameters.java"
        "src/main/java/junitparams/custom/combined/CombinedParametersProvider.java"
        "src/main/java/junitparams/internal/DeferredErrorFrameworkMethod.java"
        "src/main/java/junitparams/internal/DescribableFrameworkMethod.java"
        "src/main/java/junitparams/internal/InstanceFrameworkMethod.java"
        "src/main/java/junitparams/internal/InvokableFrameworkMethod.java"
        "src/main/java/junitparams/internal/InvokeNonParameterisedMethod.java"
        "src/main/java/junitparams/internal/InvokeParameterisedMethod.java"
        "src/main/java/junitparams/internal/MethodBlockSupplier.java"
        "src/main/java/junitparams/internal/NonParameterisedFrameworkMethod.java"
        "src/main/java/junitparams/internal/ParameterisedFrameworkMethod.java"
        "src/main/java/junitparams/internal/TestMethod.java"
        "src/main/java/junitparams/internal/Utils.java"
        "src/main/java/junitparams/internal/annotation/CustomParametersDescriptor.java"
        "src/main/java/junitparams/internal/annotation/FrameworkMethodAnnotations.java"
        "src/main/java/junitparams/internal/parameters/ParametersFromCustomProvider.java"
        "src/main/java/junitparams/internal/parameters/ParametersFromExternalClassMethod.java"
        "src/main/java/junitparams/internal/parameters/ParametersFromExternalClassProvideMethod.java"
        "src/main/java/junitparams/internal/parameters/ParametersFromTestClassMethod.java"
        "src/main/java/junitparams/internal/parameters/ParametersFromValue.java"
        "src/main/java/junitparams/internal/parameters/ParametersReader.java"
        "src/main/java/junitparams/internal/parameters/ParametrizationStrategy.java"
        "src/main/java/junitparams/internal/parameters/ParamsFromMethodCommon.java"
        "src/main/java/junitparams/mappers/BufferedReaderDataMapper.java"
        "src/main/java/junitparams/mappers/CsvWithHeaderMapper.java"
        "src/main/java/junitparams/mappers/DataMapper.java"
        "src/main/java/junitparams/mappers/IdentityMapper.java"
        "src/main/java/junitparams/naming/MacroSubstitutionNamingStrategy.java"
        "src/main/java/junitparams/naming/TestCaseName.java"
        "src/main/java/junitparams/naming/TestCaseNamingStrategy.java"
    ];
    sdk_version = "core_current";
    static_libs = ["junit"];
};

#  compatibility host library with old name
junit-params-host = java_library_host {
    name = "junit-params-host";
    static_libs = ["junit-params"];
};

# -------------------------------
#  build test jars
#
#  Run the target test jar as follows:
#    vogar --classpath \
#      ${ANDROID_PRODUCT_OUT}/obj/JAVA_LIBRARIES/junit-params-test_intermediates/javalib.jar \
#      junitparams

junit-params-test = java_test {
    name = "junit-params-test";
    host_supported = true;
    srcs = [
        "src/test/java/junitparams/AssumptionsTest.java"
        "src/test/java/junitparams/BeforeAfterClassTest.java"
        "src/test/java/junitparams/CastingParamsTest.java"
        "src/test/java/junitparams/ClassesAsParamsTest.java"
        "src/test/java/junitparams/EnumsAsParamsTest.java"
        "src/test/java/junitparams/FileParamsTest.java"
        "src/test/java/junitparams/FilterableTest.java"
        "src/test/java/junitparams/IgnoringTest.java"
        "src/test/java/junitparams/InstantiatingTestClassOnceTest.java"
        "src/test/java/junitparams/IterableMethodTest.java"
        "src/test/java/junitparams/IteratorMethodTest.java"
        "src/test/java/junitparams/MethodAnnotationArgumentTest.java"
        "src/test/java/junitparams/MultipleParameterProvidersTest.java"
        "src/test/java/junitparams/NullValuesTest.java"
        "src/test/java/junitparams/ObjectStringificationTest.java"
        "src/test/java/junitparams/OverloadedTestMethodNameTest.java"
        "src/test/java/junitparams/ParametersForEnumTest.java"
        "src/test/java/junitparams/ParametersReaderForMethodTest.java"
        "src/test/java/junitparams/ParametersReaderProvidersTest.java"
        "src/test/java/junitparams/ParamsConverterTest.java"
        "src/test/java/junitparams/ParamsInAnnotationTest.java"
        "src/test/java/junitparams/RulesTest.java"
        "src/test/java/junitparams/SampleTestCase.java"
        "src/test/java/junitparams/SamplesOfUsageVerificationTest.java"
        "src/test/java/junitparams/SubclassTest.java"
        "src/test/java/junitparams/SuperclassTest.java"
        "src/test/java/junitparams/WrongArgumentsNumberTest.java"
        "src/test/java/junitparams/converters/NullableConverterTest.java"
        "src/test/java/junitparams/custom/CustomParametersProviderTest.java"
        "src/test/java/junitparams/custom/combined/CartesianTest.java"
        "src/test/java/junitparams/custom/combined/CombinedParametersProviderTest.java"
        "src/test/java/junitparams/internal/TestMethodTest.java"
        "src/test/java/junitparams/internal/UtilsTest.java"
        "src/test/java/junitparams/naming/MacroSubstitutionNamingStrategyTest.java"
        "src/test/java/junitparams/naming/NamingStrategyIsUsedByRunnerTest.java"
        "src/test/java/junitparams/usage/SamplesOfUsageTest.java"
        "src/test/java/junitparams/usage/person_example/PersonMapper.java"
        "src/test/java/junitparams/usage/person_example/PersonTest.java"
        "src/test/java/junitparams/usage/person_example/PersonType.java"
    ];
    java_resource_dirs = ["src/test/resources"];
    sdk_version = "core_current";
    static_libs = [
        "junit-params"
        "junit-params-assertj-core"
    ];
};

# -------------------------------
#  prebuilt dependencies

junit-params-assertj-core = java_import {
    name = "junit-params-assertj-core";
    jars = ["lib/assertj-core-1.7.1.jar"];
    host_supported = true;
};

in { inherit junit-params junit-params-assertj-core junit-params-host junit-params-test; }
