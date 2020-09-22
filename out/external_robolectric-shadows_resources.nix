{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric resources
# #############################################

Robolectric_resources = java_library_host {
    name = "Robolectric_resources";
    srcs = [
        "src/main/java/org/robolectric/RoboSettings.java"
        "src/main/java/org/robolectric/UsesSdk.java"
        "src/main/java/org/robolectric/manifest/ActivityData.java"
        "src/main/java/org/robolectric/manifest/AndroidManifest.java"
        "src/main/java/org/robolectric/manifest/BroadcastReceiverData.java"
        "src/main/java/org/robolectric/manifest/ContentProviderData.java"
        "src/main/java/org/robolectric/manifest/IntentFilterData.java"
        "src/main/java/org/robolectric/manifest/MetaData.java"
        "src/main/java/org/robolectric/manifest/PackageItemData.java"
        "src/main/java/org/robolectric/manifest/PathPermissionData.java"
        "src/main/java/org/robolectric/manifest/PermissionGroupItemData.java"
        "src/main/java/org/robolectric/manifest/PermissionItemData.java"
        "src/main/java/org/robolectric/manifest/RoboNotFoundException.java"
        "src/main/java/org/robolectric/manifest/ServiceData.java"
        "src/main/java/org/robolectric/res/AttrData.java"
        "src/main/java/org/robolectric/res/AttributeResource.java"
        "src/main/java/org/robolectric/res/DocumentLoader.java"
        "src/main/java/org/robolectric/res/DrawableResourceLoader.java"
        "src/main/java/org/robolectric/res/EmptyStyle.java"
        "src/main/java/org/robolectric/res/FileFsFile.java"
        "src/main/java/org/robolectric/res/FileTypedResource.java"
        "src/main/java/org/robolectric/res/Fs.java"
        "src/main/java/org/robolectric/res/FsFile.java"
        "src/main/java/org/robolectric/res/NodeHandler.java"
        "src/main/java/org/robolectric/res/PackageResourceTable.java"
        "src/main/java/org/robolectric/res/Plural.java"
        "src/main/java/org/robolectric/res/PluralRules.java"
        "src/main/java/org/robolectric/res/Qualifiers.java"
        "src/main/java/org/robolectric/res/RawResourceLoader.java"
        "src/main/java/org/robolectric/res/ResBunch.java"
        "src/main/java/org/robolectric/res/ResBundle.java"
        "src/main/java/org/robolectric/res/ResName.java"
        "src/main/java/org/robolectric/res/ResType.java"
        "src/main/java/org/robolectric/res/ResourceIdGenerator.java"
        "src/main/java/org/robolectric/res/ResourceIds.java"
        "src/main/java/org/robolectric/res/ResourceMerger.java"
        "src/main/java/org/robolectric/res/ResourcePath.java"
        "src/main/java/org/robolectric/res/ResourceRemapper.java"
        "src/main/java/org/robolectric/res/ResourceTable.java"
        "src/main/java/org/robolectric/res/ResourceTableFactory.java"
        "src/main/java/org/robolectric/res/ResourceValueConverter.java"
        "src/main/java/org/robolectric/res/RoutingResourceTable.java"
        "src/main/java/org/robolectric/res/StartsWithFilter.java"
        "src/main/java/org/robolectric/res/StaxArrayLoader.java"
        "src/main/java/org/robolectric/res/StaxAttrLoader.java"
        "src/main/java/org/robolectric/res/StaxDocumentLoader.java"
        "src/main/java/org/robolectric/res/StaxLoader.java"
        "src/main/java/org/robolectric/res/StaxPluralsLoader.java"
        "src/main/java/org/robolectric/res/StaxStyleLoader.java"
        "src/main/java/org/robolectric/res/StaxValueLoader.java"
        "src/main/java/org/robolectric/res/StringResources.java"
        "src/main/java/org/robolectric/res/Style.java"
        "src/main/java/org/robolectric/res/StyleData.java"
        "src/main/java/org/robolectric/res/StyleResolver.java"
        "src/main/java/org/robolectric/res/TextCollectingNodeHandler.java"
        "src/main/java/org/robolectric/res/ThemeStyleSet.java"
        "src/main/java/org/robolectric/res/TypedResource.java"
        "src/main/java/org/robolectric/res/XmlContext.java"
        "src/main/java/org/robolectric/res/android/AConfiguration.java"
        "src/main/java/org/robolectric/res/android/ApkAssetsCookie.java"
        "src/main/java/org/robolectric/res/android/Asset.java"
        "src/main/java/org/robolectric/res/android/AssetDir.java"
        "src/main/java/org/robolectric/res/android/AssetPath.java"
        "src/main/java/org/robolectric/res/android/AttributeResolution.java"
        "src/main/java/org/robolectric/res/android/AttributeResolution10.java"
        "src/main/java/org/robolectric/res/android/AttributeResolution9.java"
        "src/main/java/org/robolectric/res/android/ByteBucketArray.java"
        "src/main/java/org/robolectric/res/android/Chunk.java"
        "src/main/java/org/robolectric/res/android/ConfigDescription.java"
        "src/main/java/org/robolectric/res/android/CppApkAssets.java"
        "src/main/java/org/robolectric/res/android/CppAssetManager.java"
        "src/main/java/org/robolectric/res/android/CppAssetManager2.java"
        "src/main/java/org/robolectric/res/android/DataType.java"
        "src/main/java/org/robolectric/res/android/DynamicRefTable.java"
        "src/main/java/org/robolectric/res/android/Errors.java"
        "src/main/java/org/robolectric/res/android/FileMap.java"
        "src/main/java/org/robolectric/res/android/Formatter.java"
        "src/main/java/org/robolectric/res/android/Idmap.java"
        "src/main/java/org/robolectric/res/android/IdmapEntries.java"
        "src/main/java/org/robolectric/res/android/LoadedArsc.java"
        "src/main/java/org/robolectric/res/android/LocaleData.java"
        "src/main/java/org/robolectric/res/android/LocaleDataTables.java"
        "src/main/java/org/robolectric/res/android/NativeObjRegistry.java"
        "src/main/java/org/robolectric/res/android/Ref.java"
        "src/main/java/org/robolectric/res/android/Registries.java"
        "src/main/java/org/robolectric/res/android/ResStringPool.java"
        "src/main/java/org/robolectric/res/android/ResStringPoolHeader.java"
        "src/main/java/org/robolectric/res/android/ResStringPoolRef.java"
        "src/main/java/org/robolectric/res/android/ResTable.java"
        "src/main/java/org/robolectric/res/android/ResTableTheme.java"
        "src/main/java/org/robolectric/res/android/ResTable_config.java"
        "src/main/java/org/robolectric/res/android/ResXMLParser.java"
        "src/main/java/org/robolectric/res/android/ResXMLTree.java"
        "src/main/java/org/robolectric/res/android/ResourceString.java"
        "src/main/java/org/robolectric/res/android/ResourceTable.java"
        "src/main/java/org/robolectric/res/android/ResourceTypes.java"
        "src/main/java/org/robolectric/res/android/ResourceUtils.java"
        "src/main/java/org/robolectric/res/android/SortedVector.java"
        "src/main/java/org/robolectric/res/android/String8.java"
        "src/main/java/org/robolectric/res/android/StringPiece.java"
        "src/main/java/org/robolectric/res/android/StringPoolRef.java"
        "src/main/java/org/robolectric/res/android/Util.java"
        "src/main/java/org/robolectric/res/android/ZipArchiveHandle.java"
        "src/main/java/org/robolectric/res/android/ZipFileRO.java"
        "src/main/java/org/robolectric/res/builder/XmlBlock.java"
    ];
    libs = [
        "Robolectric_annotations"
        "Robolectric_utils"
        "guava"
        "jsr305"
    ];
};

# #############################################
#  Compile Robolectric resources tests
# #############################################

Robolectric_resources_tests = java_test_host {
    name = "Robolectric_resources_tests";
    srcs = [
        "src/test/java/org/robolectric/RoboSettingsTest.java"
        "src/test/java/org/robolectric/manifest/ActivityDataTest.java"
        "src/test/java/org/robolectric/manifest/MetaDataTest.java"
        "src/test/java/org/robolectric/res/QualifiersTest.java"
        "src/test/java/org/robolectric/res/ResTypeTest.java"
        "src/test/java/org/robolectric/res/ResourceIdsTest.java"
        "src/test/java/org/robolectric/res/StaxValueLoaderTest.java"
        "src/test/java/org/robolectric/res/StyleDataTest.java"
        "src/test/java/org/robolectric/res/ThemeStyleSetTest.java"
        "src/test/java/org/robolectric/res/android/ConfigDescriptionTest.java"
        "src/test/java/org/robolectric/res/android/ResTableConfigTest.java"
        "src/test/java/org/robolectric/res/android/ResTable_configTest.java"
        "src/test/java/org/robolectric/resources/R.java"
    ];
    static_libs = [
        "Robolectric_resources"
        "Robolectric_annotations"
        "Robolectric_utils"
        "mockito"
        "hamcrest"
        "guava"
        "objenesis"
        "junit"
        "truth-prebuilt"
        "jsr305"
    ];
    test_suites = ["general-tests"];
};

in { inherit Robolectric_resources Robolectric_resources_tests; }