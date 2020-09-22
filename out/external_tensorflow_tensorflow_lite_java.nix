{ cc_library_shared, java_library_static }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

tensorflowlite_java = java_library_static {
    name = "tensorflowlite_java";
    sdk_version = "current";
    libs = [
        "android-support-annotations"
    ];
    srcs = [
        ":tflite_nnapi_delegate_java"
        "src/main/java/org/tensorflow/lite/DataType.java"
        "src/main/java/org/tensorflow/lite/Delegate.java"
        "src/main/java/org/tensorflow/lite/Interpreter.java"
        "src/main/java/org/tensorflow/lite/NativeInterpreterWrapper.java"
        "src/main/java/org/tensorflow/lite/Tensor.java"
        "src/main/java/org/tensorflow/lite/TensorFlowLite.java"
        "src/main/java/org/tensorflow/lite/package-info.java"
    ];
    static_libs = [
    ];
};

libtensorflowlite_jni = cc_library_shared {
    name = "libtensorflowlite_jni";
    sdk_version = "current";
    export_include_dirs = [
        "src/main/native/"
    ];
    srcs = [
        "src/main/native/builtin_ops_jni.cc"
        "src/main/native/jni_utils.cc"
        "src/main/native/nativeinterpreterwrapper_jni.cc"
        "src/main/native/tensor_jni.cc"
        "src/main/native/tensorflow_lite_jni.cc"
    ];
    header_libs = [
        "tensorflow_headers"
        "flatbuffer_headers"
    ];
    static_libs = [
        "libtflite_static"
    ];
    shared_libs = [
        "liblog"
    ];
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-unused-function"
    ];
    stl = "libc++_static";
};

in { inherit libtensorflowlite_jni tensorflowlite_java; }
