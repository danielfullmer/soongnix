{ java_defaults, java_library, java_library_static }:
let

#
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

#  For platform use, builds directly against core-libart to avoid circular
#  dependencies. *NOT* for unbundled use.
libphonenumber-platform = java_library_static {
    name = "libphonenumber-platform";

    #  For the platform, compile everything except the carrier to phone number
    #  which isn't used.
    java_resource_dirs = [
        "repackaged/libphonenumber/src"
        "repackaged/geocoder/src"
        "repackaged/internal/prefixmapper/src"
    ];

    srcs = [
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/AlternateFormatsCountryCodeSet.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/AsYouTypeFormatter.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/CountryCodeToRegionCodeMap.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/MetadataLoader.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/MetadataManager.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/MetadataSource.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/MultiFileMetadataSourceImpl.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/NumberParseException.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/PhoneNumberMatch.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/PhoneNumberMatcher.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/PhoneNumberUtil.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/Phonemetadata.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/Phonenumber.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/ShortNumberInfo.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/ShortNumbersRegionCodeSet.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/SingleFileMetadataSourceImpl.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/internal/MatcherApi.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/internal/RegexBasedMatcher.java"
        "repackaged/libphonenumber/src/com/android/i18n/phonenumbers/internal/RegexCache.java"
        "repackaged/geocoder/src/com/android/i18n/phonenumbers/PhoneNumberToTimeZonesMapper.java"
        "repackaged/geocoder/src/com/android/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoder.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/DefaultMapStorage.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/FlyweightMapStorage.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/MappingFileProvider.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/PhonePrefixMap.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/PhonePrefixMapStorageStrategy.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/PrefixFileReader.java"
        "repackaged/internal/prefixmapper/src/com/android/i18n/phonenumbers/prefixmapper/PrefixTimeZonesMap.java"
    ];

    no_framework_libs = true;
};

libphonenumber-unbundled-defaults = java_defaults {
    name = "libphonenumber-unbundled-defaults";
    java_resource_dirs = [
        "libphonenumber/src"
        "carrier/src"
        "internal/prefixmapper/src"
    ];

    srcs = [
        "libphonenumber/src/com/google/i18n/phonenumbers/AlternateFormatsCountryCodeSet.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/AsYouTypeFormatter.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/CountryCodeToRegionCodeMap.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/MetadataLoader.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/MetadataManager.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/MetadataSource.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/MultiFileMetadataSourceImpl.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/NumberParseException.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/PhoneNumberMatch.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/PhoneNumberMatcher.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/PhoneNumberUtil.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/Phonemetadata.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/Phonenumber.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/ShortNumberInfo.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/ShortNumbersRegionCodeSet.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/SingleFileMetadataSourceImpl.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/internal/MatcherApi.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/internal/RegexBasedMatcher.java"
        "libphonenumber/src/com/google/i18n/phonenumbers/internal/RegexCache.java"
        "carrier/src/com/google/i18n/phonenumbers/PhoneNumberToCarrierMapper.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/DefaultMapStorage.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/FlyweightMapStorage.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/MappingFileProvider.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/PhonePrefixMap.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/PhonePrefixMapStorageStrategy.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/PrefixFileReader.java"
        "internal/prefixmapper/src/com/google/i18n/phonenumbers/prefixmapper/PrefixTimeZonesMap.java"
    ];
};

#  For unbundled use, supports gingerbread and up.
libphonenumber = java_library_static {
    name = "libphonenumber";
    defaults = ["libphonenumber-unbundled-defaults"];

    srcs = [
        "geocoder/src/com/google/i18n/phonenumbers/PhoneNumberToTimeZonesMapper.java"
        "geocoder/src/com/google/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoder.java"
    ];
    java_resource_dirs = ["geocoder/src"];

    sdk_version = "9";
    java_version = "1.7";
};

#  For unbundled use - without geocoder
libphonenumber-nogeocoder = java_library_static {
    name = "libphonenumber-nogeocoder";
    defaults = ["libphonenumber-unbundled-defaults"];

    sdk_version = "9";
    java_version = "1.7";
};

#  Tests for unbundled use.
#  vogar --timeout 0  \
#     --classpath out/target/common/obj/JAVA_LIBRARIES/libphonenumber-test_intermediates/classes.jack \
#     com.google.i18n.phonenumbers
libphonenumber_test = java_library {
    name = "libphonenumber_test";
    srcs = [
        "carrier/test/com/google/i18n/phonenumbers/PhoneNumberToCarrierMapperTest.java"
        "geocoder/test/com/google/i18n/phonenumbers/PhoneNumberToTimeZonesMapperTest.java"
        "geocoder/test/com/google/i18n/phonenumbers/geocoding/PhoneNumberOfflineGeocoderTest.java"
        "internal/prefixmapper/test/com/google/i18n/phonenumbers/prefixmapper/FlyweightMapStorageTest.java"
        "internal/prefixmapper/test/com/google/i18n/phonenumbers/prefixmapper/MappingFileProviderTest.java"
        "internal/prefixmapper/test/com/google/i18n/phonenumbers/prefixmapper/PhonePrefixMapTest.java"
        "internal/prefixmapper/test/com/google/i18n/phonenumbers/prefixmapper/PrefixFileReaderTest.java"
        "internal/prefixmapper/test/com/google/i18n/phonenumbers/prefixmapper/PrefixTimeZonesMapTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/AsYouTypeFormatterTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/CountryCodeToRegionCodeMapForTesting.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/ExampleNumbersTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/MetadataManagerTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/MultiFileMetadataSourceImplTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/PhoneNumberMatchTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/PhoneNumberMatcherTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/PhoneNumberUtilTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/PhonenumberTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/RegionCode.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/ShortNumberInfoTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/SingleFileMetadataSourceImplTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/TestMetadataTestCase.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/internal/MatcherTest.java"
        "libphonenumber/test/com/google/i18n/phonenumbers/internal/RegexCacheTest.java"
    ];

    java_resource_dirs = [
        "carrier/test"
        "geocoder/test"
        "libphonenumber/test"
    ];

    sdk_version = "current";
    static_libs = [
        "libphonenumber"
        "junit"
    ];
    java_version = "1.7";
};

in { inherit libphonenumber libphonenumber-nogeocoder libphonenumber-platform libphonenumber-unbundled-defaults libphonenumber_test; }
