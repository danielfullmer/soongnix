{ cc_library_host_static }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

libcts_audio_quality = cc_library_host_static {
    name = "libcts_audio_quality";
    srcs = [
        "src/Adb.cpp"
        "src/BuiltinProcessing.cpp"
        "src/ClientImpl.cpp"
        "src/ClientSocket.cpp"
        "src/FileUtil.cpp"
        "src/GenericFactory.cpp"
        "src/Log.cpp"
        "src/Report.cpp"
        "src/Semaphore.cpp"
        "src/Settings.cpp"
        "src/SignalProcessingImpl.cpp"
        "src/SimpleScriptExec.cpp"
        "src/StringUtil.cpp"
        "src/audio/AudioHardware.cpp"
        "src/audio/AudioLocal.cpp"
        "src/audio/AudioPlaybackLocal.cpp"
        "src/audio/AudioProtocol.cpp"
        "src/audio/AudioRecordingLocal.cpp"
        "src/audio/AudioRemote.cpp"
        "src/audio/AudioSignalFactory.cpp"
        "src/audio/Buffer.cpp"
        "src/audio/RemoteAudio.cpp"
        "src/task/ModelBuilder.cpp"
        "src/task/TaskAsync.cpp"
        "src/task/TaskBatch.cpp"
        "src/task/TaskCase.cpp"
        "src/task/TaskDownload.cpp"
        "src/task/TaskGeneric.cpp"
        "src/task/TaskInput.cpp"
        "src/task/TaskMessage.cpp"
        "src/task/TaskOutput.cpp"
        "src/task/TaskProcess.cpp"
        "src/task/TaskSave.cpp"
        "src/task/TaskSequential.cpp"
        "src/task/TaskSound.cpp"
    ];
    export_include_dirs = [
        "include"
        "src"
    ];
    static_libs = [
        "libbase"
        "libutils"
        "liblog"
        "libtinyalsa"
        "libcutils"
        "libtinyxml2"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-g"
        "-fno-exceptions"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-Wno-format"
    ];
    ldflags = [
        "-fno-exceptions"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libcts_audio_quality; }
