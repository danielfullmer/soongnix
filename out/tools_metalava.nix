{ droiddoc_exported_dir, genrule, java_binary_host, java_library }:
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

metalava = java_binary_host {
    name = "metalava";
    srcs = [
        "src/main/java/com/android/resources/ResourceType.java"
        "src/main/java/com/android/tools/metalava/apilevels/AndroidJarReader.java"
        "src/main/java/com/android/tools/metalava/apilevels/Api.java"
        "src/main/java/com/android/tools/metalava/apilevels/ApiClass.java"
        "src/main/java/com/android/tools/metalava/apilevels/ApiElement.java"
        "src/main/java/com/android/tools/metalava/apilevels/ApiGenerator.java"
        "src/main/java/com/android/tools/metalava/doclava1/ApiFile.java"
        "src/main/java/com/android/tools/metalava/doclava1/ApiParseException.java"
        "src/main/java/com/android/tools/metalava/doclava1/Errors.java"
        "src/main/java/com/android/tools/metalava/doclava1/SourcePositionInfo.java"
        "src/main/java/com/android/tools/lint/checks/infrastructure/ClassName.kt"
        "src/main/java/com/android/tools/metalava/AndroidApiChecks.kt"
        "src/main/java/com/android/tools/metalava/AnnotationStatistics.kt"
        "src/main/java/com/android/tools/metalava/AnnotationsDiffer.kt"
        "src/main/java/com/android/tools/metalava/AnnotationsMerger.kt"
        "src/main/java/com/android/tools/metalava/ApiAnalyzer.kt"
        "src/main/java/com/android/tools/metalava/ApiLint.kt"
        "src/main/java/com/android/tools/metalava/ApiType.kt"
        "src/main/java/com/android/tools/metalava/ArtifactTagger.kt"
        "src/main/java/com/android/tools/metalava/Baseline.kt"
        "src/main/java/com/android/tools/metalava/ComparisonVisitor.kt"
        "src/main/java/com/android/tools/metalava/Compatibility.kt"
        "src/main/java/com/android/tools/metalava/CompatibilityCheck.kt"
        "src/main/java/com/android/tools/metalava/Constants.kt"
        "src/main/java/com/android/tools/metalava/ConvertJarsToSignatureFiles.kt"
        "src/main/java/com/android/tools/metalava/DexApiWriter.kt"
        "src/main/java/com/android/tools/metalava/Diff.kt"
        "src/main/java/com/android/tools/metalava/DocAnalyzer.kt"
        "src/main/java/com/android/tools/metalava/DocLevel.kt"
        "src/main/java/com/android/tools/metalava/Driver.kt"
        "src/main/java/com/android/tools/metalava/DriverException.kt"
        "src/main/java/com/android/tools/metalava/ExtractAnnotations.kt"
        "src/main/java/com/android/tools/metalava/FileFormat.kt"
        "src/main/java/com/android/tools/metalava/JDiffXmlWriter.kt"
        "src/main/java/com/android/tools/metalava/KotlinInteropChecks.kt"
        "src/main/java/com/android/tools/metalava/NullabilityAnnotationsValidator.kt"
        "src/main/java/com/android/tools/metalava/NullnessMigration.kt"
        "src/main/java/com/android/tools/metalava/Options.kt"
        "src/main/java/com/android/tools/metalava/PackageFilter.kt"
        "src/main/java/com/android/tools/metalava/ProguardWriter.kt"
        "src/main/java/com/android/tools/metalava/ReleaseType.kt"
        "src/main/java/com/android/tools/metalava/Reporter.kt"
        "src/main/java/com/android/tools/metalava/RewriteAnnotations.kt"
        "src/main/java/com/android/tools/metalava/SdkFileWriter.kt"
        "src/main/java/com/android/tools/metalava/SignatureFileLoader.kt"
        "src/main/java/com/android/tools/metalava/SignatureWriter.kt"
        "src/main/java/com/android/tools/metalava/StubWriter.kt"
        "src/main/java/com/android/tools/metalava/Terminal.kt"
        "src/main/java/com/android/tools/metalava/Version.kt"
        "src/main/java/com/android/tools/metalava/apilevels/AddApisFromCodebase.kt"
        "src/main/java/com/android/tools/metalava/doclava1/ApiPredicate.kt"
        "src/main/java/com/android/tools/metalava/doclava1/ElidingPredicate.kt"
        "src/main/java/com/android/tools/metalava/doclava1/FilterPredicate.kt"
        "src/main/java/com/android/tools/metalava/doclava1/TextCodebase.kt"
        "src/main/java/com/android/tools/metalava/model/AnnotationItem.kt"
        "src/main/java/com/android/tools/metalava/model/AnnotationRetention.kt"
        "src/main/java/com/android/tools/metalava/model/AnnotationTarget.kt"
        "src/main/java/com/android/tools/metalava/model/ClassItem.kt"
        "src/main/java/com/android/tools/metalava/model/Codebase.kt"
        "src/main/java/com/android/tools/metalava/model/CompilationUnit.kt"
        "src/main/java/com/android/tools/metalava/model/ConstructorItem.kt"
        "src/main/java/com/android/tools/metalava/model/DefaultModifierList.kt"
        "src/main/java/com/android/tools/metalava/model/ErrorConfiguration.kt"
        "src/main/java/com/android/tools/metalava/model/FieldItem.kt"
        "src/main/java/com/android/tools/metalava/model/Item.kt"
        "src/main/java/com/android/tools/metalava/model/MemberItem.kt"
        "src/main/java/com/android/tools/metalava/model/MethodItem.kt"
        "src/main/java/com/android/tools/metalava/model/ModifierList.kt"
        "src/main/java/com/android/tools/metalava/model/MutableModifierList.kt"
        "src/main/java/com/android/tools/metalava/model/PackageDocs.kt"
        "src/main/java/com/android/tools/metalava/model/PackageItem.kt"
        "src/main/java/com/android/tools/metalava/model/PackageList.kt"
        "src/main/java/com/android/tools/metalava/model/ParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/PropertyItem.kt"
        "src/main/java/com/android/tools/metalava/model/TypeItem.kt"
        "src/main/java/com/android/tools/metalava/model/TypeParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/TypeParameterList.kt"
        "src/main/java/com/android/tools/metalava/model/TypeParameterListOwner.kt"
        "src/main/java/com/android/tools/metalava/model/Xml.kt"
        "src/main/java/com/android/tools/metalava/model/psi/ClassType.kt"
        "src/main/java/com/android/tools/metalava/model/psi/CodePrinter.kt"
        "src/main/java/com/android/tools/metalava/model/psi/Javadoc.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiAnnotationItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiBasedCodebase.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiClassItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiCompilationUnit.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiConstructorItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiFieldItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiMethodItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiModifierItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiPackageItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiPropertyItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiTypeItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiTypeParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiTypeParameterList.kt"
        "src/main/java/com/android/tools/metalava/model/psi/PsiTypePrinter.kt"
        "src/main/java/com/android/tools/metalava/model/psi/UAnnotationItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextBackedAnnotationItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextClassItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextConstructorItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextFieldItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextMemberItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextMethodItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextModifiers.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextPackageItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextPropertyItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextTypeItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextTypeParameterItem.kt"
        "src/main/java/com/android/tools/metalava/model/text/TextTypeParameterList.kt"
        "src/main/java/com/android/tools/metalava/model/visitors/ApiVisitor.kt"
        "src/main/java/com/android/tools/metalava/model/visitors/ItemVisitor.kt"
        "src/main/java/com/android/tools/metalava/model/visitors/TypeVisitor.kt"
        "src/main/java/com/android/tools/metalava/model/visitors/VisibleItemVisitor.kt"
    ];
    java_resource_dirs = ["src/main/resources/"];
    static_libs = [
        "kotlin-reflect"
        "metalava-tools-common-m2-deps"
        "metalava-gradle-plugin-deps"
    ];
    manifest = "manifest.txt";
    dist = {
        targets = ["sdk"];
    };
};

