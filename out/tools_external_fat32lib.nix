{ java_library_host }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

#  Build a host-side library
fat32lib = java_library_host {
    name = "fat32lib";
    srcs = [
        "src/main/java/de/waldheinz/fs/AbstractFileSystem.java"
        "src/main/java/de/waldheinz/fs/AbstractFsObject.java"
        "src/main/java/de/waldheinz/fs/BlockDevice.java"
        "src/main/java/de/waldheinz/fs/FileSystem.java"
        "src/main/java/de/waldheinz/fs/FileSystemFactory.java"
        "src/main/java/de/waldheinz/fs/FsDirectory.java"
        "src/main/java/de/waldheinz/fs/FsDirectoryEntry.java"
        "src/main/java/de/waldheinz/fs/FsFile.java"
        "src/main/java/de/waldheinz/fs/FsObject.java"
        "src/main/java/de/waldheinz/fs/ReadOnlyException.java"
        "src/main/java/de/waldheinz/fs/UnknownFileSystemException.java"
        "src/main/java/de/waldheinz/fs/package-info.java"
        "src/main/java/de/waldheinz/fs/fat/AbstractDirectory.java"
        "src/main/java/de/waldheinz/fs/fat/BootSector.java"
        "src/main/java/de/waldheinz/fs/fat/ClusterChain.java"
        "src/main/java/de/waldheinz/fs/fat/ClusterChainDirectory.java"
        "src/main/java/de/waldheinz/fs/fat/DirectoryFullException.java"
        "src/main/java/de/waldheinz/fs/fat/DosUtils.java"
        "src/main/java/de/waldheinz/fs/fat/Dummy83BufferGenerator.java"
        "src/main/java/de/waldheinz/fs/fat/Fat.java"
        "src/main/java/de/waldheinz/fs/fat/Fat16BootSector.java"
        "src/main/java/de/waldheinz/fs/fat/Fat16RootDirectory.java"
        "src/main/java/de/waldheinz/fs/fat/Fat32BootSector.java"
        "src/main/java/de/waldheinz/fs/fat/FatDirectoryEntry.java"
        "src/main/java/de/waldheinz/fs/fat/FatFile.java"
        "src/main/java/de/waldheinz/fs/fat/FatFileSystem.java"
        "src/main/java/de/waldheinz/fs/fat/FatLfnDirectory.java"
        "src/main/java/de/waldheinz/fs/fat/FatLfnDirectoryEntry.java"
        "src/main/java/de/waldheinz/fs/fat/FatType.java"
        "src/main/java/de/waldheinz/fs/fat/FatUtils.java"
        "src/main/java/de/waldheinz/fs/fat/FsInfoSector.java"
        "src/main/java/de/waldheinz/fs/fat/LittleEndian.java"
        "src/main/java/de/waldheinz/fs/fat/Sector.java"
        "src/main/java/de/waldheinz/fs/fat/ShortName.java"
        "src/main/java/de/waldheinz/fs/fat/SuperFloppyFormatter.java"
        "src/main/java/de/waldheinz/fs/fat/package-info.java"
        "src/main/java/de/waldheinz/fs/util/FileDisk.java"
        "src/main/java/de/waldheinz/fs/util/RamDisk.java"
        "src/main/java/de/waldheinz/fs/util/package-info.java"
    ];
};

in { inherit fat32lib; }
