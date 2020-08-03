{ cc_library_shared }:
let

#  Copyright 2014 The Android Open Source Project
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

libimg_utils = cc_library_shared {
    name = "libimg_utils";

    srcs = [
        "src/EndianUtils.cpp"
        "src/FileInput.cpp"
        "src/FileOutput.cpp"
        "src/SortedEntryVector.cpp"
        "src/Input.cpp"
        "src/Output.cpp"
        "src/Orderable.cpp"
        "src/TiffIfd.cpp"
        "src/TiffWritable.cpp"
        "src/TiffWriter.cpp"
        "src/TiffEntry.cpp"
        "src/TiffEntryImpl.cpp"
        "src/ByteArrayOutput.cpp"
        "src/DngUtils.cpp"
        "src/StripSource.cpp"
    ];

    shared_libs = [
        "liblog"
        "libutils"
        "libcutils"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fvisibility=hidden"
    ];

    product_variables = {
        debuggable = {
            #  Enable assert() in eng builds
            cflags = [
                "-UNDEBUG"
                "-DLOG_NDEBUG=1"
            ];
        };
    };

    export_include_dirs = ["include"];
};

in { inherit libimg_utils; }
