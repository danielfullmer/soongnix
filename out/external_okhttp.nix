{ filegroup, java_library, java_library_static }:
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

#  The source files that contribute to Android's core library APIs.
okhttp_api_files = filegroup {
    name = "okhttp_api_files";
    #  Use the repackaged version of android as that is what is used by Android core library
    #  APIs.
    srcs = [
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/AndroidResponseCacheAdapter.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/Dns.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/HasCacheHolder.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/HttpURLConnectionFactory.java"
    ];
};

#  non-jarjar'd version of okhttp to compile the tests against
okhttp-nojarjar = java_library {
    name = "okhttp-nojarjar";
    srcs = [
        "android/src/main/java/com/android/okhttp/internalandroidapi/AndroidResponseCacheAdapter.java"
        "android/src/main/java/com/android/okhttp/internalandroidapi/Dns.java"
        "android/src/main/java/com/android/okhttp/internalandroidapi/HasCacheHolder.java"
        "android/src/main/java/com/android/okhttp/internalandroidapi/HttpURLConnectionFactory.java"
        "android/src/main/java/com/squareup/okhttp/ConfigAwareConnectionPool.java"
        "android/src/main/java/com/squareup/okhttp/ConnectionSpecs.java"
        "android/src/main/java/com/squareup/okhttp/HttpHandler.java"
        "android/src/main/java/com/squareup/okhttp/HttpsHandler.java"
        "android/src/main/java/com/squareup/okhttp/OkUrlFactories.java"
        "android/src/main/java/com/squareup/okhttp/internal/Platform.java"
        "android/src/main/java/com/squareup/okhttp/internal/Version.java"
        "okhttp/src/main/java/com/squareup/okhttp/Address.java"
        "okhttp/src/main/java/com/squareup/okhttp/Authenticator.java"
        "okhttp/src/main/java/com/squareup/okhttp/Cache.java"
        "okhttp/src/main/java/com/squareup/okhttp/CacheControl.java"
        "okhttp/src/main/java/com/squareup/okhttp/Call.java"
        "okhttp/src/main/java/com/squareup/okhttp/Callback.java"
        "okhttp/src/main/java/com/squareup/okhttp/CertificatePinner.java"
        "okhttp/src/main/java/com/squareup/okhttp/Challenge.java"
        "okhttp/src/main/java/com/squareup/okhttp/CipherSuite.java"
        "okhttp/src/main/java/com/squareup/okhttp/Connection.java"
        "okhttp/src/main/java/com/squareup/okhttp/ConnectionPool.java"
        "okhttp/src/main/java/com/squareup/okhttp/ConnectionSpec.java"
        "okhttp/src/main/java/com/squareup/okhttp/Credentials.java"
        "okhttp/src/main/java/com/squareup/okhttp/Dispatcher.java"
        "okhttp/src/main/java/com/squareup/okhttp/Dns.java"
        "okhttp/src/main/java/com/squareup/okhttp/FormEncodingBuilder.java"
        "okhttp/src/main/java/com/squareup/okhttp/Handshake.java"
        "okhttp/src/main/java/com/squareup/okhttp/Headers.java"
        "okhttp/src/main/java/com/squareup/okhttp/HttpUrl.java"
        "okhttp/src/main/java/com/squareup/okhttp/Interceptor.java"
        "okhttp/src/main/java/com/squareup/okhttp/MediaType.java"
        "okhttp/src/main/java/com/squareup/okhttp/MultipartBuilder.java"
        "okhttp/src/main/java/com/squareup/okhttp/OkHttpClient.java"
        "okhttp/src/main/java/com/squareup/okhttp/Protocol.java"
        "okhttp/src/main/java/com/squareup/okhttp/Request.java"
        "okhttp/src/main/java/com/squareup/okhttp/RequestBody.java"
        "okhttp/src/main/java/com/squareup/okhttp/Response.java"
        "okhttp/src/main/java/com/squareup/okhttp/ResponseBody.java"
        "okhttp/src/main/java/com/squareup/okhttp/Route.java"
        "okhttp/src/main/java/com/squareup/okhttp/TlsVersion.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/ConnectionSpecSelector.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/DiskLruCache.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/FaultHidingSink.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/Internal.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/InternalCache.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/NamedRunnable.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/OptionalMethod.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/Platform.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/RouteDatabase.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/Util.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/ErrorCode.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/FrameReader.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/FrameWriter.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/FramedConnection.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/FramedStream.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Header.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/HeadersMode.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Hpack.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Http2.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Huffman.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/NameValueBlockReader.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Ping.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/PushObserver.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Settings.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Spdy3.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/framed/Variant.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/AuthenticatorAdapter.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/CacheRequest.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/CacheStrategy.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/HeaderParser.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/Http1xStream.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/Http2xStream.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/HttpDate.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/HttpEngine.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/HttpMethod.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/HttpStream.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/OkHeaders.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RealResponseBody.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RequestException.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RequestLine.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RetryableSink.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RouteException.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/RouteSelector.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/StatusLine.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/http/StreamAllocation.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/io/FileSystem.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/io/RealConnection.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/AndroidTrustRootIndex.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/CertificateChainCleaner.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/DistinguishedNameParser.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/OkHostnameVerifier.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/RealTrustRootIndex.java"
        "okhttp/src/main/java/com/squareup/okhttp/internal/tls/TrustRootIndex.java"
        "okhttp-urlconnection/src/main/java/com/squareup/okhttp/OkUrlFactory.java"
        "okhttp-urlconnection/src/main/java/com/squareup/okhttp/internal/URLFilter.java"
        "okhttp-urlconnection/src/main/java/com/squareup/okhttp/internal/huc/DelegatingHttpsURLConnection.java"
        "okhttp-urlconnection/src/main/java/com/squareup/okhttp/internal/huc/HttpURLConnectionImpl.java"
        "okhttp-urlconnection/src/main/java/com/squareup/okhttp/internal/huc/HttpsURLConnectionImpl.java"
        "okhttp-android-support/src/main/java/com/squareup/okhttp/AndroidInternal.java"
        "okhttp-android-support/src/main/java/com/squareup/okhttp/AndroidShimResponseCache.java"
        "okhttp-android-support/src/main/java/com/squareup/okhttp/OkCacheContainer.java"
        "okhttp-android-support/src/main/java/com/squareup/okhttp/internal/huc/CacheAdapter.java"
        "okhttp-android-support/src/main/java/com/squareup/okhttp/internal/huc/JavaApiConverter.java"
        "okio/okio/src/main/java/okio/AsyncTimeout.java"
        "okio/okio/src/main/java/okio/Base64.java"
        "okio/okio/src/main/java/okio/Buffer.java"
        "okio/okio/src/main/java/okio/BufferedSink.java"
        "okio/okio/src/main/java/okio/BufferedSource.java"
        "okio/okio/src/main/java/okio/ByteString.java"
        "okio/okio/src/main/java/okio/DeflaterSink.java"
        "okio/okio/src/main/java/okio/ForwardingSink.java"
        "okio/okio/src/main/java/okio/ForwardingSource.java"
        "okio/okio/src/main/java/okio/ForwardingTimeout.java"
        "okio/okio/src/main/java/okio/GzipSink.java"
        "okio/okio/src/main/java/okio/GzipSource.java"
        "okio/okio/src/main/java/okio/InflaterSource.java"
        "okio/okio/src/main/java/okio/Okio.java"
        "okio/okio/src/main/java/okio/RealBufferedSink.java"
        "okio/okio/src/main/java/okio/RealBufferedSource.java"
        "okio/okio/src/main/java/okio/Segment.java"
        "okio/okio/src/main/java/okio/SegmentPool.java"
        "okio/okio/src/main/java/okio/SegmentedByteString.java"
        "okio/okio/src/main/java/okio/Sink.java"
        "okio/okio/src/main/java/okio/Source.java"
        "okio/okio/src/main/java/okio/Timeout.java"
        "okio/okio/src/main/java/okio/Util.java"
        "okio/okio/src/main/java/okio/package-info.java"
    ];
    exclude_srcs = ["okhttp/src/main/java/com/squareup/okhttp/internal/Platform.java"];

    hostdex = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

okhttp = java_library {
    name = "okhttp";
    srcs = [
        #  Although some of the classes in the android/ directory are already in the correct
        #  package and do not need to be moved to another package they are transformed as they
        #  reference other classes that do require repackaging.
        "repackaged/android/src/main/java/com/android/okhttp/ConfigAwareConnectionPool.java"
        "repackaged/android/src/main/java/com/android/okhttp/ConnectionSpecs.java"
        "repackaged/android/src/main/java/com/android/okhttp/HttpHandler.java"
        "repackaged/android/src/main/java/com/android/okhttp/HttpsHandler.java"
        "repackaged/android/src/main/java/com/android/okhttp/OkUrlFactories.java"
        "repackaged/android/src/main/java/com/android/okhttp/internal/Platform.java"
        "repackaged/android/src/main/java/com/android/okhttp/internal/Version.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/AndroidResponseCacheAdapter.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/Dns.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/HasCacheHolder.java"
        "repackaged/android/src/main/java/com/android/okhttp/internalandroidapi/HttpURLConnectionFactory.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Address.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Authenticator.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Cache.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/CacheControl.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Call.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Callback.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/CertificatePinner.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Challenge.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/CipherSuite.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Connection.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/ConnectionPool.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/ConnectionSpec.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Credentials.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Dispatcher.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Dns.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/FormEncodingBuilder.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Handshake.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Headers.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/HttpUrl.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Interceptor.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/MediaType.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/MultipartBuilder.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/OkHttpClient.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Protocol.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Request.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/RequestBody.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Response.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/ResponseBody.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/Route.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/TlsVersion.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/ConnectionSpecSelector.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/DiskLruCache.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/FaultHidingSink.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/Internal.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/InternalCache.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/NamedRunnable.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/OptionalMethod.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/RouteDatabase.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/Util.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/ErrorCode.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/FrameReader.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/FrameWriter.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/FramedConnection.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/FramedStream.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Header.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/HeadersMode.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Hpack.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Http2.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Huffman.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/NameValueBlockReader.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Ping.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/PushObserver.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Settings.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Spdy3.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/framed/Variant.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/AuthenticatorAdapter.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/CacheRequest.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/CacheStrategy.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/HeaderParser.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/Http1xStream.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/Http2xStream.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/HttpDate.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/HttpEngine.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/HttpMethod.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/HttpStream.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/OkHeaders.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RealResponseBody.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RequestException.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RequestLine.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RetryableSink.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RouteException.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/RouteSelector.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/StatusLine.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/http/StreamAllocation.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/io/FileSystem.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/io/RealConnection.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/AndroidTrustRootIndex.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/CertificateChainCleaner.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/DistinguishedNameParser.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/OkHostnameVerifier.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/RealTrustRootIndex.java"
        "repackaged/okhttp/src/main/java/com/android/okhttp/internal/tls/TrustRootIndex.java"
        "repackaged/okhttp-urlconnection/src/main/java/com/android/okhttp/OkUrlFactory.java"
        "repackaged/okhttp-urlconnection/src/main/java/com/android/okhttp/internal/URLFilter.java"
        "repackaged/okhttp-urlconnection/src/main/java/com/android/okhttp/internal/huc/DelegatingHttpsURLConnection.java"
        "repackaged/okhttp-urlconnection/src/main/java/com/android/okhttp/internal/huc/HttpURLConnectionImpl.java"
        "repackaged/okhttp-urlconnection/src/main/java/com/android/okhttp/internal/huc/HttpsURLConnectionImpl.java"
        "repackaged/okhttp-android-support/src/main/java/com/android/okhttp/AndroidInternal.java"
        "repackaged/okhttp-android-support/src/main/java/com/android/okhttp/AndroidShimResponseCache.java"
        "repackaged/okhttp-android-support/src/main/java/com/android/okhttp/OkCacheContainer.java"
        "repackaged/okhttp-android-support/src/main/java/com/android/okhttp/internal/huc/CacheAdapter.java"
        "repackaged/okhttp-android-support/src/main/java/com/android/okhttp/internal/huc/JavaApiConverter.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/AsyncTimeout.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Base64.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Buffer.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/BufferedSink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/BufferedSource.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/ByteString.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/DeflaterSink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/ForwardingSink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/ForwardingSource.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/ForwardingTimeout.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/GzipSink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/GzipSource.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/InflaterSource.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Okio.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/RealBufferedSink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/RealBufferedSource.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Segment.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/SegmentPool.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/SegmentedByteString.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Sink.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Source.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Timeout.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/Util.java"
        "repackaged/okio/okio/src/main/java/com/android/okhttp/okio/package-info.java"
    ];

    hostdex = true;
    installable = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

#  A guaranteed unstripped version of okhttp.
#  The build system may or may not strip the okhttp jar, but this one will
#  not be stripped. See b/24535627.
okhttp-testdex = java_library {
    name = "okhttp-testdex";
    static_libs = ["okhttp"];

    installable = true;

    no_standard_libs = true;
    libs = [
        "core-all"
        #  TODO(b/129126571): Depend on Conscrypt stubs instead
        "conscrypt"
    ];
    dex_preopt = {
        enabled = false;
    };
    system_modules = "core-all-system-modules";
    java_version = "1.7";
};

okhttp-tests-nojarjar = java_library_static {
    name = "okhttp-tests-nojarjar";
    srcs = [

        "okhttp-android-support/src/test/java/com/squareup/okhttp/AbstractResponseCache.java"
        "okhttp-android-support/src/test/java/com/squareup/okhttp/android/HttpResponseCache.java"
        "okhttp-android-support/src/test/java/com/squareup/okhttp/android/HttpResponseCacheTest.java"
        "okhttp-android-support/src/test/java/com/squareup/okhttp/internal/huc/CacheAdapterTest.java"
        "okhttp-android-support/src/test/java/com/squareup/okhttp/internal/huc/JavaApiConverterTest.java"
        "okhttp-android-support/src/test/java/com/squareup/okhttp/internal/huc/ResponseCacheTest.java"
        "okhttp-testing-support/src/main/java/com/squareup/okhttp/internal/io/InMemoryFileSystem.java"
        "okhttp-testing-support/src/main/java/com/squareup/okhttp/testing/InstallUncaughtExceptionHandlerListener.java"
        "okhttp-testing-support/src/main/java/com/squareup/okhttp/testing/RecordingHostnameVerifier.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/AddressTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/CacheControlTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/CacheTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/CallTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/CertificatePinnerTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/ConnectionPoolTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/ConnectionReuseTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/ConnectionSpecTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/DelegatingSSLSocket.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/DelegatingSSLSocketFactory.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/DelegatingServerSocketFactory.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/DelegatingSocketFactory.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/DispatcherTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/FallbackTestClientSocketFactory.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/FormEncodingBuilderTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/HttpUrlTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/InterceptorTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/MediaTypeTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/MultipartBuilderTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/OkHttpClientTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/RecordedResponse.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/RecordingCallback.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/RequestTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/SocksProxy.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/SocksProxyTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/TestLogHandler.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/TestUtil.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/URLConnectionTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/UrlComponentEncodingTester.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/WebPlatformUrlTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/WebPlatformUrlTestData.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/ConnectionSpecSelectorTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/DiskLruCacheTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/DoubleInetAddressDns.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/FaultyFileSystem.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/OptionalMethodTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/RecordingAuthenticator.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/RecordingOkAuthenticator.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/SingleInetAddressDns.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/BaseTestHandler.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/HpackTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/Http2ConnectionTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/Http2FrameLoggerTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/Http2Test.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/HttpOverHttp2Test.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/HttpOverSpdy3Test.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/HttpOverSpdyTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/HuffmanTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/MockSpdyPeer.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/SettingsTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/Spdy3ConnectionTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/framed/Spdy3Test.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/CookiesTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/DisconnectTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/ExternalHttp2Example.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/ExternalSpdyExample.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/FakeDns.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/HeadersTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/HttpDateTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/RecordingProxySelector.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/RouteExceptionTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/RouteSelectorTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/StatusLineTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/http/ThreadInterruptTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/tls/CertificateChainCleanerTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/tls/CertificatePinnerChainValidationTest.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/tls/FakeSSLSession.java"
        "okhttp-tests/src/test/java/com/squareup/okhttp/internal/tls/HostnameVerifierTest.java"
        "okhttp-urlconnection/src/test/java/com/squareup/okhttp/OkUrlFactoryTest.java"
        "okhttp-urlconnection/src/test/java/com/squareup/okhttp/UrlConnectionCacheTest.java"
        "okhttp-urlconnection/src/test/java/com/squareup/okhttp/internal/huc/URLEncodingTest.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/internal/ws/RealWebSocket.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/internal/ws/WebSocketProtocol.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/internal/ws/WebSocketReader.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/internal/ws/WebSocketWriter.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/ws/WebSocket.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/ws/WebSocketCall.java"
        "okhttp-ws/src/main/java/com/squareup/okhttp/ws/WebSocketListener.java"
        "okhttp-ws-tests/src/test/java/com/squareup/okhttp/internal/ws/RealWebSocketTest.java"
        "okhttp-ws-tests/src/test/java/com/squareup/okhttp/internal/ws/WebSocketReaderTest.java"
        "okhttp-ws-tests/src/test/java/com/squareup/okhttp/internal/ws/WebSocketWriterTest.java"
        "okhttp-ws-tests/src/test/java/com/squareup/okhttp/ws/WebSocketCallTest.java"
        "okhttp-ws-tests/src/test/java/com/squareup/okhttp/ws/WebSocketRecorder.java"
        "okio/okio/src/test/java/okio/AsyncTimeoutTest.java"
        "okio/okio/src/test/java/okio/BufferTest.java"
        "okio/okio/src/test/java/okio/BufferedSinkTest.java"
        "okio/okio/src/test/java/okio/BufferedSourceTest.java"
        "okio/okio/src/test/java/okio/ByteStringTest.java"
        "okio/okio/src/test/java/okio/DeflaterSinkTest.java"
        "okio/okio/src/test/java/okio/GzipSinkTest.java"
        "okio/okio/src/test/java/okio/GzipSourceTest.java"
        "okio/okio/src/test/java/okio/InflaterSourceTest.java"
        "okio/okio/src/test/java/okio/MockSink.java"
        "okio/okio/src/test/java/okio/OkioTest.java"
        "okio/okio/src/test/java/okio/ReadUtf8LineTest.java"
        "okio/okio/src/test/java/okio/RealBufferedSinkTest.java"
        "okio/okio/src/test/java/okio/RealBufferedSourceTest.java"
        "okio/okio/src/test/java/okio/SegmentSharingTest.java"
        "okio/okio/src/test/java/okio/SocketTimeoutTest.java"
        "okio/okio/src/test/java/okio/TestUtil.java"
        "okio/okio/src/test/java/okio/Utf8Test.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/internal/HeldCertificate.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/internal/SslContextBuilder.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/internal/framed/FramedServer.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/Dispatcher.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/MockResponse.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/MockWebServer.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/PushPromise.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/QueueDispatcher.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/RecordedRequest.java"
        "mockwebserver/src/main/java/com/squareup/okhttp/mockwebserver/SocketPolicy.java"
        "mockwebserver/src/test/java/com/squareup/okhttp/mockwebserver/CustomDispatcherTest.java"
        "mockwebserver/src/test/java/com/squareup/okhttp/mockwebserver/MockWebServerTest.java"
    ];
    #  Exclude test Android currently has problems with due to @Parameterized (requires JUnit 4.11).
    exclude_srcs = ["okhttp-tests/src/test/java/com/squareup/okhttp/WebPlatformUrlTest.java"];

    no_standard_libs = true;
    libs = [
        "core-all"
        "okhttp-nojarjar"
        "junit"
        "conscrypt"
        "bouncycastle-unbundled"
    ];
    system_modules = "core-all-system-modules";

    java_version = "1.7";
};

in { inherit okhttp okhttp-nojarjar okhttp-testdex okhttp-tests-nojarjar okhttp_api_files; }
