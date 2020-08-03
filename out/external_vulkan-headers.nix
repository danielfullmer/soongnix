{ cc_library_headers, llndk_headers, ndk_headers }:
let

#  Copyright 2019 The Android Open Source Project
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

#  This module defines which headers are included in the NDK sysroot during
#  the NDK build process.
ndk_vulkan_headers = ndk_headers {
    name = "ndk_vulkan_headers";
    from = "include";
    to = "";
    srcs = [
        "include/vulkan/vk_platform.h"
        "include/vulkan/vulkan.h"
        "include/vulkan/vulkan_core.h"
        "include/vulkan/vulkan_android.h"
    ];
    license = "NOTICE";
};

#  This module makes Vulkan headers available to other modules without
#  having to link against libvulkan.so, e.g. for the Vulkan loader and
#  drivers, or things that dlopen libvulkan.so. It's available to system
#  modules, as part of the VNDK, and to unbundled modules.
vulkan_headers = cc_library_headers {
    name = "vulkan_headers";
    export_include_dirs = ["include"];
    vendor_available = true;
    sdk_version = "24";
};

#  This module makes Vulkan headers available to vendor code that is
#  restricted to LLNDK dependencies.
vulkan_headers_llndk = llndk_headers {
    name = "vulkan_headers_llndk";
    export_include_dirs = ["include"];
};

in { inherit ndk_vulkan_headers vulkan_headers vulkan_headers_llndk; }
