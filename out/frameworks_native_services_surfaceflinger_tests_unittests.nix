{ cc_test }:
let

#  Copyright 2018 The Android Open Source Project
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

libsurfaceflinger_unittest = cc_test {
    name = "libsurfaceflinger_unittest";
    defaults = ["libsurfaceflinger_defaults"];
    test_suites = ["device-tests"];
    sanitize = {
        #  Using the address sanitizer not only helps uncover issues in the code
        #  covered by the tests, but also covers some of the tricky injection of
        #  fakes the unit tests currently do.
        #
        #  Note: If you get an runtime link error like:
        #
        #    CANNOT LINK EXECUTABLE "/data/local/tmp/libsurfaceflinger_unittest": library "libclang_rt.asan-aarch64-android.so" not found
        #
        #  it is because the address sanitizer shared objects are not installed
        #  by default in the system image.
        #
        #  You can either "make dist tests" before flashing, or set this
        #  option to false temporarily.
        address = true;
    };
    srcs = [
        ":libsurfaceflinger_sources"
        "libsurfaceflinger_unittest_main.cpp"
        "CachingTest.cpp"
        "CompositionTest.cpp"
        "DispSyncSourceTest.cpp"
        "DisplayIdentificationTest.cpp"
        "DisplayTransactionTest.cpp"
        "EventControlThreadTest.cpp"
        "EventThreadTest.cpp"
        "IdleTimerTest.cpp"
        "LayerHistoryTest.cpp"
        "LayerMetadataTest.cpp"
        "SchedulerTest.cpp"
        "SchedulerUtilsTest.cpp"
        "RefreshRateConfigsTest.cpp"
        "RefreshRateStatsTest.cpp"
        "RegionSamplingTest.cpp"
        "TimeStatsTest.cpp"
        "mock/DisplayHardware/MockComposer.cpp"
        "mock/DisplayHardware/MockDisplay.cpp"
        "mock/DisplayHardware/MockPowerAdvisor.cpp"
        "mock/gui/MockGraphicBufferConsumer.cpp"
        "mock/gui/MockGraphicBufferProducer.cpp"
        "mock/MockDispSync.cpp"
        "mock/MockEventControlThread.cpp"
        "mock/MockEventThread.cpp"
        "mock/MockMessageQueue.cpp"
        "mock/MockNativeWindowSurface.cpp"
        "mock/MockSurfaceInterceptor.cpp"
        "mock/MockTimeStats.cpp"
        "mock/system/window/MockNativeWindow.cpp"
    ];
    static_libs = [
        "libgmock"
        "libcompositionengine"
        "libcompositionengine_mocks"
        "librenderengine_mocks"
    ];
    header_libs = [
        "libsurfaceflinger_headers"
    ];
};

in { inherit libsurfaceflinger_unittest; }
