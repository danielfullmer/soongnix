{ java_import_host }:
let

metalava-gradle-plugin-deps = java_import_host {
    name = "metalava-gradle-plugin-deps";
    jars = [
        "com/android/tools/lint/lint-api/26.4.0-beta02/lint-api-26.4.0-beta02.jar"
        "com/android/tools/lint/lint-checks/26.4.0-beta02/lint-checks-26.4.0-beta02.jar"
        "com/android/tools/lint/lint/26.4.0-beta02/lint-26.4.0-beta02.jar"
        "com/android/tools/lint/lint-gradle/26.4.0-beta02/lint-gradle-26.4.0-beta02.jar"
        "com/android/tools/common/26.4.0-beta02/common-26.4.0-beta02.jar"
        "com/android/tools/sdk-common/26.4.0-beta02/sdk-common-26.4.0-beta02.jar"
        "com/android/tools/sdklib/26.4.0-beta02/sdklib-26.4.0-beta02.jar"
        "com/android/tools/external/org-jetbrains/uast/26.4.0-beta02/uast-26.4.0-beta02.jar"
        "com/android/tools/external/com-intellij/intellij-core/26.4.0-beta02/intellij-core-26.4.0-beta02.jar"
        "com/android/tools/external/com-intellij/kotlin-compiler/26.4.0-beta02/kotlin-compiler-26.4.0-beta02.jar"
        "com/android/tools/repository/26.4.0-beta02/repository-26.4.0-beta02.jar"
        "com/android/tools/build/manifest-merger/26.4.0-beta02/manifest-merger-26.4.0-beta02.jar"
    ];
};

in { inherit metalava-gradle-plugin-deps; }