stub-annotations = java_library {
    name = "stub-annotations";
    host_supported = true;
    srcs = [
        "stub-annotations/src/main/java/android/annotation/NonNull.java"
        "stub-annotations/src/main/java/android/annotation/Nullable.java"
        "stub-annotations/src/main/java/androidx/annotation/AnimRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnimatorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnyRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnyThread.java"
        "stub-annotations/src/main/java/androidx/annotation/ArrayRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AttrRes.java"
        "stub-annotations/src/main/java/androidx/annotation/BinderThread.java"
        "stub-annotations/src/main/java/androidx/annotation/BoolRes.java"
        "stub-annotations/src/main/java/androidx/annotation/CallSuper.java"
        "stub-annotations/src/main/java/androidx/annotation/CheckResult.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorInt.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorLong.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/DimenRes.java"
        "stub-annotations/src/main/java/androidx/annotation/Dimension.java"
        "stub-annotations/src/main/java/androidx/annotation/DrawableRes.java"
        "stub-annotations/src/main/java/androidx/annotation/FloatRange.java"
        "stub-annotations/src/main/java/androidx/annotation/FontRes.java"
        "stub-annotations/src/main/java/androidx/annotation/FractionRes.java"
        "stub-annotations/src/main/java/androidx/annotation/HalfFloat.java"
        "stub-annotations/src/main/java/androidx/annotation/IdRes.java"
        "stub-annotations/src/main/java/androidx/annotation/IntRange.java"
        "stub-annotations/src/main/java/androidx/annotation/IntegerRes.java"
        "stub-annotations/src/main/java/androidx/annotation/InterpolatorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/LayoutRes.java"
        "stub-annotations/src/main/java/androidx/annotation/MainThread.java"
        "stub-annotations/src/main/java/androidx/annotation/MenuRes.java"
        "stub-annotations/src/main/java/androidx/annotation/NavigationRes.java"
        "stub-annotations/src/main/java/androidx/annotation/NonNull.java"
        "stub-annotations/src/main/java/androidx/annotation/Nullable.java"
        "stub-annotations/src/main/java/androidx/annotation/PluralsRes.java"
        "stub-annotations/src/main/java/androidx/annotation/Px.java"
        "stub-annotations/src/main/java/androidx/annotation/RawRes.java"
        "stub-annotations/src/main/java/androidx/annotation/RecentlyNonNull.java"
        "stub-annotations/src/main/java/androidx/annotation/RecentlyNullable.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresApi.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresFeature.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresPermission.java"
        "stub-annotations/src/main/java/androidx/annotation/RestrictTo.java"
        "stub-annotations/src/main/java/androidx/annotation/Size.java"
        "stub-annotations/src/main/java/androidx/annotation/StringRes.java"
        "stub-annotations/src/main/java/androidx/annotation/StyleRes.java"
        "stub-annotations/src/main/java/androidx/annotation/StyleableRes.java"
        "stub-annotations/src/main/java/androidx/annotation/TransitionRes.java"
        "stub-annotations/src/main/java/androidx/annotation/UiThread.java"
        "stub-annotations/src/main/java/androidx/annotation/WorkerThread.java"
        "stub-annotations/src/main/java/androidx/annotation/XmlRes.java"
    ];
    sdk_version = "core_current";
    target = {
        host = {
            dist = {
                targets = ["sdk"];
            };
        };
    };
};

