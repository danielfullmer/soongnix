{ java_library }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

volley = java_library {

    name = "volley";
    sdk_version = "17";
    srcs = [
        "src/main/java/com/android/volley/AuthFailureError.java"
        "src/main/java/com/android/volley/Cache.java"
        "src/main/java/com/android/volley/CacheDispatcher.java"
        "src/main/java/com/android/volley/ClientError.java"
        "src/main/java/com/android/volley/DefaultRetryPolicy.java"
        "src/main/java/com/android/volley/ExecutorDelivery.java"
        "src/main/java/com/android/volley/Header.java"
        "src/main/java/com/android/volley/Network.java"
        "src/main/java/com/android/volley/NetworkDispatcher.java"
        "src/main/java/com/android/volley/NetworkError.java"
        "src/main/java/com/android/volley/NetworkResponse.java"
        "src/main/java/com/android/volley/NoConnectionError.java"
        "src/main/java/com/android/volley/ParseError.java"
        "src/main/java/com/android/volley/Request.java"
        "src/main/java/com/android/volley/RequestQueue.java"
        "src/main/java/com/android/volley/Response.java"
        "src/main/java/com/android/volley/ResponseDelivery.java"
        "src/main/java/com/android/volley/RetryPolicy.java"
        "src/main/java/com/android/volley/ServerError.java"
        "src/main/java/com/android/volley/TimeoutError.java"
        "src/main/java/com/android/volley/VolleyError.java"
        "src/main/java/com/android/volley/VolleyLog.java"
        "src/main/java/com/android/volley/toolbox/AdaptedHttpStack.java"
        "src/main/java/com/android/volley/toolbox/AndroidAuthenticator.java"
        "src/main/java/com/android/volley/toolbox/Authenticator.java"
        "src/main/java/com/android/volley/toolbox/BaseHttpStack.java"
        "src/main/java/com/android/volley/toolbox/BasicNetwork.java"
        "src/main/java/com/android/volley/toolbox/ByteArrayPool.java"
        "src/main/java/com/android/volley/toolbox/ClearCacheRequest.java"
        "src/main/java/com/android/volley/toolbox/DiskBasedCache.java"
        "src/main/java/com/android/volley/toolbox/HttpClientStack.java"
        "src/main/java/com/android/volley/toolbox/HttpHeaderParser.java"
        "src/main/java/com/android/volley/toolbox/HttpResponse.java"
        "src/main/java/com/android/volley/toolbox/HttpStack.java"
        "src/main/java/com/android/volley/toolbox/HurlStack.java"
        "src/main/java/com/android/volley/toolbox/ImageLoader.java"
        "src/main/java/com/android/volley/toolbox/ImageRequest.java"
        "src/main/java/com/android/volley/toolbox/JsonArrayRequest.java"
        "src/main/java/com/android/volley/toolbox/JsonObjectRequest.java"
        "src/main/java/com/android/volley/toolbox/JsonRequest.java"
        "src/main/java/com/android/volley/toolbox/NetworkImageView.java"
        "src/main/java/com/android/volley/toolbox/NoCache.java"
        "src/main/java/com/android/volley/toolbox/PoolingByteArrayOutputStream.java"
        "src/main/java/com/android/volley/toolbox/RequestFuture.java"
        "src/main/java/com/android/volley/toolbox/StringRequest.java"
        "src/main/java/com/android/volley/toolbox/Threads.java"
        "src/main/java/com/android/volley/toolbox/Volley.java"
    ];

    #  Only needed at compile-time.
    libs = ["androidx.annotation_annotation"];
};

in { inherit volley; }
