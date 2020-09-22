{ java_binary_host }:
let

#  Copyright 2018 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

dokka = java_binary_host {
    name = "dokka";
    srcs = [
        "core/src/main/kotlin/DokkaBootstrapImpl.kt"
        "core/src/main/kotlin/Analysis/AnalysisEnvironment.kt"
        "core/src/main/kotlin/Analysis/CoreKotlinCacheService.kt"
        "core/src/main/kotlin/Analysis/CoreProjectFileIndex.kt"
        "core/src/main/kotlin/Analysis/JavaResolveExtension.kt"
        "core/src/main/kotlin/Formats/AnalysisComponents.kt"
        "core/src/main/kotlin/Formats/DacHtmlFormat.kt"
        "core/src/main/kotlin/Formats/DacOutlineService.kt"
        "core/src/main/kotlin/Formats/ExtraOutlineServices.kt"
        "core/src/main/kotlin/Formats/FormatDescriptor.kt"
        "core/src/main/kotlin/Formats/FormatService.kt"
        "core/src/main/kotlin/Formats/GFMFormatService.kt"
        "core/src/main/kotlin/Formats/HtmlFormatService.kt"
        "core/src/main/kotlin/Formats/HtmlTemplateService.kt"
        "core/src/main/kotlin/Formats/JekyllFormatService.kt"
        "core/src/main/kotlin/Formats/KotlinWebsiteFormatService.kt"
        "core/src/main/kotlin/Formats/KotlinWebsiteHtmlFormatService.kt"
        "core/src/main/kotlin/Formats/MarkdownFormatService.kt"
        "core/src/main/kotlin/Formats/OutlineService.kt"
        "core/src/main/kotlin/Formats/PackageListService.kt"
        "core/src/main/kotlin/Formats/StandardFormats.kt"
        "core/src/main/kotlin/Formats/StructuredFormatService.kt"
        "core/src/main/kotlin/Formats/YamlOutlineService.kt"
        "core/src/main/kotlin/Formats/JavaLayoutHtml/JavaLayoutHtmlFormat.kt"
        "core/src/main/kotlin/Formats/JavaLayoutHtml/JavaLayoutHtmlFormatOutputBuilder.kt"
        "core/src/main/kotlin/Formats/JavaLayoutHtml/JavaLayoutHtmlGenerator.kt"
        "core/src/main/kotlin/Formats/JavaLayoutHtml/JavaLayoutHtmlPackageListService.kt"
        "core/src/main/kotlin/Generation/DokkaGenerator.kt"
        "core/src/main/kotlin/Generation/FileGenerator.kt"
        "core/src/main/kotlin/Generation/Generator.kt"
        "core/src/main/kotlin/Generation/configurationImpl.kt"
        "core/src/main/kotlin/Java/JavaPsiDocumentationBuilder.kt"
        "core/src/main/kotlin/Java/JavadocParser.kt"
        "core/src/main/kotlin/Kotlin/ContentBuilder.kt"
        "core/src/main/kotlin/Kotlin/DeclarationLinkResolver.kt"
        "core/src/main/kotlin/Kotlin/DescriptorDocumentationParser.kt"
        "core/src/main/kotlin/Kotlin/DocumentationBuilder.kt"
        "core/src/main/kotlin/Kotlin/ExternalDocumentationLinkResolver.kt"
        "core/src/main/kotlin/Kotlin/KotlinAsJavaDocumentationBuilder.kt"
        "core/src/main/kotlin/Kotlin/KotlinAsJavaElementSignatureProvider.kt"
        "core/src/main/kotlin/Kotlin/KotlinElementSignatureProvider.kt"
        "core/src/main/kotlin/Kotlin/KotlinLanguageService.kt"
        "core/src/main/kotlin/Languages/CommonLanguageService.kt"
        "core/src/main/kotlin/Languages/JavaLanguageService.kt"
        "core/src/main/kotlin/Languages/LanguageService.kt"
        "core/src/main/kotlin/Languages/NewJavaLanguageService.kt"
        "core/src/main/kotlin/Locations/Location.kt"
        "core/src/main/kotlin/Markdown/MarkdownProcessor.kt"
        "core/src/main/kotlin/Model/CodeNode.kt"
        "core/src/main/kotlin/Model/Content.kt"
        "core/src/main/kotlin/Model/DocumentationNode.kt"
        "core/src/main/kotlin/Model/DocumentationReference.kt"
        "core/src/main/kotlin/Model/ElementSignatureProvider.kt"
        "core/src/main/kotlin/Model/PackageDocs.kt"
        "core/src/main/kotlin/Model/SourceLinks.kt"
        "core/src/main/kotlin/Samples/DefaultSampleProcessingService.kt"
        "core/src/main/kotlin/Samples/DevsiteSampleProcessingService.kt"
        "core/src/main/kotlin/Samples/KotlinWebsiteSampleProcessingService.kt"
        "core/src/main/kotlin/Samples/SampleProcessingService.kt"
        "core/src/main/kotlin/Utilities/DokkaLogging.kt"
        "core/src/main/kotlin/Utilities/DokkaModules.kt"
        "core/src/main/kotlin/Utilities/DownloadSamples.kt"
        "core/src/main/kotlin/Utilities/Html.kt"
        "core/src/main/kotlin/Utilities/Path.kt"
        "core/src/main/kotlin/Utilities/SamplesPathsToURLs.kt"
        "core/src/main/kotlin/Utilities/ServiceLocator.kt"
        "core/src/main/kotlin/Utilities/StringExtensions.kt"
        "core/src/main/kotlin/Utilities/Uri.kt"
        "core/src/main/kotlin/javadoc/docbase.kt"
        "core/src/main/kotlin/javadoc/dokka-adapters.kt"
        "core/src/main/kotlin/javadoc/reporter.kt"
        "core/src/main/kotlin/javadoc/source-position.kt"
        "core/src/main/kotlin/javadoc/tags.kt"
        "runners/cli/src/main/kotlin/cli/main.kt"
        "integration/src/main/kotlin/org/jetbrains/dokka/DokkaBootstrap.kt"
        "integration/src/main/kotlin/org/jetbrains/dokka/ReflectDsl.kt"
        "integration/src/main/kotlin/org/jetbrains/dokka/configuration.kt"
        "buildSrc/src/main/groovy/org/jetbrains/CorrectShadowPublishing.groovy"
        "buildSrc/src/main/groovy/org/jetbrains/CrossPlatformExec.groovy"
        "buildSrc/src/main/groovy/org/jetbrains/DependenciesVersionGetter.groovy"
        "buildSrc/src/main/groovy/org/jetbrains/PluginXmlTransformer.groovy"
    ];
    static_libs = [
        "dokka-tools-common-m2-deps"
    ];
    #  Pin to Java 8 since dokka doesn't compile with the Java 9 module system
    #  (it references packages under com.sun.tools.doclets which are not
    #  exported from the jdk.javadoc module) (see b/140097603):
    java_version = "1.8";
    kotlincflags = ["-language-version 1.2 -api-version 1.2 -jvm-target 1.8"];
    use_tools_jar = true;
    java_resource_dirs = ["core/src/main/resources"];
};

in { inherit dokka; }
