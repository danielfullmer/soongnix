{ java_library_host }:
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

tradefed-common-util = java_library_host {
    name = "tradefed-common-util";
    defaults = ["tradefed_defaults"];
    srcs = [
        "com/android/tradefed/build/BuildSerializedVersion.java"
        "com/android/tradefed/command/CommandInterrupter.java"
        "com/android/tradefed/command/FatalHostError.java"
        "com/android/tradefed/config/ConfigurationException.java"
        "com/android/tradefed/config/Option.java"
        "com/android/tradefed/config/OptionClass.java"
        "com/android/tradefed/config/OptionDef.java"
        "com/android/tradefed/config/OptionUpdateRule.java"
        "com/android/tradefed/log/LogUtil.java"
        "com/android/tradefed/result/ByteArrayInputStreamSource.java"
        "com/android/tradefed/result/FileInputStreamSource.java"
        "com/android/tradefed/result/InputStreamSource.java"
        "com/android/tradefed/result/LogDataType.java"
        "com/android/tradefed/testtype/Abi.java"
        "com/android/tradefed/testtype/IAbi.java"
        "com/android/tradefed/util/AbiUtils.java"
        "com/android/tradefed/util/ArrayUtil.java"
        "com/android/tradefed/util/ByteArrayList.java"
        "com/android/tradefed/util/ByteArrayUtil.java"
        "com/android/tradefed/util/CommandResult.java"
        "com/android/tradefed/util/CommandStatus.java"
        "com/android/tradefed/util/Email.java"
        "com/android/tradefed/util/FileUtil.java"
        "com/android/tradefed/util/IEmail.java"
        "com/android/tradefed/util/IRunUtil.java"
        "com/android/tradefed/util/MultiMap.java"
        "com/android/tradefed/util/ResourceUtil.java"
        "com/android/tradefed/util/RunInterruptedException.java"
        "com/android/tradefed/util/RunUtil.java"
        "com/android/tradefed/util/StreamUtil.java"
        "com/android/tradefed/util/TimeUtil.java"
        "com/android/tradefed/util/UniqueMultiMap.java"
        "com/android/tradefed/util/VersionParser.java"
        "com/android/tradefed/util/ZipUtil.java"
        "com/android/tradefed/util/ZipUtil2.java"
        "com/android/tradefed/util/net/HttpHelper.java"
        "com/android/tradefed/util/net/HttpMultipartPost.java"
        "com/android/tradefed/util/net/IHttpHelper.java"
        "com/android/tradefed/util/zip/CentralDirectoryInfo.java"
        "com/android/tradefed/util/zip/EndCentralDirectoryInfo.java"
        "com/android/tradefed/util/zip/LocalFileHeader.java"
        "com/android/tradefed/util/zip/MergedZipEntryCollection.java"
    ];
    static_libs = [
        "commons-compress-prebuilt"
    ];
    libs = [
        "ddmlib-prebuilt"
        "guava"
        "tradefed-protos"
        "devtools-annotations-prebuilt"
    ];
};

in { inherit tradefed-common-util; }
