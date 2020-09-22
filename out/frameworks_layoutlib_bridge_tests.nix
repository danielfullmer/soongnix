{ java_test_host }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

layoutlib-tests = java_test_host {
    name = "layoutlib-tests";

    #  Only compile source java files in this lib.
    srcs = [
        "src/android/content/res/Resources_DelegateTest.java"
        "src/android/graphics/Color_DelegateTest.java"
        "src/android/graphics/Matrix_DelegateTest.java"
        "src/android/util/BridgeXmlPullAttributesTest.java"
        "src/android/util/imagepool/ImagePoolHelperTest.java"
        "src/android/util/imagepool/ImagePoolImplTest.java"
        "src/com/android/ide/common/resources/deprecated/FrameworkResources.java"
        "src/com/android/ide/common/resources/deprecated/IdGeneratingResourceFile.java"
        "src/com/android/ide/common/resources/deprecated/IdResourceParser.java"
        "src/com/android/ide/common/resources/deprecated/MultiResourceFile.java"
        "src/com/android/ide/common/resources/deprecated/ResourceDeltaKind.java"
        "src/com/android/ide/common/resources/deprecated/ResourceFile.java"
        "src/com/android/ide/common/resources/deprecated/ResourceFolder.java"
        "src/com/android/ide/common/resources/deprecated/ResourceItem.java"
        "src/com/android/ide/common/resources/deprecated/ResourceRepository.java"
        "src/com/android/ide/common/resources/deprecated/ScanningContext.java"
        "src/com/android/ide/common/resources/deprecated/SingleResourceFile.java"
        "src/com/android/ide/common/resources/deprecated/ValidatingResourceParser.java"
        "src/com/android/ide/common/resources/deprecated/ValueResourceParser.java"
        "src/com/android/layoutlib/bridge/BridgeRenderSessionTest.java"
        "src/com/android/layoutlib/bridge/TestDelegates.java"
        "src/com/android/layoutlib/bridge/android/BridgeContextTest.java"
        "src/com/android/layoutlib/bridge/android/BridgeXmlBlockParserTest.java"
        "src/com/android/layoutlib/bridge/impl/LayoutParserWrapperTest.java"
        "src/com/android/layoutlib/bridge/impl/RenderActionTestUtil.java"
        "src/com/android/layoutlib/bridge/impl/ResourceHelperTest.java"
        "src/com/android/layoutlib/bridge/intensive/HighQualityShadowsRenderTests.java"
        "src/com/android/layoutlib/bridge/intensive/Main.java"
        "src/com/android/layoutlib/bridge/intensive/PerformanceTests.java"
        "src/com/android/layoutlib/bridge/intensive/RenderResult.java"
        "src/com/android/layoutlib/bridge/intensive/RenderTestBase.java"
        "src/com/android/layoutlib/bridge/intensive/RenderTests.java"
        "src/com/android/layoutlib/bridge/intensive/setup/ConfigGenerator.java"
        "src/com/android/layoutlib/bridge/intensive/setup/LayoutLibTestCallback.java"
        "src/com/android/layoutlib/bridge/intensive/setup/LayoutPullParser.java"
        "src/com/android/layoutlib/bridge/intensive/util/ImageUtils.java"
        "src/com/android/layoutlib/bridge/intensive/util/ModuleClassLoader.java"
        "src/com/android/layoutlib/bridge/intensive/util/SessionParamsBuilder.java"
        "src/com/android/layoutlib/bridge/intensive/util/TestAssetRepository.java"
        "src/com/android/layoutlib/bridge/intensive/util/TestUtils.java"
        "src/com/android/layoutlib/bridge/intensive/util/perf/LongStatsCollector.java"
        "src/com/android/layoutlib/bridge/intensive/util/perf/PerformanceRunner.java"
        "src/com/android/layoutlib/bridge/intensive/util/perf/TimedStatement.java"
        "src/com/android/layoutlib/bridge/intensive/util/perf/TimedStatementResult.java"
        "src/com/android/layoutlib/bridge/test/widgets/ContentWidget.java"
        "src/com/android/layoutlib/bridge/test/widgets/HookWidget.java"
        "src/com/android/tools/idea/validator/LayoutValidatorTests.java"
        "src/com/android/tools/idea/validator/accessibility/AccessibilityValidatorTests.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/AssetView.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/CanvasTestView.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/CustomCalendar.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/CustomDate.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/InsetsWidget.java"
        "res/testApp/MyApplication/src/main/myapplication.widgets/package-info.java"
    ];
    java_resource_dirs = ["res"];

    libs = [
        "layoutlib"
        "kxml2-2.3.0"
        "layoutlib_api-prebuilt"
        "tools-common-prebuilt"
        "sdk-common"
        "junit"
        "guava"
        "mockito"
        "objenesis"
        "hamcrest"
        "trove-prebuilt"
    ];

    required = ["layoutlib"];

    #  Copy the jar to DIST_DIR for sdk builds
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
    };
};

in { inherit layoutlib-tests; }
