{ java_library_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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
#

grpc-java-stub = java_library_host {
    name = "grpc-java-stub";
    srcs = [
        "src/main/java/io/grpc/stub/AbstractStub.java"
        "src/main/java/io/grpc/stub/CallStreamObserver.java"
        "src/main/java/io/grpc/stub/ClientCallStreamObserver.java"
        "src/main/java/io/grpc/stub/ClientCalls.java"
        "src/main/java/io/grpc/stub/ClientResponseObserver.java"
        "src/main/java/io/grpc/stub/MetadataUtils.java"
        "src/main/java/io/grpc/stub/ServerCallStreamObserver.java"
        "src/main/java/io/grpc/stub/ServerCalls.java"
        "src/main/java/io/grpc/stub/StreamObserver.java"
        "src/main/java/io/grpc/stub/StreamObservers.java"
        "src/main/java/io/grpc/stub/package-info.java"
        "src/main/java/io/grpc/stub/annotations/RpcMethod.java"
    ];
    libs = [
        "grpc-java-context"
        "grpc-java-core"
        "guava"
        "jsr305"
    ];
};

in { inherit grpc-java-stub; }
