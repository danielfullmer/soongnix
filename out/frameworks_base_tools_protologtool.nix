{ java_binary_host, java_library_host, java_test_host }:
let

protologtool-lib = java_library_host {
    name = "protologtool-lib";
    srcs = [
        "src/com/android/protolog/tool/CodeUtils.kt"
        "src/com/android/protolog/tool/CommandOptions.kt"
        "src/com/android/protolog/tool/Constants.kt"
        "src/com/android/protolog/tool/LogGroup.kt"
        "src/com/android/protolog/tool/LogLevel.kt"
        "src/com/android/protolog/tool/LogParser.kt"
        "src/com/android/protolog/tool/ParsingContext.kt"
        "src/com/android/protolog/tool/ProtoLogCallProcessor.kt"
        "src/com/android/protolog/tool/ProtoLogCallVisitor.kt"
        "src/com/android/protolog/tool/ProtoLogGroupReader.kt"
        "src/com/android/protolog/tool/ProtoLogTool.kt"
        "src/com/android/protolog/tool/SourceTransformer.kt"
        "src/com/android/protolog/tool/ViewerConfigBuilder.kt"
        "src/com/android/protolog/tool/ViewerConfigParser.kt"
        "src/com/android/protolog/tool/exceptions.kt"
    ];
    static_libs = [
        "protolog-common"
        "javaparser"
        "platformprotos"
        "jsonlib"
    ];
};

protologtool = java_binary_host {
    name = "protologtool";
    manifest = "manifest.txt";
    static_libs = [
        "protologtool-lib"
    ];
};

protologtool-tests = java_test_host {
    name = "protologtool-tests";
    test_suites = ["general-tests"];
    srcs = [
        "tests/com/android/protolog/tool/CodeUtilsTest.kt"
        "tests/com/android/protolog/tool/CommandOptionsTest.kt"
        "tests/com/android/protolog/tool/EndToEndTest.kt"
        "tests/com/android/protolog/tool/LogParserTest.kt"
        "tests/com/android/protolog/tool/ProtoLogCallProcessorTest.kt"
        "tests/com/android/protolog/tool/ProtoLogToolTest.kt"
        "tests/com/android/protolog/tool/SourceTransformerTest.kt"
        "tests/com/android/protolog/tool/ViewerConfigBuilderTest.kt"
        "tests/com/android/protolog/tool/ViewerConfigParserTest.kt"
    ];
    static_libs = [
        "protologtool-lib"
        "junit"
        "mockito"
    ];
};

in { inherit protologtool protologtool-lib protologtool-tests; }