private-stub-annotations = genrule {
    name = "private-stub-annotations";
    tools = [
        "soong_zip"
        "metalava"
    ];
    srcs = [
        "stub-annotations/src/main/java/android/annotation/NonNull.java"
        "stub-annotations/src/main/java/android/annotation/Nullable.java"
        "stub-annotations/src/main/java/androidx/annotation/AnimRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnimatorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnyRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AnyThread.java"
        "stub-annotations/src/main/java/androidx/annotation/ArrayRes.java"
        "stub-annotations/src/main/java/androidx/annotation/AttrRes.java"
        "stub-annotations/src/main/java/androidx/annotation/BinderThread.java"
        "stub-annotations/src/main/java/androidx/annotation/BoolRes.java"
        "stub-annotations/src/main/java/androidx/annotation/CallSuper.java"
        "stub-annotations/src/main/java/androidx/annotation/CheckResult.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorInt.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorLong.java"
        "stub-annotations/src/main/java/androidx/annotation/ColorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/DimenRes.java"
        "stub-annotations/src/main/java/androidx/annotation/Dimension.java"
        "stub-annotations/src/main/java/androidx/annotation/DrawableRes.java"
        "stub-annotations/src/main/java/androidx/annotation/FloatRange.java"
        "stub-annotations/src/main/java/androidx/annotation/FontRes.java"
        "stub-annotations/src/main/java/androidx/annotation/FractionRes.java"
        "stub-annotations/src/main/java/androidx/annotation/HalfFloat.java"
        "stub-annotations/src/main/java/androidx/annotation/IdRes.java"
        "stub-annotations/src/main/java/androidx/annotation/IntRange.java"
        "stub-annotations/src/main/java/androidx/annotation/IntegerRes.java"
        "stub-annotations/src/main/java/androidx/annotation/InterpolatorRes.java"
        "stub-annotations/src/main/java/androidx/annotation/LayoutRes.java"
        "stub-annotations/src/main/java/androidx/annotation/MainThread.java"
        "stub-annotations/src/main/java/androidx/annotation/MenuRes.java"
        "stub-annotations/src/main/java/androidx/annotation/NavigationRes.java"
        "stub-annotations/src/main/java/androidx/annotation/NonNull.java"
        "stub-annotations/src/main/java/androidx/annotation/Nullable.java"
        "stub-annotations/src/main/java/androidx/annotation/PluralsRes.java"
        "stub-annotations/src/main/java/androidx/annotation/Px.java"
        "stub-annotations/src/main/java/androidx/annotation/RawRes.java"
        "stub-annotations/src/main/java/androidx/annotation/RecentlyNonNull.java"
        "stub-annotations/src/main/java/androidx/annotation/RecentlyNullable.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresApi.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresFeature.java"
        "stub-annotations/src/main/java/androidx/annotation/RequiresPermission.java"
        "stub-annotations/src/main/java/androidx/annotation/RestrictTo.java"
        "stub-annotations/src/main/java/androidx/annotation/Size.java"
        "stub-annotations/src/main/java/androidx/annotation/StringRes.java"
        "stub-annotations/src/main/java/androidx/annotation/StyleRes.java"
        "stub-annotations/src/main/java/androidx/annotation/StyleableRes.java"
        "stub-annotations/src/main/java/androidx/annotation/TransitionRes.java"
        "stub-annotations/src/main/java/androidx/annotation/UiThread.java"
        "stub-annotations/src/main/java/androidx/annotation/WorkerThread.java"
        "stub-annotations/src/main/java/androidx/annotation/XmlRes.java"
    ];
    cmd = "($(location metalava) --no-banner --copy-annotations tools/metalava/stub-annotations " +
        "$(genDir)/private-stub-annotations) && ($(location soong_zip) -o $(out) -C $(genDir) -D $(genDir))";
    out = [
        "private-stub-annotations.srcjar"
    ];
};

private-stub-annotations-jar = java_library {
    name = "private-stub-annotations-jar";
    host_supported = true;
    srcs = [
        ":private-stub-annotations"
    ];
    sdk_version = "core_current";
};

metalava-manual = droiddoc_exported_dir {
    name = "metalava-manual";
    path = "manual";
};

in { inherit metalava metalava-manual private-stub-annotations private-stub-annotations-jar stub-annotations; }
