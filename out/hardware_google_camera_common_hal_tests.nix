{ cc_library_headers, cc_library_shared, cc_test }:
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

libgoogle_camera_hal_tests_headers = cc_library_headers {
    name = "libgoogle_camera_hal_tests_headers";
    vendor_available = true;
    export_include_dirs = [
        "."
    ];
};

libgoogle_camera_hal_tests = cc_library_shared {
    name = "libgoogle_camera_hal_tests";
    defaults = ["google_camera_hal_defaults"];
    owner = "google";
    vendor_available = true;
    srcs = [
        "camera_device_session_tests.cc"
        "camera_device_tests.cc"
        "camera_id_manager_tests.cc"
        "camera_provider_tests.cc"
        "gralloc_buffer_allocator_tests.cc"
        "hal_camera_metadata_tests.cc"
        "hwl_buffer_allocator_tests.cc"
        "internal_stream_manager_tests.cc"
        "mock_device_session_hwl.cc"
        "pipeline_request_id_manager_tests.cc"
        "process_block_tests.cc"
        "request_processor_tests.cc"
        "result_dispatcher_tests.cc"
        "result_processor_tests.cc"
        "stream_buffer_cache_manager_tests.cc"
        "test_utils.cc"
        "vendor_tag_tests.cc"
        "zsl_buffer_manager_tests.cc"
    ];
    shared_libs = [
        "android.hardware.camera.provider@2.4"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.graphics.mapper@4.0"
        "libcamera_metadata"
        "libcutils"
        "libgooglecamerahal"
        "libgooglecamerahalutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libgmock"
        "libgtest"
    ];
    header_libs = [
        "libhardware_headers"
    ];
    export_include_dirs = ["."];
};

google_camera_hal_tests = cc_test {
    name = "google_camera_hal_tests";
    owner = "google";
    vendor = true;
    gtest = true;
    srcs = [
        "google_camera_hal_tests.cc"
    ];
    shared_libs = [
        "libgoogle_camera_hal_tests"
        "liblog"
        "libutils"
    ];
    local_include_dirs = ["."];
};

in { inherit google_camera_hal_tests libgoogle_camera_hal_tests libgoogle_camera_hal_tests_headers; }
