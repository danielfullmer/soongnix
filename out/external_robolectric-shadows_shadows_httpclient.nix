{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric shadows httpclient
# #############################################

Robolectric_shadows_httpclient = java_library_host {
    name = "Robolectric_shadows_httpclient";
    libs = [
        "Robolectric_shadows_framework"
        "Robolectric_annotations"
        "Robolectric_shadowapi"
        "Robolectric_utils"
        "robolectric-httpclient-4.0.3"
        "robolectric-httpcore-4.0.1"
        "robolectric-javax.annotation-api-1.2"
        "robolectric-host-android_all"
        "robolectric-host-org_apache_http_legacy"
    ];
    plugins = ["Robolectric_processor"];
    javacflags = ["-Aorg.robolectric.annotation.processing.shadowPackage=org.robolectric.shadows.httpclient"];
    srcs = [
        "src/main/java/org/robolectric/shadows/ShadowAndroidHttpClient.java"
        "src/main/java/org/robolectric/shadows/httpclient/DefaultRequestDirector.java"
        "src/main/java/org/robolectric/shadows/httpclient/FakeHttp.java"
        "src/main/java/org/robolectric/shadows/httpclient/FakeHttpLayer.java"
        "src/main/java/org/robolectric/shadows/httpclient/HttpEntityStub.java"
        "src/main/java/org/robolectric/shadows/httpclient/HttpRedirect.java"
        "src/main/java/org/robolectric/shadows/httpclient/HttpRequestInfo.java"
        "src/main/java/org/robolectric/shadows/httpclient/HttpResponseGenerator.java"
        "src/main/java/org/robolectric/shadows/httpclient/HttpResponseStub.java"
        "src/main/java/org/robolectric/shadows/httpclient/ParamsParser.java"
        "src/main/java/org/robolectric/shadows/httpclient/RequestMatcher.java"
        "src/main/java/org/robolectric/shadows/httpclient/ShadowDefaultRequestDirector.java"
        "src/main/java/org/robolectric/shadows/httpclient/StatusLineStub.java"
        "src/main/java/org/robolectric/shadows/httpclient/TestHttpResponse.java"
        "src/main/java/org/robolectric/shadows/httpclient/package-info.java"
    ];
};

# #############################################
#  Compile Robolectric shadows httpclient tests
# #############################################

Robolectric_shadows_httpclient_tests = java_test_host {
    name = "Robolectric_shadows_httpclient_tests";
    srcs = [
        "src/test/java/org/robolectric/shadows/httpclient/AndroidHttpClientTest.java"
        "src/test/java/org/robolectric/shadows/httpclient/FakeHttpLayerTest.java"
        "src/test/java/org/robolectric/shadows/httpclient/FakeHttpTest.java"
        "src/test/java/org/robolectric/shadows/httpclient/ParamsParserTest.java"
        "src/test/java/org/robolectric/shadows/httpclient/ShadowDefaultRequestDirectorTest.java"
        "src/test/java/org/robolectric/shadows/httpclient/TestHttpResponseTest.java"
        "src/test/java/org/robolectric/util/TestRunnerWithManifest.java"
    ];
    java_resource_dirs = ["src/test/resources"];
    static_libs = [
        "Robolectric_shadows_httpclient"
        "Robolectric_shadows_framework"
        "Robolectric_annotations"
        "Robolectric_robolectric"
        "Robolectric_resources"
        "Robolectric_shadowapi"
        "Robolectric_sandbox"
        "Robolectric_junit"
        "Robolectric_utils"
        "robolectric-maven-ant-tasks-2.1.3"
        "bouncycastle-unbundled"
        "hamcrest"
        "robolectric-httpclient-4.0.3"
        "asm-commons-6.0"
        "robolectric-httpcore-4.0.1"
        "guava"
        "asm-tree-6.0"
        "junit"
        "truth-prebuilt"
        "robolectric-ant-1.8.0"
        "asm-6.0"
        "jsr305"
        "robolectric-host-android_all"
        "robolectric-host-org_apache_http_legacy"
    ];
    test_suites = ["general-tests"];
};

in { inherit Robolectric_shadows_httpclient Robolectric_shadows_httpclient_tests; }
