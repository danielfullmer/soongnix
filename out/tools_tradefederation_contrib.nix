{ tradefed_java_library_host }:
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

tradefed-contrib = tradefed_java_library_host {
    name = "tradefed-contrib";
    defaults = ["tradefed_errorprone_defaults"];

    #  Only compile source java files in this lib.
    srcs = [
        "src/com/android/aetest/tradefed/targetprep/AeTestManagedProfileCreator.java"
        "src/com/android/build/tests/ImageStats.java"
        "src/com/android/build/tests/KernelImageCheck.java"
        "src/com/android/continuous/SmokeTest.java"
        "src/com/android/example/RebootTest.java"
        "src/com/android/fastboot/tests/FastbootTest.java"
        "src/com/android/graphics/tests/FlatlandTest.java"
        "src/com/android/graphics/tests/FlatlandTestFuncTest.java"
        "src/com/android/media/template/AudioTestHarnessTemplateTest.java"
        "src/com/android/media/tests/AdbScreenrecordTest.java"
        "src/com/android/media/tests/AudioJitterTest.java"
        "src/com/android/media/tests/AudioLevelUtility.java"
        "src/com/android/media/tests/AudioLoopbackImageAnalyzer.java"
        "src/com/android/media/tests/AudioLoopbackTest.java"
        "src/com/android/media/tests/AudioLoopbackTestHelper.java"
        "src/com/android/media/tests/Camera2FrameworkStressTest.java"
        "src/com/android/media/tests/Camera2LatencyTest.java"
        "src/com/android/media/tests/Camera2StressTest.java"
        "src/com/android/media/tests/CameraBurstStartupTest.java"
        "src/com/android/media/tests/CameraLatencyTest.java"
        "src/com/android/media/tests/CameraPerformanceTest.java"
        "src/com/android/media/tests/CameraSettingsTest.java"
        "src/com/android/media/tests/CameraShotLatencyTest.java"
        "src/com/android/media/tests/CameraShotToShotLatencyTest.java"
        "src/com/android/media/tests/CameraStartupTest.java"
        "src/com/android/media/tests/CameraStressTest.java"
        "src/com/android/media/tests/CameraTestBase.java"
        "src/com/android/media/tests/CameraTestMetricsCollectionListener.java"
        "src/com/android/media/tests/MediaMemoryTest.java"
        "src/com/android/media/tests/MediaPlayerStressTest.java"
        "src/com/android/media/tests/MediaStressTest.java"
        "src/com/android/media/tests/MediaTest.java"
        "src/com/android/media/tests/PanoramaBenchMarkTest.java"
        "src/com/android/media/tests/TestFailureException.java"
        "src/com/android/media/tests/TestRunHelper.java"
        "src/com/android/media/tests/VideoEditingMemoryTest.java"
        "src/com/android/media/tests/VideoEditingPerformanceTest.java"
        "src/com/android/media/tests/VideoMultimeterRunner.java"
        "src/com/android/media/tests/VideoMultimeterTest.java"
        "src/com/android/monkey/AnrReportGenerator.java"
        "src/com/android/monkey/AppPkgInjector.java"
        "src/com/android/monkey/ClockworkRetailMonkeyTest.java"
        "src/com/android/monkey/MonkeyBase.java"
        "src/com/android/monkey/MonkeyPairedBase.java"
        "src/com/android/performance/tests/AppIncrementalInstallTest.java"
        "src/com/android/performance/tests/AppInstallTest.java"
        "src/com/android/performance/tests/AppTransitionTests.java"
        "src/com/android/performance/tests/EmmcPerformanceTest.java"
        "src/com/android/performance/tests/HermeticLaunchTest.java"
        "src/com/android/performance/tests/HermeticMemoryTest.java"
        "src/com/android/performance/tests/SystemMemoryTest.java"
        "src/com/android/regression/tests/DetectRegression.java"
        "src/com/android/regression/tests/Metrics.java"
        "src/com/android/regression/tests/MetricsXmlParser.java"
        "src/com/android/scenario/AppSetup.java"
        "src/com/android/tradefed/HelloWorldMultiDevices.java"
        "src/com/android/tradefed/Sl4aBluetoothDiscovery.java"
        "src/com/android/tradefed/targetprep/AddWhitelistPackage.java"
        "src/com/android/tradefed/targetprep/ExampleTargetPreparer.java"
        "src/com/android/tradefed/targetprep/SetPackagesRecentlyUsed.java"
        "src/com/android/uicd/tests/UiConductorTest.java"
        "src/com/android/wireless/tests/RadioHelper.java"
        "src/com/android/wireless/tests/WifiStressTest.java"
    ];

    java_resource_dirs = ["res"];

    javacflags = [
        "-g"
        "-Xlint"
    ];

    libs = [
        "tradefed"
        "loganalysis"
        "tools-common-prebuilt"
    ];
};

in { inherit tradefed-contrib; }
