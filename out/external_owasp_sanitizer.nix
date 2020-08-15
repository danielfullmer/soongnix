{ java_library }:
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

owasp-html-sanitizer = java_library {
    name = "owasp-html-sanitizer";
    sdk_version = "19";
    srcs = [
        "src/main/org/owasp/html/AttributePolicy.java"
        "src/main/org/owasp/html/CssGrammar.java"
        "src/main/org/owasp/html/CssSchema.java"
        "src/main/org/owasp/html/CssTokens.java"
        "src/main/org/owasp/html/ElementAndAttributePolicies.java"
        "src/main/org/owasp/html/ElementAndAttributePolicyBasedSanitizerPolicy.java"
        "src/main/org/owasp/html/ElementPolicy.java"
        "src/main/org/owasp/html/Encoding.java"
        "src/main/org/owasp/html/FilterUrlByProtocolAttributePolicy.java"
        "src/main/org/owasp/html/Handler.java"
        "src/main/org/owasp/html/HtmlChangeListener.java"
        "src/main/org/owasp/html/HtmlChangeReporter.java"
        "src/main/org/owasp/html/HtmlEntities.java"
        "src/main/org/owasp/html/HtmlLexer.java"
        "src/main/org/owasp/html/HtmlPolicyBuilder.java"
        "src/main/org/owasp/html/HtmlSanitizer.java"
        "src/main/org/owasp/html/HtmlStreamEventReceiver.java"
        "src/main/org/owasp/html/HtmlStreamRenderer.java"
        "src/main/org/owasp/html/HtmlTextEscapingMode.java"
        "src/main/org/owasp/html/HtmlToken.java"
        "src/main/org/owasp/html/HtmlTokenType.java"
        "src/main/org/owasp/html/PolicyFactory.java"
        "src/main/org/owasp/html/Sanitizers.java"
        "src/main/org/owasp/html/StandardUrlAttributePolicy.java"
        "src/main/org/owasp/html/Strings.java"
        "src/main/org/owasp/html/StylingPolicy.java"
        "src/main/org/owasp/html/TCB.java"
        "src/main/org/owasp/html/TagBalancingHtmlStreamEventReceiver.java"
        "src/main/org/owasp/html/TokenStream.java"
        "src/main/org/owasp/html/Trie.java"
        "src/main/org/owasp/html/package-info.java"
        "src/main/org/owasp/html/examples/EbayPolicyExample.java"
        "src/main/org/owasp/html/examples/SlashdotPolicyExample.java"
        "src/main/org/owasp/html/examples/UrlTextExample.java"
    ];
    static_libs = [
        "jsr305"
        "guava"
    ];
};

in { inherit owasp-html-sanitizer; }
