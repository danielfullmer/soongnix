{ cc_library_headers }:
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

in { inherit vulkan_headers; }
