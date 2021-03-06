{ java_sdk_library }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

"org.apache.http.legacy" = java_sdk_library {
    name = "org.apache.http.legacy";
    srcs = [
        "src/org/apache/commons/codec/BinaryDecoder.java"
        "src/org/apache/commons/codec/BinaryEncoder.java"
        "src/org/apache/commons/codec/Decoder.java"
        "src/org/apache/commons/codec/DecoderException.java"
        "src/org/apache/commons/codec/Encoder.java"
        "src/org/apache/commons/codec/EncoderException.java"
        "src/org/apache/commons/codec/StringDecoder.java"
        "src/org/apache/commons/codec/StringEncoder.java"
        "src/org/apache/commons/codec/StringEncoderComparator.java"
        "src/org/apache/commons/codec/binary/Base64.java"
        "src/org/apache/commons/codec/binary/BinaryCodec.java"
        "src/org/apache/commons/codec/binary/Hex.java"
        "src/org/apache/commons/codec/language/DoubleMetaphone.java"
        "src/org/apache/commons/codec/language/Metaphone.java"
        "src/org/apache/commons/codec/language/RefinedSoundex.java"
        "src/org/apache/commons/codec/language/Soundex.java"
        "src/org/apache/commons/codec/language/SoundexUtils.java"
        "src/org/apache/commons/codec/net/BCodec.java"
        "src/org/apache/commons/codec/net/QCodec.java"
        "src/org/apache/commons/codec/net/QuotedPrintableCodec.java"
        "src/org/apache/commons/codec/net/RFC1522Codec.java"
        "src/org/apache/commons/codec/net/StringEncodings.java"
        "src/org/apache/commons/codec/net/URLCodec.java"
        "src/org/apache/commons/logging/Log.java"
        "src/org/apache/commons/logging/LogConfigurationException.java"
        "src/org/apache/commons/logging/LogFactory.java"
        "src/org/apache/commons/logging/LogSource.java"
        "src/org/apache/commons/logging/impl/Jdk14Logger.java"
        "src/org/apache/commons/logging/impl/LogFactoryImpl.java"
        "src/org/apache/commons/logging/impl/NoOpLog.java"
        "src/org/apache/commons/logging/impl/SimpleLog.java"
        "src/org/apache/commons/logging/impl/WeakHashtable.java"
        "src/org/apache/http/ConnectionClosedException.java"
        "src/org/apache/http/ConnectionReuseStrategy.java"
        "src/org/apache/http/FormattedHeader.java"
        "src/org/apache/http/Header.java"
        "src/org/apache/http/HeaderElement.java"
        "src/org/apache/http/HeaderElementIterator.java"
        "src/org/apache/http/HeaderIterator.java"
        "src/org/apache/http/HttpClientConnection.java"
        "src/org/apache/http/HttpConnection.java"
        "src/org/apache/http/HttpConnectionMetrics.java"
        "src/org/apache/http/HttpEntity.java"
        "src/org/apache/http/HttpEntityEnclosingRequest.java"
        "src/org/apache/http/HttpException.java"
        "src/org/apache/http/HttpHost.java"
        "src/org/apache/http/HttpInetConnection.java"
        "src/org/apache/http/HttpMessage.java"
        "src/org/apache/http/HttpRequest.java"
        "src/org/apache/http/HttpRequestFactory.java"
        "src/org/apache/http/HttpRequestInterceptor.java"
        "src/org/apache/http/HttpResponse.java"
        "src/org/apache/http/HttpResponseFactory.java"
        "src/org/apache/http/HttpResponseInterceptor.java"
        "src/org/apache/http/HttpServerConnection.java"
        "src/org/apache/http/HttpStatus.java"
        "src/org/apache/http/HttpVersion.java"
        "src/org/apache/http/MalformedChunkCodingException.java"
        "src/org/apache/http/MethodNotSupportedException.java"
        "src/org/apache/http/NameValuePair.java"
        "src/org/apache/http/NoHttpResponseException.java"
        "src/org/apache/http/ParseException.java"
        "src/org/apache/http/ProtocolException.java"
        "src/org/apache/http/ProtocolVersion.java"
        "src/org/apache/http/ReasonPhraseCatalog.java"
        "src/org/apache/http/RequestLine.java"
        "src/org/apache/http/StatusLine.java"
        "src/org/apache/http/TokenIterator.java"
        "src/org/apache/http/UnsupportedHttpVersionException.java"
        "src/org/apache/http/auth/AUTH.java"
        "src/org/apache/http/auth/AuthScheme.java"
        "src/org/apache/http/auth/AuthSchemeFactory.java"
        "src/org/apache/http/auth/AuthSchemeRegistry.java"
        "src/org/apache/http/auth/AuthScope.java"
        "src/org/apache/http/auth/AuthState.java"
        "src/org/apache/http/auth/AuthenticationException.java"
        "src/org/apache/http/auth/BasicUserPrincipal.java"
        "src/org/apache/http/auth/Credentials.java"
        "src/org/apache/http/auth/InvalidCredentialsException.java"
        "src/org/apache/http/auth/MalformedChallengeException.java"
        "src/org/apache/http/auth/NTCredentials.java"
        "src/org/apache/http/auth/NTUserPrincipal.java"
        "src/org/apache/http/auth/UsernamePasswordCredentials.java"
        "src/org/apache/http/auth/params/AuthPNames.java"
        "src/org/apache/http/auth/params/AuthParamBean.java"
        "src/org/apache/http/auth/params/AuthParams.java"
        "src/org/apache/http/client/AuthenticationHandler.java"
        "src/org/apache/http/client/CircularRedirectException.java"
        "src/org/apache/http/client/ClientProtocolException.java"
        "src/org/apache/http/client/CookieStore.java"
        "src/org/apache/http/client/CredentialsProvider.java"
        "src/org/apache/http/client/HttpClient.java"
        "src/org/apache/http/client/HttpRequestRetryHandler.java"
        "src/org/apache/http/client/HttpResponseException.java"
        "src/org/apache/http/client/NonRepeatableRequestException.java"
        "src/org/apache/http/client/RedirectException.java"
        "src/org/apache/http/client/RedirectHandler.java"
        "src/org/apache/http/client/RequestDirector.java"
        "src/org/apache/http/client/ResponseHandler.java"
        "src/org/apache/http/client/UserTokenHandler.java"
        "src/org/apache/http/client/entity/UrlEncodedFormEntity.java"
        "src/org/apache/http/client/methods/AbortableHttpRequest.java"
        "src/org/apache/http/client/methods/HttpDelete.java"
        "src/org/apache/http/client/methods/HttpEntityEnclosingRequestBase.java"
        "src/org/apache/http/client/methods/HttpGet.java"
        "src/org/apache/http/client/methods/HttpHead.java"
        "src/org/apache/http/client/methods/HttpOptions.java"
        "src/org/apache/http/client/methods/HttpPost.java"
        "src/org/apache/http/client/methods/HttpPut.java"
        "src/org/apache/http/client/methods/HttpRequestBase.java"
        "src/org/apache/http/client/methods/HttpTrace.java"
        "src/org/apache/http/client/methods/HttpUriRequest.java"
        "src/org/apache/http/client/params/AllClientPNames.java"
        "src/org/apache/http/client/params/AuthPolicy.java"
        "src/org/apache/http/client/params/ClientPNames.java"
        "src/org/apache/http/client/params/ClientParamBean.java"
        "src/org/apache/http/client/params/CookiePolicy.java"
        "src/org/apache/http/client/params/HttpClientParams.java"
        "src/org/apache/http/client/protocol/ClientContext.java"
        "src/org/apache/http/client/protocol/ClientContextConfigurer.java"
        "src/org/apache/http/client/protocol/RequestAddCookies.java"
        "src/org/apache/http/client/protocol/RequestDefaultHeaders.java"
        "src/org/apache/http/client/protocol/RequestProxyAuthentication.java"
        "src/org/apache/http/client/protocol/RequestTargetAuthentication.java"
        "src/org/apache/http/client/protocol/ResponseProcessCookies.java"
        "src/org/apache/http/client/utils/CloneUtils.java"
        "src/org/apache/http/client/utils/URIUtils.java"
        "src/org/apache/http/client/utils/URLEncodedUtils.java"
        "src/org/apache/http/conn/BasicEofSensorWatcher.java"
        "src/org/apache/http/conn/BasicManagedEntity.java"
        "src/org/apache/http/conn/ClientConnectionManager.java"
        "src/org/apache/http/conn/ClientConnectionManagerFactory.java"
        "src/org/apache/http/conn/ClientConnectionOperator.java"
        "src/org/apache/http/conn/ClientConnectionRequest.java"
        "src/org/apache/http/conn/ConnectionKeepAliveStrategy.java"
        "src/org/apache/http/conn/ConnectionPoolTimeoutException.java"
        "src/org/apache/http/conn/ConnectionReleaseTrigger.java"
        "src/org/apache/http/conn/EofSensorInputStream.java"
        "src/org/apache/http/conn/EofSensorWatcher.java"
        "src/org/apache/http/conn/HttpHostConnectException.java"
        "src/org/apache/http/conn/ManagedClientConnection.java"
        "src/org/apache/http/conn/MultihomePlainSocketFactory.java"
        "src/org/apache/http/conn/OperatedClientConnection.java"
        "src/org/apache/http/conn/params/ConnConnectionPNames.java"
        "src/org/apache/http/conn/params/ConnConnectionParamBean.java"
        "src/org/apache/http/conn/params/ConnManagerPNames.java"
        "src/org/apache/http/conn/params/ConnManagerParamBean.java"
        "src/org/apache/http/conn/params/ConnManagerParams.java"
        "src/org/apache/http/conn/params/ConnPerRoute.java"
        "src/org/apache/http/conn/params/ConnPerRouteBean.java"
        "src/org/apache/http/conn/params/ConnRoutePNames.java"
        "src/org/apache/http/conn/params/ConnRouteParamBean.java"
        "src/org/apache/http/conn/params/ConnRouteParams.java"
        "src/org/apache/http/conn/routing/BasicRouteDirector.java"
        "src/org/apache/http/conn/routing/HttpRoute.java"
        "src/org/apache/http/conn/routing/HttpRouteDirector.java"
        "src/org/apache/http/conn/routing/HttpRoutePlanner.java"
        "src/org/apache/http/conn/routing/RouteInfo.java"
        "src/org/apache/http/conn/routing/RouteTracker.java"
        "src/org/apache/http/conn/scheme/PlainSocketFactory.java"
        "src/org/apache/http/conn/scheme/Scheme.java"
        "src/org/apache/http/conn/scheme/SchemeRegistry.java"
        "src/org/apache/http/conn/util/InetAddressUtils.java"
        "src/org/apache/http/cookie/ClientCookie.java"
        "src/org/apache/http/cookie/Cookie.java"
        "src/org/apache/http/cookie/CookieAttributeHandler.java"
        "src/org/apache/http/cookie/CookieIdentityComparator.java"
        "src/org/apache/http/cookie/CookieOrigin.java"
        "src/org/apache/http/cookie/CookiePathComparator.java"
        "src/org/apache/http/cookie/CookieSpec.java"
        "src/org/apache/http/cookie/CookieSpecFactory.java"
        "src/org/apache/http/cookie/CookieSpecRegistry.java"
        "src/org/apache/http/cookie/MalformedCookieException.java"
        "src/org/apache/http/cookie/SM.java"
        "src/org/apache/http/cookie/SetCookie.java"
        "src/org/apache/http/cookie/SetCookie2.java"
        "src/org/apache/http/cookie/params/CookieSpecPNames.java"
        "src/org/apache/http/cookie/params/CookieSpecParamBean.java"
        "src/org/apache/http/entity/AbstractHttpEntity.java"
        "src/org/apache/http/entity/BasicHttpEntity.java"
        "src/org/apache/http/entity/BufferedHttpEntity.java"
        "src/org/apache/http/entity/ByteArrayEntity.java"
        "src/org/apache/http/entity/ContentLengthStrategy.java"
        "src/org/apache/http/entity/ContentProducer.java"
        "src/org/apache/http/entity/EntityTemplate.java"
        "src/org/apache/http/entity/FileEntity.java"
        "src/org/apache/http/entity/HttpEntityWrapper.java"
        "src/org/apache/http/entity/InputStreamEntity.java"
        "src/org/apache/http/entity/SerializableEntity.java"
        "src/org/apache/http/entity/StringEntity.java"
        "src/org/apache/http/impl/AbstractHttpClientConnection.java"
        "src/org/apache/http/impl/AbstractHttpServerConnection.java"
        "src/org/apache/http/impl/DefaultConnectionReuseStrategy.java"
        "src/org/apache/http/impl/DefaultHttpClientConnection.java"
        "src/org/apache/http/impl/DefaultHttpRequestFactory.java"
        "src/org/apache/http/impl/DefaultHttpResponseFactory.java"
        "src/org/apache/http/impl/DefaultHttpServerConnection.java"
        "src/org/apache/http/impl/EnglishReasonPhraseCatalog.java"
        "src/org/apache/http/impl/HttpConnectionMetricsImpl.java"
        "src/org/apache/http/impl/NoConnectionReuseStrategy.java"
        "src/org/apache/http/impl/SocketHttpClientConnection.java"
        "src/org/apache/http/impl/SocketHttpServerConnection.java"
        "src/org/apache/http/impl/auth/AuthSchemeBase.java"
        "src/org/apache/http/impl/auth/BasicScheme.java"
        "src/org/apache/http/impl/auth/BasicSchemeFactory.java"
        "src/org/apache/http/impl/auth/DigestScheme.java"
        "src/org/apache/http/impl/auth/DigestSchemeFactory.java"
        "src/org/apache/http/impl/auth/NTLMEngine.java"
        "src/org/apache/http/impl/auth/NTLMEngineException.java"
        "src/org/apache/http/impl/auth/NTLMScheme.java"
        "src/org/apache/http/impl/auth/RFC2617Scheme.java"
        "src/org/apache/http/impl/auth/UnsupportedDigestAlgorithmException.java"
        "src/org/apache/http/impl/client/AbstractAuthenticationHandler.java"
        "src/org/apache/http/impl/client/AbstractHttpClient.java"
        "src/org/apache/http/impl/client/BasicCookieStore.java"
        "src/org/apache/http/impl/client/BasicCredentialsProvider.java"
        "src/org/apache/http/impl/client/BasicResponseHandler.java"
        "src/org/apache/http/impl/client/ClientParamsStack.java"
        "src/org/apache/http/impl/client/DefaultConnectionKeepAliveStrategy.java"
        "src/org/apache/http/impl/client/DefaultHttpClient.java"
        "src/org/apache/http/impl/client/DefaultHttpRequestRetryHandler.java"
        "src/org/apache/http/impl/client/DefaultProxyAuthenticationHandler.java"
        "src/org/apache/http/impl/client/DefaultRedirectHandler.java"
        "src/org/apache/http/impl/client/DefaultRequestDirector.java"
        "src/org/apache/http/impl/client/DefaultTargetAuthenticationHandler.java"
        "src/org/apache/http/impl/client/DefaultUserTokenHandler.java"
        "src/org/apache/http/impl/client/EntityEnclosingRequestWrapper.java"
        "src/org/apache/http/impl/client/RedirectLocations.java"
        "src/org/apache/http/impl/client/RequestWrapper.java"
        "src/org/apache/http/impl/client/RoutedRequest.java"
        "src/org/apache/http/impl/client/TunnelRefusedException.java"
        "src/org/apache/http/impl/conn/AbstractClientConnAdapter.java"
        "src/org/apache/http/impl/conn/AbstractPoolEntry.java"
        "src/org/apache/http/impl/conn/AbstractPooledConnAdapter.java"
        "src/org/apache/http/impl/conn/DefaultClientConnection.java"
        "src/org/apache/http/impl/conn/DefaultClientConnectionOperator.java"
        "src/org/apache/http/impl/conn/DefaultHttpRoutePlanner.java"
        "src/org/apache/http/impl/conn/DefaultResponseParser.java"
        "src/org/apache/http/impl/conn/IdleConnectionHandler.java"
        "src/org/apache/http/impl/conn/LoggingSessionInputBuffer.java"
        "src/org/apache/http/impl/conn/LoggingSessionOutputBuffer.java"
        "src/org/apache/http/impl/conn/ProxySelectorRoutePlanner.java"
        "src/org/apache/http/impl/conn/SingleClientConnManager.java"
        "src/org/apache/http/impl/conn/Wire.java"
        "src/org/apache/http/impl/conn/tsccm/AbstractConnPool.java"
        "src/org/apache/http/impl/conn/tsccm/BasicPoolEntry.java"
        "src/org/apache/http/impl/conn/tsccm/BasicPoolEntryRef.java"
        "src/org/apache/http/impl/conn/tsccm/BasicPooledConnAdapter.java"
        "src/org/apache/http/impl/conn/tsccm/ConnPoolByRoute.java"
        "src/org/apache/http/impl/conn/tsccm/PoolEntryRequest.java"
        "src/org/apache/http/impl/conn/tsccm/RefQueueHandler.java"
        "src/org/apache/http/impl/conn/tsccm/RefQueueWorker.java"
        "src/org/apache/http/impl/conn/tsccm/RouteSpecificPool.java"
        "src/org/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager.java"
        "src/org/apache/http/impl/conn/tsccm/WaitingThread.java"
        "src/org/apache/http/impl/conn/tsccm/WaitingThreadAborter.java"
        "src/org/apache/http/impl/cookie/AbstractCookieAttributeHandler.java"
        "src/org/apache/http/impl/cookie/AbstractCookieSpec.java"
        "src/org/apache/http/impl/cookie/BasicClientCookie.java"
        "src/org/apache/http/impl/cookie/BasicClientCookie2.java"
        "src/org/apache/http/impl/cookie/BasicCommentHandler.java"
        "src/org/apache/http/impl/cookie/BasicDomainHandler.java"
        "src/org/apache/http/impl/cookie/BasicExpiresHandler.java"
        "src/org/apache/http/impl/cookie/BasicMaxAgeHandler.java"
        "src/org/apache/http/impl/cookie/BasicPathHandler.java"
        "src/org/apache/http/impl/cookie/BasicSecureHandler.java"
        "src/org/apache/http/impl/cookie/BestMatchSpec.java"
        "src/org/apache/http/impl/cookie/BestMatchSpecFactory.java"
        "src/org/apache/http/impl/cookie/BrowserCompatSpec.java"
        "src/org/apache/http/impl/cookie/BrowserCompatSpecFactory.java"
        "src/org/apache/http/impl/cookie/CookieSpecBase.java"
        "src/org/apache/http/impl/cookie/DateParseException.java"
        "src/org/apache/http/impl/cookie/DateUtils.java"
        "src/org/apache/http/impl/cookie/NetscapeDomainHandler.java"
        "src/org/apache/http/impl/cookie/NetscapeDraftHeaderParser.java"
        "src/org/apache/http/impl/cookie/NetscapeDraftSpec.java"
        "src/org/apache/http/impl/cookie/NetscapeDraftSpecFactory.java"
        "src/org/apache/http/impl/cookie/RFC2109DomainHandler.java"
        "src/org/apache/http/impl/cookie/RFC2109Spec.java"
        "src/org/apache/http/impl/cookie/RFC2109SpecFactory.java"
        "src/org/apache/http/impl/cookie/RFC2109VersionHandler.java"
        "src/org/apache/http/impl/cookie/RFC2965CommentUrlAttributeHandler.java"
        "src/org/apache/http/impl/cookie/RFC2965DiscardAttributeHandler.java"
        "src/org/apache/http/impl/cookie/RFC2965DomainAttributeHandler.java"
        "src/org/apache/http/impl/cookie/RFC2965PortAttributeHandler.java"
        "src/org/apache/http/impl/cookie/RFC2965Spec.java"
        "src/org/apache/http/impl/cookie/RFC2965SpecFactory.java"
        "src/org/apache/http/impl/cookie/RFC2965VersionAttributeHandler.java"
        "src/org/apache/http/impl/entity/EntityDeserializer.java"
        "src/org/apache/http/impl/entity/EntitySerializer.java"
        "src/org/apache/http/impl/entity/LaxContentLengthStrategy.java"
        "src/org/apache/http/impl/entity/StrictContentLengthStrategy.java"
        "src/org/apache/http/impl/io/AbstractMessageParser.java"
        "src/org/apache/http/impl/io/AbstractMessageWriter.java"
        "src/org/apache/http/impl/io/AbstractSessionInputBuffer.java"
        "src/org/apache/http/impl/io/AbstractSessionOutputBuffer.java"
        "src/org/apache/http/impl/io/ChunkedInputStream.java"
        "src/org/apache/http/impl/io/ChunkedOutputStream.java"
        "src/org/apache/http/impl/io/ContentLengthInputStream.java"
        "src/org/apache/http/impl/io/ContentLengthOutputStream.java"
        "src/org/apache/http/impl/io/HttpRequestParser.java"
        "src/org/apache/http/impl/io/HttpRequestWriter.java"
        "src/org/apache/http/impl/io/HttpResponseParser.java"
        "src/org/apache/http/impl/io/HttpResponseWriter.java"
        "src/org/apache/http/impl/io/HttpTransportMetricsImpl.java"
        "src/org/apache/http/impl/io/IdentityInputStream.java"
        "src/org/apache/http/impl/io/IdentityOutputStream.java"
        "src/org/apache/http/impl/io/SocketInputBuffer.java"
        "src/org/apache/http/impl/io/SocketOutputBuffer.java"
        "src/org/apache/http/io/HttpMessageParser.java"
        "src/org/apache/http/io/HttpMessageWriter.java"
        "src/org/apache/http/io/HttpTransportMetrics.java"
        "src/org/apache/http/io/SessionInputBuffer.java"
        "src/org/apache/http/io/SessionOutputBuffer.java"
        "src/org/apache/http/message/AbstractHttpMessage.java"
        "src/org/apache/http/message/BasicHeader.java"
        "src/org/apache/http/message/BasicHeaderElement.java"
        "src/org/apache/http/message/BasicHeaderElementIterator.java"
        "src/org/apache/http/message/BasicHeaderIterator.java"
        "src/org/apache/http/message/BasicHeaderValueFormatter.java"
        "src/org/apache/http/message/BasicHeaderValueParser.java"
        "src/org/apache/http/message/BasicHttpEntityEnclosingRequest.java"
        "src/org/apache/http/message/BasicHttpRequest.java"
        "src/org/apache/http/message/BasicHttpResponse.java"
        "src/org/apache/http/message/BasicLineFormatter.java"
        "src/org/apache/http/message/BasicLineParser.java"
        "src/org/apache/http/message/BasicListHeaderIterator.java"
        "src/org/apache/http/message/BasicNameValuePair.java"
        "src/org/apache/http/message/BasicRequestLine.java"
        "src/org/apache/http/message/BasicStatusLine.java"
        "src/org/apache/http/message/BasicTokenIterator.java"
        "src/org/apache/http/message/BufferedHeader.java"
        "src/org/apache/http/message/HeaderGroup.java"
        "src/org/apache/http/message/HeaderValueFormatter.java"
        "src/org/apache/http/message/HeaderValueParser.java"
        "src/org/apache/http/message/LineFormatter.java"
        "src/org/apache/http/message/LineParser.java"
        "src/org/apache/http/message/ParserCursor.java"
        "src/org/apache/http/params/AbstractHttpParams.java"
        "src/org/apache/http/params/BasicHttpParams.java"
        "src/org/apache/http/params/CoreProtocolPNames.java"
        "src/org/apache/http/params/DefaultedHttpParams.java"
        "src/org/apache/http/params/HttpAbstractParamBean.java"
        "src/org/apache/http/params/HttpConnectionParamBean.java"
        "src/org/apache/http/params/HttpProtocolParamBean.java"
        "src/org/apache/http/params/HttpProtocolParams.java"
        "src/org/apache/http/protocol/BasicHttpContext.java"
        "src/org/apache/http/protocol/BasicHttpProcessor.java"
        "src/org/apache/http/protocol/DefaultedHttpContext.java"
        "src/org/apache/http/protocol/ExecutionContext.java"
        "src/org/apache/http/protocol/HTTP.java"
        "src/org/apache/http/protocol/HttpContext.java"
        "src/org/apache/http/protocol/HttpDateGenerator.java"
        "src/org/apache/http/protocol/HttpExpectationVerifier.java"
        "src/org/apache/http/protocol/HttpProcessor.java"
        "src/org/apache/http/protocol/HttpRequestExecutor.java"
        "src/org/apache/http/protocol/HttpRequestHandler.java"
        "src/org/apache/http/protocol/HttpRequestHandlerRegistry.java"
        "src/org/apache/http/protocol/HttpRequestHandlerResolver.java"
        "src/org/apache/http/protocol/HttpRequestInterceptorList.java"
        "src/org/apache/http/protocol/HttpResponseInterceptorList.java"
        "src/org/apache/http/protocol/HttpService.java"
        "src/org/apache/http/protocol/RequestConnControl.java"
        "src/org/apache/http/protocol/RequestContent.java"
        "src/org/apache/http/protocol/RequestDate.java"
        "src/org/apache/http/protocol/RequestExpectContinue.java"
        "src/org/apache/http/protocol/RequestTargetHost.java"
        "src/org/apache/http/protocol/RequestUserAgent.java"
        "src/org/apache/http/protocol/ResponseConnControl.java"
        "src/org/apache/http/protocol/ResponseContent.java"
        "src/org/apache/http/protocol/ResponseDate.java"
        "src/org/apache/http/protocol/ResponseServer.java"
        "src/org/apache/http/protocol/SyncBasicHttpContext.java"
        "src/org/apache/http/protocol/UriPatternMatcher.java"
        "src/org/apache/http/util/ByteArrayBuffer.java"
        "src/org/apache/http/util/CharArrayBuffer.java"
        "src/org/apache/http/util/EncodingUtils.java"
        "src/org/apache/http/util/EntityUtils.java"
        "src/org/apache/http/util/ExceptionUtils.java"
        "src/org/apache/http/util/LangUtils.java"
        "src/org/apache/http/util/VersionInfo.java"
        "android/src/android/net/compatibility/WebAddress.java"
        "android/src/android/net/http/AndroidHttpClient.java"
        "android/src/android/net/http/AndroidHttpClientConnection.java"
        "android/src/android/net/http/CertificateChainValidator.java"
        "android/src/android/net/http/Connection.java"
        "android/src/android/net/http/ConnectionThread.java"
        "android/src/android/net/http/DelegatingSSLSession.java"
        "android/src/android/net/http/EventHandler.java"
        "android/src/android/net/http/Headers.java"
        "android/src/android/net/http/HttpAuthHeader.java"
        "android/src/android/net/http/HttpConnection.java"
        "android/src/android/net/http/HttpLog.java"
        "android/src/android/net/http/HttpsConnection.java"
        "android/src/android/net/http/IdleCache.java"
        "android/src/android/net/http/LegacyHttpDateTime.java"
        "android/src/android/net/http/LoggingEventHandler.java"
        "android/src/android/net/http/Request.java"
        "android/src/android/net/http/RequestFeeder.java"
        "android/src/android/net/http/RequestHandle.java"
        "android/src/android/net/http/RequestQueue.java"
        "android/src/com/android/internal/http/multipart/ByteArrayPartSource.java"
        "android/src/com/android/internal/http/multipart/FilePart.java"
        "android/src/com/android/internal/http/multipart/FilePartSource.java"
        "android/src/com/android/internal/http/multipart/MultipartEntity.java"
        "android/src/com/android/internal/http/multipart/Part.java"
        "android/src/com/android/internal/http/multipart/PartBase.java"
        "android/src/com/android/internal/http/multipart/PartSource.java"
        "android/src/com/android/internal/http/multipart/StringPart.java"
    ];
    api_srcs = [
        ":apache-http-stubs-sources"
    ];
    api_packages = [
        "android.net.compatibility"
        "android.net.http"
        "com.android.internal.http.multipart"
        "org.apache.commons.codec"
        "org.apache.commons.codec.binary"
        "org.apache.commons.codec.language"
        "org.apache.commons.codec.net"
        "org.apache.commons.logging"
        "org.apache.commons.logging.impl"
        "org.apache.http"
        "org.apache.http.auth"
        "org.apache.http.auth.params"
        "org.apache.http.client"
        "org.apache.http.client.entity"
        "org.apache.http.client.methods"
        "org.apache.http.client.params"
        "org.apache.http.client.protocol"
        "org.apache.http.client.utils"
        "org.apache.http.conn"
        "org.apache.http.conn.params"
        "org.apache.http.conn.routing"
        "org.apache.http.conn.scheme"
        "org.apache.http.conn.util"
        "org.apache.http.cookie"
        "org.apache.http.cookie.params"
        "org.apache.http.entity"
        "org.apache.http.impl"
        "org.apache.http.impl.auth"
        "org.apache.http.impl.client"
        "org.apache.http.impl.conn"
        "org.apache.http.impl.conn.tsccm"
        "org.apache.http.impl.cookie"
        "org.apache.http.impl.entity"
        "org.apache.http.impl.io"
        "org.apache.http.io"
        "org.apache.http.message"
        "org.apache.http.params"
        "org.apache.http.protocol"
        "org.apache.http.util"
    ];
    dex_preopt = {
        profile = "art-profile";
        app_image = false;
    };
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"]; #  b/73499927
    };
    #  Add dependencies on files used by droiddoc_options.
    droiddoc_option_files = [":frameworks-base-api-current.txt"];
    droiddoc_options = [
        "--hide ReferencesHidden"
        #  Subtract classes from the API .txt / stubs that are in the public SDK API. Without this
        #  the org.apache.http.legacy.jar would contain duplicates of classes in android.jar.
        #  See http://b/119021844 for more details.
        "--subtract-api $(location :frameworks-base-api-current.txt)"
    ];
};

in { inherit "org.apache.http.legacy"; }
