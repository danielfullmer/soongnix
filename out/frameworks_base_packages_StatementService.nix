{ android_app }:
let

#  Copyright (C) 2015 The Android Open Source Project
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
StatementService = android_app {
    name = "StatementService";
    srcs = [
        "src/com/android/statementservice/DirectStatementService.java"
        "src/com/android/statementservice/ExceptionLoggingFutureTask.java"
        "src/com/android/statementservice/IntentFilterVerificationReceiver.java"
        "src/com/android/statementservice/retriever/AbstractAsset.java"
        "src/com/android/statementservice/retriever/AbstractAssetMatcher.java"
        "src/com/android/statementservice/retriever/AbstractStatementRetriever.java"
        "src/com/android/statementservice/retriever/AndroidAppAsset.java"
        "src/com/android/statementservice/retriever/AndroidAppAssetMatcher.java"
        "src/com/android/statementservice/retriever/AndroidPackageInfoFetcher.java"
        "src/com/android/statementservice/retriever/AssetFactory.java"
        "src/com/android/statementservice/retriever/AssetJsonWriter.java"
        "src/com/android/statementservice/retriever/AssetMatcherFactory.java"
        "src/com/android/statementservice/retriever/AssociationServiceException.java"
        "src/com/android/statementservice/retriever/DirectStatementRetriever.java"
        "src/com/android/statementservice/retriever/JsonParser.java"
        "src/com/android/statementservice/retriever/ParsedStatement.java"
        "src/com/android/statementservice/retriever/Relation.java"
        "src/com/android/statementservice/retriever/Statement.java"
        "src/com/android/statementservice/retriever/StatementParser.java"
        "src/com/android/statementservice/retriever/URLFetcher.java"
        "src/com/android/statementservice/retriever/Utils.java"
        "src/com/android/statementservice/retriever/WebAsset.java"
        "src/com/android/statementservice/retriever/WebAssetMatcher.java"
        "src/com/android/statementservice/retriever/WebContent.java"
    ];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    platform_apis = true;
    privileged = true;
    libs = ["org.apache.http.legacy"];
    static_libs = [
        "libprotobuf-java-nano"
        "volley"
    ];
};

in { inherit StatementService; }
