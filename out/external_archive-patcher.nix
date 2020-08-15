{ java_library }:
let

#
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

archive-patcher = java_library {
    name = "archive-patcher";
    hostdex = true;
    srcs = [
        "shared/src/main/java/com/google/archivepatcher/shared/ByteArrayInputStreamFactory.java"
        "shared/src/main/java/com/google/archivepatcher/shared/Compressor.java"
        "shared/src/main/java/com/google/archivepatcher/shared/CountingOutputStream.java"
        "shared/src/main/java/com/google/archivepatcher/shared/DefaultDeflateCompatibilityWindow.java"
        "shared/src/main/java/com/google/archivepatcher/shared/DeflateCompressor.java"
        "shared/src/main/java/com/google/archivepatcher/shared/DeflateUncompressor.java"
        "shared/src/main/java/com/google/archivepatcher/shared/DeltaFriendlyFile.java"
        "shared/src/main/java/com/google/archivepatcher/shared/JreDeflateParameters.java"
        "shared/src/main/java/com/google/archivepatcher/shared/MultiViewInputStreamFactory.java"
        "shared/src/main/java/com/google/archivepatcher/shared/PartiallyUncompressingPipe.java"
        "shared/src/main/java/com/google/archivepatcher/shared/PatchConstants.java"
        "shared/src/main/java/com/google/archivepatcher/shared/RandomAccessFileInputStream.java"
        "shared/src/main/java/com/google/archivepatcher/shared/RandomAccessFileInputStreamFactory.java"
        "shared/src/main/java/com/google/archivepatcher/shared/RandomAccessFileOutputStream.java"
        "shared/src/main/java/com/google/archivepatcher/shared/TypedRange.java"
        "shared/src/main/java/com/google/archivepatcher/shared/Uncompressor.java"
        "applier/src/main/java/com/google/archivepatcher/applier/DeltaApplier.java"
        "applier/src/main/java/com/google/archivepatcher/applier/DeltaDescriptor.java"
        "applier/src/main/java/com/google/archivepatcher/applier/FileByFileV1DeltaApplier.java"
        "applier/src/main/java/com/google/archivepatcher/applier/LimitedInputStream.java"
        "applier/src/main/java/com/google/archivepatcher/applier/PartiallyCompressingOutputStream.java"
        "applier/src/main/java/com/google/archivepatcher/applier/PatchApplyPlan.java"
        "applier/src/main/java/com/google/archivepatcher/applier/PatchFormatException.java"
        "applier/src/main/java/com/google/archivepatcher/applier/PatchReader.java"
        "applier/src/main/java/com/google/archivepatcher/applier/bsdiff/BsDiffDeltaApplier.java"
        "applier/src/main/java/com/google/archivepatcher/applier/bsdiff/BsPatch.java"
        "applier/src/main/java/com/google/archivepatcher/applier/gdiff/Gdiff.java"
    ];
    sdk_version = "core_current";
    java_version = "1.6";
};

in { inherit archive-patcher; }
