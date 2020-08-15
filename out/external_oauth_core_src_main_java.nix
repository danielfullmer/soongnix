{ java_library }:
let

#  Build the client static library for the Google Services Framework
oauth = java_library {
    name = "oauth";
    srcs = [
        "net/oauth/ConsumerProperties.java"
        "net/oauth/OAuth.java"
        "net/oauth/OAuthAccessor.java"
        "net/oauth/OAuthConsumer.java"
        "net/oauth/OAuthException.java"
        "net/oauth/OAuthMessage.java"
        "net/oauth/OAuthProblemException.java"
        "net/oauth/OAuthServiceProvider.java"
        "net/oauth/OAuthValidator.java"
        "net/oauth/SimpleOAuthValidator.java"
        "net/oauth/client/ExcerptInputStream.java"
        "net/oauth/client/OAuthClient.java"
        "net/oauth/client/OAuthResponseMessage.java"
        "net/oauth/client/URLConnectionClient.java"
        "net/oauth/client/URLConnectionResponse.java"
        "net/oauth/client/httpclient4/HttpClient4.java"
        "net/oauth/client/httpclient4/HttpClientPool.java"
        "net/oauth/client/httpclient4/HttpMethodResponse.java"
        "net/oauth/http/HttpClient.java"
        "net/oauth/http/HttpMessage.java"
        "net/oauth/http/HttpMessageDecoder.java"
        "net/oauth/http/HttpResponseMessage.java"
        "net/oauth/signature/HMAC_SHA1.java"
        "net/oauth/signature/OAuthSignatureMethod.java"
        "net/oauth/signature/PLAINTEXT.java"
        "net/oauth/signature/RSA_SHA1.java"
    ];
    sdk_version = "8";
};

in { inherit oauth; }
