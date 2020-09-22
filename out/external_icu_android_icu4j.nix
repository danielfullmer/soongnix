{ droidstubs, filegroup, java_library, java_library_static, java_test, package }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

_missingName = package {
    default_visibility = ["//visibility:private"];
};

# ==========================================================
#  build repackaged ICU for target
#
#  This is done in the libcore/JavaLibraries.mk file as there are circular
#  dependencies between ICU and libcore
# ==========================================================
android_icu4j_public_api_files = filegroup {
    name = "android_icu4j_public_api_files";
    visibility = [
        "//frameworks/base"
    ];
    srcs = [
        ":android_icu4j_repackaged_src_files"
    ];
    path = "src/main/java";
};

android_icu4j_repackaged_src_files = filegroup {
    name = "android_icu4j_repackaged_src_files";
    srcs = [
        "src/main/java/android/icu/impl/Assert.java"
        "src/main/java/android/icu/impl/BMPSet.java"
        "src/main/java/android/icu/impl/CSCharacterIterator.java"
        "src/main/java/android/icu/impl/CacheBase.java"
        "src/main/java/android/icu/impl/CacheValue.java"
        "src/main/java/android/icu/impl/CalType.java"
        "src/main/java/android/icu/impl/CalendarAstronomer.java"
        "src/main/java/android/icu/impl/CalendarCache.java"
        "src/main/java/android/icu/impl/CalendarUtil.java"
        "src/main/java/android/icu/impl/CaseMapImpl.java"
        "src/main/java/android/icu/impl/CharTrie.java"
        "src/main/java/android/icu/impl/CharacterIteration.java"
        "src/main/java/android/icu/impl/CharacterIteratorWrapper.java"
        "src/main/java/android/icu/impl/CharacterPropertiesImpl.java"
        "src/main/java/android/icu/impl/ClassLoaderUtil.java"
        "src/main/java/android/icu/impl/CollectionSet.java"
        "src/main/java/android/icu/impl/CurrencyData.java"
        "src/main/java/android/icu/impl/DateNumberFormat.java"
        "src/main/java/android/icu/impl/DayPeriodRules.java"
        "src/main/java/android/icu/impl/DontCareFieldPosition.java"
        "src/main/java/android/icu/impl/EraRules.java"
        "src/main/java/android/icu/impl/FormattedStringBuilder.java"
        "src/main/java/android/icu/impl/FormattedValueFieldPositionIteratorImpl.java"
        "src/main/java/android/icu/impl/FormattedValueStringBuilderImpl.java"
        "src/main/java/android/icu/impl/Grego.java"
        "src/main/java/android/icu/impl/ICUBinary.java"
        "src/main/java/android/icu/impl/ICUCache.java"
        "src/main/java/android/icu/impl/ICUConfig.java"
        "src/main/java/android/icu/impl/ICUCurrencyDisplayInfoProvider.java"
        "src/main/java/android/icu/impl/ICUCurrencyMetaInfo.java"
        "src/main/java/android/icu/impl/ICUData.java"
        "src/main/java/android/icu/impl/ICUDataVersion.java"
        "src/main/java/android/icu/impl/ICUDebug.java"
        "src/main/java/android/icu/impl/ICULangDataTables.java"
        "src/main/java/android/icu/impl/ICULocaleService.java"
        "src/main/java/android/icu/impl/ICUNotifier.java"
        "src/main/java/android/icu/impl/ICURWLock.java"
        "src/main/java/android/icu/impl/ICURegionDataTables.java"
        "src/main/java/android/icu/impl/ICUResourceBundle.java"
        "src/main/java/android/icu/impl/ICUResourceBundleImpl.java"
        "src/main/java/android/icu/impl/ICUResourceBundleReader.java"
        "src/main/java/android/icu/impl/ICUResourceTableAccess.java"
        "src/main/java/android/icu/impl/ICUService.java"
        "src/main/java/android/icu/impl/IDNA2003.java"
        "src/main/java/android/icu/impl/IllegalIcuArgumentException.java"
        "src/main/java/android/icu/impl/IntTrie.java"
        "src/main/java/android/icu/impl/IntTrieBuilder.java"
        "src/main/java/android/icu/impl/InvalidFormatException.java"
        "src/main/java/android/icu/impl/IterableComparator.java"
        "src/main/java/android/icu/impl/JavaTimeZone.java"
        "src/main/java/android/icu/impl/LocaleDisplayNamesImpl.java"
        "src/main/java/android/icu/impl/LocaleIDParser.java"
        "src/main/java/android/icu/impl/LocaleIDs.java"
        "src/main/java/android/icu/impl/LocaleUtility.java"
        "src/main/java/android/icu/impl/Norm2AllModes.java"
        "src/main/java/android/icu/impl/Normalizer2Impl.java"
        "src/main/java/android/icu/impl/OlsonTimeZone.java"
        "src/main/java/android/icu/impl/PVecToTrieCompactHandler.java"
        "src/main/java/android/icu/impl/Pair.java"
        "src/main/java/android/icu/impl/PatternProps.java"
        "src/main/java/android/icu/impl/PatternTokenizer.java"
        "src/main/java/android/icu/impl/PluralRulesLoader.java"
        "src/main/java/android/icu/impl/PropsVectors.java"
        "src/main/java/android/icu/impl/Punycode.java"
        "src/main/java/android/icu/impl/RBBIDataWrapper.java"
        "src/main/java/android/icu/impl/Relation.java"
        "src/main/java/android/icu/impl/RelativeDateFormat.java"
        "src/main/java/android/icu/impl/ReplaceableUCharacterIterator.java"
        "src/main/java/android/icu/impl/ResourceBundleWrapper.java"
        "src/main/java/android/icu/impl/Row.java"
        "src/main/java/android/icu/impl/RuleCharacterIterator.java"
        "src/main/java/android/icu/impl/SimpleCache.java"
        "src/main/java/android/icu/impl/SimpleFilteredSentenceBreakIterator.java"
        "src/main/java/android/icu/impl/SimpleFormatterImpl.java"
        "src/main/java/android/icu/impl/SoftCache.java"
        "src/main/java/android/icu/impl/SortedSetRelation.java"
        "src/main/java/android/icu/impl/StandardPlural.java"
        "src/main/java/android/icu/impl/StaticUnicodeSets.java"
        "src/main/java/android/icu/impl/StringPrepDataReader.java"
        "src/main/java/android/icu/impl/StringRange.java"
        "src/main/java/android/icu/impl/StringSegment.java"
        "src/main/java/android/icu/impl/TZDBTimeZoneNames.java"
        "src/main/java/android/icu/impl/TextTrieMap.java"
        "src/main/java/android/icu/impl/TimeZoneAdapter.java"
        "src/main/java/android/icu/impl/TimeZoneGenericNames.java"
        "src/main/java/android/icu/impl/TimeZoneNamesFactoryImpl.java"
        "src/main/java/android/icu/impl/TimeZoneNamesImpl.java"
        "src/main/java/android/icu/impl/Trie.java"
        "src/main/java/android/icu/impl/Trie2.java"
        "src/main/java/android/icu/impl/Trie2Writable.java"
        "src/main/java/android/icu/impl/Trie2_16.java"
        "src/main/java/android/icu/impl/Trie2_32.java"
        "src/main/java/android/icu/impl/TrieBuilder.java"
        "src/main/java/android/icu/impl/TrieIterator.java"
        "src/main/java/android/icu/impl/UBiDiProps.java"
        "src/main/java/android/icu/impl/UCaseProps.java"
        "src/main/java/android/icu/impl/UCharArrayIterator.java"
        "src/main/java/android/icu/impl/UCharacterIteratorWrapper.java"
        "src/main/java/android/icu/impl/UCharacterName.java"
        "src/main/java/android/icu/impl/UCharacterNameChoice.java"
        "src/main/java/android/icu/impl/UCharacterNameReader.java"
        "src/main/java/android/icu/impl/UCharacterProperty.java"
        "src/main/java/android/icu/impl/UCharacterUtility.java"
        "src/main/java/android/icu/impl/UPropertyAliases.java"
        "src/main/java/android/icu/impl/URLHandler.java"
        "src/main/java/android/icu/impl/UResource.java"
        "src/main/java/android/icu/impl/USerializedSet.java"
        "src/main/java/android/icu/impl/UTS46.java"
        "src/main/java/android/icu/impl/UnicodeRegex.java"
        "src/main/java/android/icu/impl/UnicodeSetStringSpan.java"
        "src/main/java/android/icu/impl/Utility.java"
        "src/main/java/android/icu/impl/UtilityExtensions.java"
        "src/main/java/android/icu/impl/ValidIdentifiers.java"
        "src/main/java/android/icu/impl/ZoneMeta.java"
        "src/main/java/android/icu/impl/coll/BOCSU.java"
        "src/main/java/android/icu/impl/coll/Collation.java"
        "src/main/java/android/icu/impl/coll/CollationBuilder.java"
        "src/main/java/android/icu/impl/coll/CollationCompare.java"
        "src/main/java/android/icu/impl/coll/CollationData.java"
        "src/main/java/android/icu/impl/coll/CollationDataBuilder.java"
        "src/main/java/android/icu/impl/coll/CollationDataReader.java"
        "src/main/java/android/icu/impl/coll/CollationFCD.java"
        "src/main/java/android/icu/impl/coll/CollationFastLatin.java"
        "src/main/java/android/icu/impl/coll/CollationFastLatinBuilder.java"
        "src/main/java/android/icu/impl/coll/CollationIterator.java"
        "src/main/java/android/icu/impl/coll/CollationKeys.java"
        "src/main/java/android/icu/impl/coll/CollationLoader.java"
        "src/main/java/android/icu/impl/coll/CollationRoot.java"
        "src/main/java/android/icu/impl/coll/CollationRootElements.java"
        "src/main/java/android/icu/impl/coll/CollationRuleParser.java"
        "src/main/java/android/icu/impl/coll/CollationSettings.java"
        "src/main/java/android/icu/impl/coll/CollationTailoring.java"
        "src/main/java/android/icu/impl/coll/CollationWeights.java"
        "src/main/java/android/icu/impl/coll/ContractionsAndExpansions.java"
        "src/main/java/android/icu/impl/coll/FCDIterCollationIterator.java"
        "src/main/java/android/icu/impl/coll/FCDUTF16CollationIterator.java"
        "src/main/java/android/icu/impl/coll/IterCollationIterator.java"
        "src/main/java/android/icu/impl/coll/SharedObject.java"
        "src/main/java/android/icu/impl/coll/TailoredSet.java"
        "src/main/java/android/icu/impl/coll/UTF16CollationIterator.java"
        "src/main/java/android/icu/impl/coll/UVector32.java"
        "src/main/java/android/icu/impl/coll/UVector64.java"
        "src/main/java/android/icu/impl/data/HolidayBundle.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_da.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_da_DK.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_de.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_de_AT.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_de_DE.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_el.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_el_GR.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_en.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_en_CA.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_en_GB.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_en_US.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_es.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_es_MX.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_fr.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_fr_CA.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_fr_FR.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_it.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_it_IT.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_iw.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_iw_IL.java"
        "src/main/java/android/icu/impl/data/HolidayBundle_ja_JP.java"
        "src/main/java/android/icu/impl/data/ResourceReader.java"
        "src/main/java/android/icu/impl/data/TokenIterator.java"
        "src/main/java/android/icu/impl/duration/BasicDurationFormat.java"
        "src/main/java/android/icu/impl/duration/BasicDurationFormatter.java"
        "src/main/java/android/icu/impl/duration/BasicDurationFormatterFactory.java"
        "src/main/java/android/icu/impl/duration/BasicPeriodBuilderFactory.java"
        "src/main/java/android/icu/impl/duration/BasicPeriodFormatter.java"
        "src/main/java/android/icu/impl/duration/BasicPeriodFormatterFactory.java"
        "src/main/java/android/icu/impl/duration/BasicPeriodFormatterService.java"
        "src/main/java/android/icu/impl/duration/DateFormatter.java"
        "src/main/java/android/icu/impl/duration/DurationFormatter.java"
        "src/main/java/android/icu/impl/duration/DurationFormatterFactory.java"
        "src/main/java/android/icu/impl/duration/Period.java"
        "src/main/java/android/icu/impl/duration/PeriodBuilder.java"
        "src/main/java/android/icu/impl/duration/PeriodBuilderFactory.java"
        "src/main/java/android/icu/impl/duration/PeriodFormatter.java"
        "src/main/java/android/icu/impl/duration/PeriodFormatterFactory.java"
        "src/main/java/android/icu/impl/duration/PeriodFormatterService.java"
        "src/main/java/android/icu/impl/duration/TimeUnit.java"
        "src/main/java/android/icu/impl/duration/TimeUnitConstants.java"
        "src/main/java/android/icu/impl/duration/impl/DataRecord.java"
        "src/main/java/android/icu/impl/duration/impl/PeriodFormatterData.java"
        "src/main/java/android/icu/impl/duration/impl/PeriodFormatterDataService.java"
        "src/main/java/android/icu/impl/duration/impl/RecordReader.java"
        "src/main/java/android/icu/impl/duration/impl/RecordWriter.java"
        "src/main/java/android/icu/impl/duration/impl/ResourceBasedPeriodFormatterDataService.java"
        "src/main/java/android/icu/impl/duration/impl/Utils.java"
        "src/main/java/android/icu/impl/duration/impl/XMLRecordReader.java"
        "src/main/java/android/icu/impl/duration/impl/XMLRecordWriter.java"
        "src/main/java/android/icu/impl/locale/AsciiUtil.java"
        "src/main/java/android/icu/impl/locale/BaseLocale.java"
        "src/main/java/android/icu/impl/locale/Extension.java"
        "src/main/java/android/icu/impl/locale/InternalLocaleBuilder.java"
        "src/main/java/android/icu/impl/locale/KeyTypeData.java"
        "src/main/java/android/icu/impl/locale/LSR.java"
        "src/main/java/android/icu/impl/locale/LanguageTag.java"
        "src/main/java/android/icu/impl/locale/LocaleDistance.java"
        "src/main/java/android/icu/impl/locale/LocaleExtensions.java"
        "src/main/java/android/icu/impl/locale/LocaleObjectCache.java"
        "src/main/java/android/icu/impl/locale/LocaleSyntaxException.java"
        "src/main/java/android/icu/impl/locale/LocaleValidityChecker.java"
        "src/main/java/android/icu/impl/locale/ParseStatus.java"
        "src/main/java/android/icu/impl/locale/StringTokenIterator.java"
        "src/main/java/android/icu/impl/locale/UnicodeLocaleExtension.java"
        "src/main/java/android/icu/impl/locale/XCldrStub.java"
        "src/main/java/android/icu/impl/locale/XLikelySubtags.java"
        "src/main/java/android/icu/impl/number/AdoptingModifierStore.java"
        "src/main/java/android/icu/impl/number/AffixPatternProvider.java"
        "src/main/java/android/icu/impl/number/AffixUtils.java"
        "src/main/java/android/icu/impl/number/CompactData.java"
        "src/main/java/android/icu/impl/number/ConstantAffixModifier.java"
        "src/main/java/android/icu/impl/number/ConstantMultiFieldModifier.java"
        "src/main/java/android/icu/impl/number/CurrencyPluralInfoAffixProvider.java"
        "src/main/java/android/icu/impl/number/CurrencySpacingEnabledModifier.java"
        "src/main/java/android/icu/impl/number/CustomSymbolCurrency.java"
        "src/main/java/android/icu/impl/number/DecimalFormatProperties.java"
        "src/main/java/android/icu/impl/number/DecimalQuantity.java"
        "src/main/java/android/icu/impl/number/DecimalQuantity_AbstractBCD.java"
        "src/main/java/android/icu/impl/number/DecimalQuantity_DualStorageBCD.java"
        "src/main/java/android/icu/impl/number/Grouper.java"
        "src/main/java/android/icu/impl/number/LocalizedNumberFormatterAsFormat.java"
        "src/main/java/android/icu/impl/number/LongNameHandler.java"
        "src/main/java/android/icu/impl/number/MacroProps.java"
        "src/main/java/android/icu/impl/number/MicroProps.java"
        "src/main/java/android/icu/impl/number/MicroPropsGenerator.java"
        "src/main/java/android/icu/impl/number/MicroPropsMutator.java"
        "src/main/java/android/icu/impl/number/Modifier.java"
        "src/main/java/android/icu/impl/number/ModifierStore.java"
        "src/main/java/android/icu/impl/number/MultiplierFormatHandler.java"
        "src/main/java/android/icu/impl/number/MultiplierProducer.java"
        "src/main/java/android/icu/impl/number/MutablePatternModifier.java"
        "src/main/java/android/icu/impl/number/Padder.java"
        "src/main/java/android/icu/impl/number/PatternStringParser.java"
        "src/main/java/android/icu/impl/number/PatternStringUtils.java"
        "src/main/java/android/icu/impl/number/Properties.java"
        "src/main/java/android/icu/impl/number/PropertiesAffixPatternProvider.java"
        "src/main/java/android/icu/impl/number/RoundingUtils.java"
        "src/main/java/android/icu/impl/number/SimpleModifier.java"
        "src/main/java/android/icu/impl/number/parse/AffixMatcher.java"
        "src/main/java/android/icu/impl/number/parse/AffixPatternMatcher.java"
        "src/main/java/android/icu/impl/number/parse/AffixTokenMatcherFactory.java"
        "src/main/java/android/icu/impl/number/parse/CodePointMatcher.java"
        "src/main/java/android/icu/impl/number/parse/CombinedCurrencyMatcher.java"
        "src/main/java/android/icu/impl/number/parse/DecimalMatcher.java"
        "src/main/java/android/icu/impl/number/parse/IgnorablesMatcher.java"
        "src/main/java/android/icu/impl/number/parse/InfinityMatcher.java"
        "src/main/java/android/icu/impl/number/parse/MinusSignMatcher.java"
        "src/main/java/android/icu/impl/number/parse/MultiplierParseHandler.java"
        "src/main/java/android/icu/impl/number/parse/NanMatcher.java"
        "src/main/java/android/icu/impl/number/parse/NumberParseMatcher.java"
        "src/main/java/android/icu/impl/number/parse/NumberParserImpl.java"
        "src/main/java/android/icu/impl/number/parse/PaddingMatcher.java"
        "src/main/java/android/icu/impl/number/parse/ParsedNumber.java"
        "src/main/java/android/icu/impl/number/parse/ParsingUtils.java"
        "src/main/java/android/icu/impl/number/parse/PercentMatcher.java"
        "src/main/java/android/icu/impl/number/parse/PermilleMatcher.java"
        "src/main/java/android/icu/impl/number/parse/PlusSignMatcher.java"
        "src/main/java/android/icu/impl/number/parse/RequireAffixValidator.java"
        "src/main/java/android/icu/impl/number/parse/RequireCurrencyValidator.java"
        "src/main/java/android/icu/impl/number/parse/RequireDecimalSeparatorValidator.java"
        "src/main/java/android/icu/impl/number/parse/RequireNumberValidator.java"
        "src/main/java/android/icu/impl/number/parse/ScientificMatcher.java"
        "src/main/java/android/icu/impl/number/parse/SeriesMatcher.java"
        "src/main/java/android/icu/impl/number/parse/SymbolMatcher.java"
        "src/main/java/android/icu/impl/number/parse/ValidationMatcher.java"
        "src/main/java/android/icu/impl/number/range/PrefixInfixSuffixLengthHelper.java"
        "src/main/java/android/icu/impl/number/range/RangeMacroProps.java"
        "src/main/java/android/icu/impl/number/range/StandardPluralRanges.java"
        "src/main/java/android/icu/impl/text/RbnfScannerProviderImpl.java"
        "src/main/java/android/icu/lang/CharSequences.java"
        "src/main/java/android/icu/lang/CharacterProperties.java"
        "src/main/java/android/icu/lang/UCharacter.java"
        "src/main/java/android/icu/lang/UCharacterCategory.java"
        "src/main/java/android/icu/lang/UCharacterDirection.java"
        "src/main/java/android/icu/lang/UCharacterEnums.java"
        "src/main/java/android/icu/lang/UCharacterNameIterator.java"
        "src/main/java/android/icu/lang/UProperty.java"
        "src/main/java/android/icu/lang/UScript.java"
        "src/main/java/android/icu/lang/UScriptRun.java"
        "src/main/java/android/icu/math/BigDecimal.java"
        "src/main/java/android/icu/math/MathContext.java"
        "src/main/java/android/icu/number/CompactNotation.java"
        "src/main/java/android/icu/number/CurrencyPrecision.java"
        "src/main/java/android/icu/number/FormattedNumber.java"
        "src/main/java/android/icu/number/FormattedNumberRange.java"
        "src/main/java/android/icu/number/FractionPrecision.java"
        "src/main/java/android/icu/number/IntegerWidth.java"
        "src/main/java/android/icu/number/LocalizedNumberFormatter.java"
        "src/main/java/android/icu/number/LocalizedNumberRangeFormatter.java"
        "src/main/java/android/icu/number/Notation.java"
        "src/main/java/android/icu/number/NumberFormatter.java"
        "src/main/java/android/icu/number/NumberFormatterImpl.java"
        "src/main/java/android/icu/number/NumberFormatterSettings.java"
        "src/main/java/android/icu/number/NumberPropertyMapper.java"
        "src/main/java/android/icu/number/NumberRangeFormatter.java"
        "src/main/java/android/icu/number/NumberRangeFormatterImpl.java"
        "src/main/java/android/icu/number/NumberRangeFormatterSettings.java"
        "src/main/java/android/icu/number/NumberSkeletonImpl.java"
        "src/main/java/android/icu/number/Precision.java"
        "src/main/java/android/icu/number/Scale.java"
        "src/main/java/android/icu/number/ScientificNotation.java"
        "src/main/java/android/icu/number/SimpleNotation.java"
        "src/main/java/android/icu/number/SkeletonSyntaxException.java"
        "src/main/java/android/icu/number/UnlocalizedNumberFormatter.java"
        "src/main/java/android/icu/number/UnlocalizedNumberRangeFormatter.java"
        "src/main/java/android/icu/text/AlphabeticIndex.java"
        "src/main/java/android/icu/text/AnyTransliterator.java"
        "src/main/java/android/icu/text/ArabicShaping.java"
        "src/main/java/android/icu/text/ArabicShapingException.java"
        "src/main/java/android/icu/text/Bidi.java"
        "src/main/java/android/icu/text/BidiClassifier.java"
        "src/main/java/android/icu/text/BidiLine.java"
        "src/main/java/android/icu/text/BidiRun.java"
        "src/main/java/android/icu/text/BidiTransform.java"
        "src/main/java/android/icu/text/BidiWriter.java"
        "src/main/java/android/icu/text/BreakIterator.java"
        "src/main/java/android/icu/text/BreakIteratorFactory.java"
        "src/main/java/android/icu/text/BreakTransliterator.java"
        "src/main/java/android/icu/text/BurmeseBreakEngine.java"
        "src/main/java/android/icu/text/BytesDictionaryMatcher.java"
        "src/main/java/android/icu/text/CanonicalIterator.java"
        "src/main/java/android/icu/text/CaseFoldTransliterator.java"
        "src/main/java/android/icu/text/CaseMap.java"
        "src/main/java/android/icu/text/CharsDictionaryMatcher.java"
        "src/main/java/android/icu/text/CharsetDetector.java"
        "src/main/java/android/icu/text/CharsetMatch.java"
        "src/main/java/android/icu/text/CharsetRecog_2022.java"
        "src/main/java/android/icu/text/CharsetRecog_UTF8.java"
        "src/main/java/android/icu/text/CharsetRecog_Unicode.java"
        "src/main/java/android/icu/text/CharsetRecog_mbcs.java"
        "src/main/java/android/icu/text/CharsetRecog_sbcs.java"
        "src/main/java/android/icu/text/CharsetRecognizer.java"
        "src/main/java/android/icu/text/ChineseDateFormat.java"
        "src/main/java/android/icu/text/ChineseDateFormatSymbols.java"
        "src/main/java/android/icu/text/CjkBreakEngine.java"
        "src/main/java/android/icu/text/CollationElementIterator.java"
        "src/main/java/android/icu/text/CollationKey.java"
        "src/main/java/android/icu/text/Collator.java"
        "src/main/java/android/icu/text/CollatorServiceShim.java"
        "src/main/java/android/icu/text/CompactDecimalFormat.java"
        "src/main/java/android/icu/text/ComposedCharIter.java"
        "src/main/java/android/icu/text/CompoundTransliterator.java"
        "src/main/java/android/icu/text/ConstrainedFieldPosition.java"
        "src/main/java/android/icu/text/CurrencyDisplayNames.java"
        "src/main/java/android/icu/text/CurrencyFormat.java"
        "src/main/java/android/icu/text/CurrencyMetaInfo.java"
        "src/main/java/android/icu/text/CurrencyPluralInfo.java"
        "src/main/java/android/icu/text/DateFormat.java"
        "src/main/java/android/icu/text/DateFormatSymbols.java"
        "src/main/java/android/icu/text/DateIntervalFormat.java"
        "src/main/java/android/icu/text/DateIntervalInfo.java"
        "src/main/java/android/icu/text/DateTimePatternGenerator.java"
        "src/main/java/android/icu/text/DecimalFormat.java"
        "src/main/java/android/icu/text/DecimalFormatSymbols.java"
        "src/main/java/android/icu/text/DictionaryBreakEngine.java"
        "src/main/java/android/icu/text/DictionaryData.java"
        "src/main/java/android/icu/text/DictionaryMatcher.java"
        "src/main/java/android/icu/text/DisplayContext.java"
        "src/main/java/android/icu/text/DurationFormat.java"
        "src/main/java/android/icu/text/Edits.java"
        "src/main/java/android/icu/text/EscapeTransliterator.java"
        "src/main/java/android/icu/text/FilteredBreakIteratorBuilder.java"
        "src/main/java/android/icu/text/FilteredNormalizer2.java"
        "src/main/java/android/icu/text/FormattedValue.java"
        "src/main/java/android/icu/text/FunctionReplacer.java"
        "src/main/java/android/icu/text/IDNA.java"
        "src/main/java/android/icu/text/KhmerBreakEngine.java"
        "src/main/java/android/icu/text/LanguageBreakEngine.java"
        "src/main/java/android/icu/text/LaoBreakEngine.java"
        "src/main/java/android/icu/text/ListFormatter.java"
        "src/main/java/android/icu/text/LocaleDisplayNames.java"
        "src/main/java/android/icu/text/LowercaseTransliterator.java"
        "src/main/java/android/icu/text/MeasureFormat.java"
        "src/main/java/android/icu/text/MessageFormat.java"
        "src/main/java/android/icu/text/MessagePattern.java"
        "src/main/java/android/icu/text/MessagePatternUtil.java"
        "src/main/java/android/icu/text/NFRule.java"
        "src/main/java/android/icu/text/NFRuleSet.java"
        "src/main/java/android/icu/text/NFSubstitution.java"
        "src/main/java/android/icu/text/NameUnicodeTransliterator.java"
        "src/main/java/android/icu/text/NormalizationTransliterator.java"
        "src/main/java/android/icu/text/Normalizer.java"
        "src/main/java/android/icu/text/Normalizer2.java"
        "src/main/java/android/icu/text/NullTransliterator.java"
        "src/main/java/android/icu/text/NumberFormat.java"
        "src/main/java/android/icu/text/NumberFormatServiceShim.java"
        "src/main/java/android/icu/text/NumberingSystem.java"
        "src/main/java/android/icu/text/PluralFormat.java"
        "src/main/java/android/icu/text/PluralRanges.java"
        "src/main/java/android/icu/text/PluralRules.java"
        "src/main/java/android/icu/text/PluralRulesSerialProxy.java"
        "src/main/java/android/icu/text/PluralSamples.java"
        "src/main/java/android/icu/text/Quantifier.java"
        "src/main/java/android/icu/text/QuantityFormatter.java"
        "src/main/java/android/icu/text/RBBINode.java"
        "src/main/java/android/icu/text/RBBIRuleBuilder.java"
        "src/main/java/android/icu/text/RBBIRuleParseTable.java"
        "src/main/java/android/icu/text/RBBIRuleScanner.java"
        "src/main/java/android/icu/text/RBBISetBuilder.java"
        "src/main/java/android/icu/text/RBBISymbolTable.java"
        "src/main/java/android/icu/text/RBBITableBuilder.java"
        "src/main/java/android/icu/text/RBNFChinesePostProcessor.java"
        "src/main/java/android/icu/text/RBNFPostProcessor.java"
        "src/main/java/android/icu/text/RawCollationKey.java"
        "src/main/java/android/icu/text/RbnfLenientScanner.java"
        "src/main/java/android/icu/text/RbnfLenientScannerProvider.java"
        "src/main/java/android/icu/text/RelativeDateTimeFormatter.java"
        "src/main/java/android/icu/text/RemoveTransliterator.java"
        "src/main/java/android/icu/text/Replaceable.java"
        "src/main/java/android/icu/text/ReplaceableContextIterator.java"
        "src/main/java/android/icu/text/ReplaceableString.java"
        "src/main/java/android/icu/text/RuleBasedBreakIterator.java"
        "src/main/java/android/icu/text/RuleBasedCollator.java"
        "src/main/java/android/icu/text/RuleBasedNumberFormat.java"
        "src/main/java/android/icu/text/RuleBasedTransliterator.java"
        "src/main/java/android/icu/text/SCSU.java"
        "src/main/java/android/icu/text/ScientificNumberFormatter.java"
        "src/main/java/android/icu/text/SearchIterator.java"
        "src/main/java/android/icu/text/SelectFormat.java"
        "src/main/java/android/icu/text/SimpleDateFormat.java"
        "src/main/java/android/icu/text/SimpleFormatter.java"
        "src/main/java/android/icu/text/SourceTargetUtility.java"
        "src/main/java/android/icu/text/SpoofChecker.java"
        "src/main/java/android/icu/text/StringCharacterIterator.java"
        "src/main/java/android/icu/text/StringMatcher.java"
        "src/main/java/android/icu/text/StringPrep.java"
        "src/main/java/android/icu/text/StringPrepParseException.java"
        "src/main/java/android/icu/text/StringReplacer.java"
        "src/main/java/android/icu/text/StringSearch.java"
        "src/main/java/android/icu/text/StringTransform.java"
        "src/main/java/android/icu/text/SymbolTable.java"
        "src/main/java/android/icu/text/ThaiBreakEngine.java"
        "src/main/java/android/icu/text/TimeUnitFormat.java"
        "src/main/java/android/icu/text/TimeZoneFormat.java"
        "src/main/java/android/icu/text/TimeZoneNames.java"
        "src/main/java/android/icu/text/TitlecaseTransliterator.java"
        "src/main/java/android/icu/text/Transform.java"
        "src/main/java/android/icu/text/TransliterationRule.java"
        "src/main/java/android/icu/text/TransliterationRuleSet.java"
        "src/main/java/android/icu/text/Transliterator.java"
        "src/main/java/android/icu/text/TransliteratorIDParser.java"
        "src/main/java/android/icu/text/TransliteratorParser.java"
        "src/main/java/android/icu/text/TransliteratorRegistry.java"
        "src/main/java/android/icu/text/UCharacterIterator.java"
        "src/main/java/android/icu/text/UFieldPosition.java"
        "src/main/java/android/icu/text/UFormat.java"
        "src/main/java/android/icu/text/UForwardCharacterIterator.java"
        "src/main/java/android/icu/text/UTF16.java"
        "src/main/java/android/icu/text/UnescapeTransliterator.java"
        "src/main/java/android/icu/text/UnhandledBreakEngine.java"
        "src/main/java/android/icu/text/UnicodeCompressor.java"
        "src/main/java/android/icu/text/UnicodeDecompressor.java"
        "src/main/java/android/icu/text/UnicodeFilter.java"
        "src/main/java/android/icu/text/UnicodeMatcher.java"
        "src/main/java/android/icu/text/UnicodeNameTransliterator.java"
        "src/main/java/android/icu/text/UnicodeReplacer.java"
        "src/main/java/android/icu/text/UnicodeSet.java"
        "src/main/java/android/icu/text/UnicodeSetIterator.java"
        "src/main/java/android/icu/text/UnicodeSetSpanner.java"
        "src/main/java/android/icu/text/UppercaseTransliterator.java"
        "src/main/java/android/icu/util/AnnualTimeZoneRule.java"
        "src/main/java/android/icu/util/BasicTimeZone.java"
        "src/main/java/android/icu/util/BuddhistCalendar.java"
        "src/main/java/android/icu/util/ByteArrayWrapper.java"
        "src/main/java/android/icu/util/BytesTrie.java"
        "src/main/java/android/icu/util/BytesTrieBuilder.java"
        "src/main/java/android/icu/util/CECalendar.java"
        "src/main/java/android/icu/util/Calendar.java"
        "src/main/java/android/icu/util/CaseInsensitiveString.java"
        "src/main/java/android/icu/util/CharsTrie.java"
        "src/main/java/android/icu/util/CharsTrieBuilder.java"
        "src/main/java/android/icu/util/ChineseCalendar.java"
        "src/main/java/android/icu/util/CodePointMap.java"
        "src/main/java/android/icu/util/CodePointTrie.java"
        "src/main/java/android/icu/util/CompactByteArray.java"
        "src/main/java/android/icu/util/CompactCharArray.java"
        "src/main/java/android/icu/util/CopticCalendar.java"
        "src/main/java/android/icu/util/Currency.java"
        "src/main/java/android/icu/util/CurrencyAmount.java"
        "src/main/java/android/icu/util/CurrencyServiceShim.java"
        "src/main/java/android/icu/util/DangiCalendar.java"
        "src/main/java/android/icu/util/DateInterval.java"
        "src/main/java/android/icu/util/DateRule.java"
        "src/main/java/android/icu/util/DateTimeRule.java"
        "src/main/java/android/icu/util/EasterHoliday.java"
        "src/main/java/android/icu/util/EthiopicCalendar.java"
        "src/main/java/android/icu/util/Freezable.java"
        "src/main/java/android/icu/util/GenderInfo.java"
        "src/main/java/android/icu/util/GlobalizationPreferences.java"
        "src/main/java/android/icu/util/GregorianCalendar.java"
        "src/main/java/android/icu/util/HebrewCalendar.java"
        "src/main/java/android/icu/util/HebrewHoliday.java"
        "src/main/java/android/icu/util/Holiday.java"
        "src/main/java/android/icu/util/ICUCloneNotSupportedException.java"
        "src/main/java/android/icu/util/ICUException.java"
        "src/main/java/android/icu/util/ICUUncheckedIOException.java"
        "src/main/java/android/icu/util/IllformedLocaleException.java"
        "src/main/java/android/icu/util/IndianCalendar.java"
        "src/main/java/android/icu/util/InitialTimeZoneRule.java"
        "src/main/java/android/icu/util/IslamicCalendar.java"
        "src/main/java/android/icu/util/JapaneseCalendar.java"
        "src/main/java/android/icu/util/LocaleData.java"
        "src/main/java/android/icu/util/LocaleMatcher.java"
        "src/main/java/android/icu/util/LocalePriorityList.java"
        "src/main/java/android/icu/util/Measure.java"
        "src/main/java/android/icu/util/MeasureUnit.java"
        "src/main/java/android/icu/util/MutableCodePointTrie.java"
        "src/main/java/android/icu/util/NoUnit.java"
        "src/main/java/android/icu/util/Output.java"
        "src/main/java/android/icu/util/OutputInt.java"
        "src/main/java/android/icu/util/PersianCalendar.java"
        "src/main/java/android/icu/util/RangeDateRule.java"
        "src/main/java/android/icu/util/RangeValueIterator.java"
        "src/main/java/android/icu/util/Region.java"
        "src/main/java/android/icu/util/RuleBasedTimeZone.java"
        "src/main/java/android/icu/util/STZInfo.java"
        "src/main/java/android/icu/util/SimpleDateRule.java"
        "src/main/java/android/icu/util/SimpleHoliday.java"
        "src/main/java/android/icu/util/SimpleTimeZone.java"
        "src/main/java/android/icu/util/StringTokenizer.java"
        "src/main/java/android/icu/util/StringTrieBuilder.java"
        "src/main/java/android/icu/util/TaiwanCalendar.java"
        "src/main/java/android/icu/util/TimeArrayTimeZoneRule.java"
        "src/main/java/android/icu/util/TimeUnit.java"
        "src/main/java/android/icu/util/TimeUnitAmount.java"
        "src/main/java/android/icu/util/TimeZone.java"
        "src/main/java/android/icu/util/TimeZoneRule.java"
        "src/main/java/android/icu/util/TimeZoneTransition.java"
        "src/main/java/android/icu/util/ULocale.java"
        "src/main/java/android/icu/util/UResourceBundle.java"
        "src/main/java/android/icu/util/UResourceBundleIterator.java"
        "src/main/java/android/icu/util/UResourceTypeMismatchException.java"
        "src/main/java/android/icu/util/UniversalTimeScale.java"
        "src/main/java/android/icu/util/VTimeZone.java"
        "src/main/java/android/icu/util/ValueIterator.java"
        "src/main/java/android/icu/util/VersionInfo.java"
    ];
    path = "src/main/java";
};

#  The files contains Android-specific codes to expose intra-core APIs
#  from ICU4J/ICU4C to libcore. The package is com.android.icu.* and should not
#  expose any public APIs.
libcore_icu_bridge_src_files = filegroup {
    name = "libcore_icu_bridge_src_files";
    srcs = [
        "libcore_bridge/src/java/com/android/icu/charset/CharsetDecoderICU.java"
        "libcore_bridge/src/java/com/android/icu/charset/CharsetEncoderICU.java"
        "libcore_bridge/src/java/com/android/icu/charset/CharsetICU.java"
        "libcore_bridge/src/java/com/android/icu/charset/NativeConverter.java"
        "libcore_bridge/src/java/com/android/icu/util/CaseMapperNative.java"
        "libcore_bridge/src/java/com/android/icu/util/Icu4cMetadata.java"
        "libcore_bridge/src/java/com/android/icu/util/LocaleNative.java"
        "libcore_bridge/src/java/com/android/icu/util/regex/MatcherNative.java"
        "libcore_bridge/src/java/com/android/icu/util/regex/PatternNative.java"
    ];
    path = "libcore_bridge/src/java";
};

#  Rule generating resource lib for android_icu4j.
#  In the downstream branch master-icu-dev, the resource files are generated.
android_icu4j_resources_lib = java_library {
    name = "android_icu4j_resources_lib";
    visibility = [
        "//libcore"
    ];
    java_resource_dirs = ["resources"];
    sdk_version = "none";
    system_modules = "none";
};

#  Same as android_icu4j_resources_lib but compiling against core_current sdk
#  in order to avoid using non-public API from core-libart and core-oj
#  because core-icu4j will be in a different i18n APEX module.

android_icu4j_resources_lib_sdk_core_current = java_library {
    name = "android_icu4j_resources_lib_sdk_core_current";
    visibility = [
        "//libcore"
    ];
    java_resource_dirs = ["resources"];
    sdk_version = "core_current";
};

#  core-repackaged-icu4j contains only the repackaged ICU4J that does not
#  use any internal or android specific code. If it ever did then it could depend on
#  art-module-intra-core-api-stubs-system-modules (a superset) instead.
#  It is important that core-icu4j is restricted to only use stable APIs from the ART module
#  since it is in a different APEX module that can be updated independently.
core-repackaged-icu4j = java_library_static {
    name = "core-repackaged-icu4j";
    installable = false;
    srcs = [":android_icu4j_repackaged_src_files"];
    libs = ["unsupportedappusage"];
    #  The resource files are generated in the downstream branch master-icu-dev.
    java_resource_dirs = ["resources"];

    sdk_version = "none";
    system_modules = "art-module-public-api-stubs-system-modules";

    dxflags = ["--core-library"];
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF" #  Ignore missing @Override.
            "-Xep:ConstantOverflow:WARN" #  Known constant overflow in SplittableRandom
        ];
    };

    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

#  A separated core library that contains ICU4J because ICU4J will be in a different APEX module,
#  not in ART module.
core-icu4j = java_library {
    name = "core-icu4j";
    visibility = [
        "//art/build/apex"
        "//external/robolectric-shadows"
        "//frameworks/layoutlib"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
    installable = true;
    hostdex = true;

    srcs = [":libcore_icu_bridge_src_files"];
    static_libs = ["core-repackaged-icu4j"];

    #  It is important that core-icu4j is restricted to only use stable APIs from the ART module
    #  since it is in a different APEX module that can be updated independently.
    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";

    dxflags = ["--core-library"];
};

#
#  Guaranteed unstripped versions of core-icu4j.
#
#  The build system may or may not strip the core-icu4j. jar,
#  but this will not be stripped. See b/24535627.
#
core-icu4j-testdex = java_library {
    name = "core-icu4j-testdex";
    installable = true;
    static_libs = ["core-icu4j"];
    sdk_version = "none";
    system_modules = "art-module-public-api-stubs-system-modules";
    dxflags = ["--core-library"];
    dex_preopt = {
        enabled = false;
    };
};

#  Generates stubs for the parts of the public SDK API provided by the i18n module.
#
#  Only for use by i18n.module.public.api.stubs target below.
i18n-module-public-api-stubs-gen = droidstubs {
    name = "i18n-module-public-api-stubs-gen";
    srcs = [
        ":android_icu4j_public_api_files"
    ];
    java_version = "1.9";
    installable = false;
    sdk_version = "none";
    system_modules = "art-module-public-api-stubs-system-modules";
};

#  A stubs target containing the parts of the public SDK API provided by the i18n module.
"i18n.module.public.api.stubs" = java_library {
    name = "i18n.module.public.api.stubs";
    visibility = [
        "//libcore"
    ];
    srcs = [":i18n-module-public-api-stubs-gen"];
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF"
        ];
    };
    sdk_version = "none";
    system_modules = "art-module-public-api-stubs-system-modules";
};

#  Generates stub source files for the intra-core API of the I18N module.
#  i.e. every class/member that is either in the public API or annotated with
#  @IntraCoreApi.
#
#  The API specification .txt files managed by this only contain the additional
#  classes/members that are in the intra-core API but which are not the public
#  API.
i18n-module-intra-core-api-stubs-source = droidstubs {
    name = "i18n-module-intra-core-api-stubs-source";
    visibility = [
        #  Needed to build core-all as using the compiled library, i.e.
        #  i18n.module.intra.core.api.stubs does not work due to limitations
        #  in javac.
        "//libcore:__subpackages__"
    ];
    srcs = [
        ":android_icu4j_repackaged_src_files"
        ":libcore_icu_bridge_src_files"
    ];
    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";

    installable = false;
    args = "--hide-annotation libcore.api.Hide " +
        "--show-single-annotation libcore.api.IntraCoreApi " +
        "--skip-annotation-instance-methods=false ";

    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    previous_api = "previous.txt";
    check_api = {
        current = {
            api_file = "api/intra/current-api.txt";
            removed_api_file = "api/intra/current-removed.txt";
        };
        last_released = {
            api_file = "api/intra/last-api.txt";
            removed_api_file = "api/intra/last-removed.txt";
        };
    };
};

#  A library containing the intra-core API stubs of the I18N module.
#
#  Intra-core APIs are only intended for the use of other core library modules.
"i18n.module.intra.core.api.stubs" = java_library {
    name = "i18n.module.intra.core.api.stubs";
    visibility = [
        "//libcore:__subpackages__"
    ];
    srcs = [
        ":i18n-module-intra-core-api-stubs-source"
    ];

    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
};

#  Generates stub source files for the core platform API of the I18N module.
#  i.e. every class/member that is either in the public API or annotated with
#  @CorePlatformApi.
#
#  The API specification .txt files managed by this only contain the additional
#  classes/members that are in the intra-core API but which are not in the public
#  API.
i18n-module-platform-api-stubs-source = droidstubs {
    name = "i18n-module-platform-api-stubs-source";
    srcs = [
        ":android_icu4j_repackaged_src_files"
        ":libcore_icu_bridge_src_files"
    ];
    sdk_version = "none";
    system_modules = "art-module-platform-api-stubs-system-modules";

    installable = false;
    args = "--hide-annotation libcore.api.Hide " +
        "--show-single-annotation libcore.api.CorePlatformApi " +
        "--skip-annotation-instance-methods=false ";

    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    previous_api = "previous.txt";

    check_api = {
        current = {
            api_file = "api/platform/current-api.txt";
            removed_api_file = "api/platform/current-removed.txt";
        };
        last_released = {
            api_file = "api/platform/last-api.txt";
            removed_api_file = "api/platform/last-removed.txt";
        };
    };
};

#  A library containing the core platform API stubs of the I18N module.
#
#  Core platform APIs are only intended for use of other parts of the platform, not the
#  core library modules.
"i18n.module.platform.api.stubs" = java_library {
    name = "i18n.module.platform.api.stubs";
    visibility = [
        "//libcore:__subpackages__"
    ];
    srcs = [
        ":i18n-module-platform-api-stubs-source"
    ];
    hostdex = true;

    sdk_version = "none";
    system_modules = "art-module-platform-api-stubs-system-modules";
};

# ==========================================================
#  build repackaged ICU tests
#
#  Target builds against core-libart and core-oj so that it can access all the
#  repackaged android.icu classes and methods and not just the ones available
#  through the Android API.
# ==========================================================
android-icu4j-tests = java_test {
    name = "android-icu4j-tests";
    visibility = [
        "//cts/tests/tests/icu"
    ];

    srcs = [
        "src/main/tests/android/icu/dev/data/TestDataElements_testtypes.java"
        "src/main/tests/android/icu/dev/data/resources/TestDataElements.java"
        "src/main/tests/android/icu/dev/data/resources/TestDataElements_en_Latn_US.java"
        "src/main/tests/android/icu/dev/data/resources/TestDataElements_en_US.java"
        "src/main/tests/android/icu/dev/data/resources/TestDataElements_fr_Latn_FR.java"
        "src/main/tests/android/icu/dev/data/resources/TestDataElements_te.java"
        "src/main/tests/android/icu/dev/data/resources/TestMessages.java"
        "src/main/tests/android/icu/dev/impl/number/DecimalQuantity_64BitBCD.java"
        "src/main/tests/android/icu/dev/impl/number/DecimalQuantity_ByteArrayBCD.java"
        "src/main/tests/android/icu/dev/impl/number/DecimalQuantity_SimpleStorage.java"
        "src/main/tests/android/icu/dev/test/AbstractTestLog.java"
        "src/main/tests/android/icu/dev/test/ModuleTest.java"
        "src/main/tests/android/icu/dev/test/ResourceModule.java"
        "src/main/tests/android/icu/dev/test/TestBoilerplate.java"
        "src/main/tests/android/icu/dev/test/TestDataModule.java"
        "src/main/tests/android/icu/dev/test/TestFmwk.java"
        "src/main/tests/android/icu/dev/test/TestLocaleNamePackaging.java"
        "src/main/tests/android/icu/dev/test/TestLog.java"
        "src/main/tests/android/icu/dev/test/TestUtil.java"
        "src/main/tests/android/icu/dev/test/UTF16Util.java"
        "src/main/tests/android/icu/dev/test/bidi/BiDiConformanceTest.java"
        "src/main/tests/android/icu/dev/test/bidi/BidiFmwk.java"
        "src/main/tests/android/icu/dev/test/bidi/TestBidi.java"
        "src/main/tests/android/icu/dev/test/bidi/TestBidiTransform.java"
        "src/main/tests/android/icu/dev/test/bidi/TestCharFromDirProp.java"
        "src/main/tests/android/icu/dev/test/bidi/TestClassOverride.java"
        "src/main/tests/android/icu/dev/test/bidi/TestCompatibility.java"
        "src/main/tests/android/icu/dev/test/bidi/TestContext.java"
        "src/main/tests/android/icu/dev/test/bidi/TestData.java"
        "src/main/tests/android/icu/dev/test/bidi/TestFailureRecovery.java"
        "src/main/tests/android/icu/dev/test/bidi/TestInverse.java"
        "src/main/tests/android/icu/dev/test/bidi/TestMultipleParagraphs.java"
        "src/main/tests/android/icu/dev/test/bidi/TestReorder.java"
        "src/main/tests/android/icu/dev/test/bidi/TestReorderArabicMathSymbols.java"
        "src/main/tests/android/icu/dev/test/bidi/TestReorderRunsOnly.java"
        "src/main/tests/android/icu/dev/test/bidi/TestReorderingMode.java"
        "src/main/tests/android/icu/dev/test/bidi/TestStreaming.java"
        "src/main/tests/android/icu/dev/test/bigdec/DiagBigDecimalTest.java"
        "src/main/tests/android/icu/dev/test/calendar/AstroTest.java"
        "src/main/tests/android/icu/dev/test/calendar/CalendarRegressionTest.java"
        "src/main/tests/android/icu/dev/test/calendar/CalendarTestFmwk.java"
        "src/main/tests/android/icu/dev/test/calendar/ChineseTest.java"
        "src/main/tests/android/icu/dev/test/calendar/ChineseTestCase.java"
        "src/main/tests/android/icu/dev/test/calendar/CompatibilityTest.java"
        "src/main/tests/android/icu/dev/test/calendar/CopticTest.java"
        "src/main/tests/android/icu/dev/test/calendar/DangiTest.java"
        "src/main/tests/android/icu/dev/test/calendar/DataDrivenCalendarTest.java"
        "src/main/tests/android/icu/dev/test/calendar/EraRulesTest.java"
        "src/main/tests/android/icu/dev/test/calendar/EthiopicTest.java"
        "src/main/tests/android/icu/dev/test/calendar/HebrewTest.java"
        "src/main/tests/android/icu/dev/test/calendar/HolidayTest.java"
        "src/main/tests/android/icu/dev/test/calendar/IBMCalendarTest.java"
        "src/main/tests/android/icu/dev/test/calendar/IndianTest.java"
        "src/main/tests/android/icu/dev/test/calendar/IslamicTest.java"
        "src/main/tests/android/icu/dev/test/calendar/JapaneseTest.java"
        "src/main/tests/android/icu/dev/test/calendar/PersianTest.java"
        "src/main/tests/android/icu/dev/test/calendar/TestCase.java"
        "src/main/tests/android/icu/dev/test/charsetdet/TestCharsetDetector.java"
        "src/main/tests/android/icu/dev/test/collator/AlphabeticIndexTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationAPITest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationChineseTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationCreationMethodTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationCurrencyTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationDummyTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationEnglishTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationFinnishTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationFrenchTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationFrozenMonkeyTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationGermanTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationIteratorTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationKanaTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationMiscTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationMonkeyTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationRegressionTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationServiceTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationSpanishTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationThaiTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationThreadTest.java"
        "src/main/tests/android/icu/dev/test/collator/CollationTurkishTest.java"
        "src/main/tests/android/icu/dev/test/collator/Counter.java"
        "src/main/tests/android/icu/dev/test/collator/G7CollationTest.java"
        "src/main/tests/android/icu/dev/test/collator/LotusCollationKoreanTest.java"
        "src/main/tests/android/icu/dev/test/collator/UCAConformanceTest.java"
        "src/main/tests/android/icu/dev/test/compression/DecompressionTest.java"
        "src/main/tests/android/icu/dev/test/compression/ExhaustiveTest.java"
        "src/main/tests/android/icu/dev/test/duration/DataReadWriteTest.java"
        "src/main/tests/android/icu/dev/test/duration/ICUDurationTest.java"
        "src/main/tests/android/icu/dev/test/duration/LanguageTestFmwk.java"
        "src/main/tests/android/icu/dev/test/duration/PeriodBuilderFactoryTest.java"
        "src/main/tests/android/icu/dev/test/duration/PeriodTest.java"
        "src/main/tests/android/icu/dev/test/duration/RegressionTest.java"
        "src/main/tests/android/icu/dev/test/duration/ResourceBasedPeriodFormatterDataServiceTest.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_ar_EG.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_en.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_es.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_fr.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_he_IL.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_hi.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_it.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_ja.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_ko.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_ru.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_zh_Hans.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_zh_Hans_SG.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_zh_Hant.java"
        "src/main/tests/android/icu/dev/test/duration/languages/Test_zh_Hant_HK.java"
        "src/main/tests/android/icu/dev/test/format/BigNumberFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/CompactDecimalFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/DataDrivenFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/DataDrivenNumberFormatTestData.java"
        "src/main/tests/android/icu/dev/test/format/DataDrivenNumberFormatTestUtility.java"
        "src/main/tests/android/icu/dev/test/format/DateFormatMiscTests.java"
        "src/main/tests/android/icu/dev/test/format/DateFormatRegressionTest.java"
        "src/main/tests/android/icu/dev/test/format/DateFormatRegressionTestJ.java"
        "src/main/tests/android/icu/dev/test/format/DateFormatRoundTripTest.java"
        "src/main/tests/android/icu/dev/test/format/DateFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/DateIntervalFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/DateTimeGeneratorTest.java"
        "src/main/tests/android/icu/dev/test/format/FormattedStringBuilderTest.java"
        "src/main/tests/android/icu/dev/test/format/FormattedValueTest.java"
        "src/main/tests/android/icu/dev/test/format/GlobalizationPreferencesTest.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDateFormat.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDateFormatAPI.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDateFormatAPIC.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDateFormatSymbols.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDecimalFormatAPI.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDecimalFormatAPIC.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDecimalFormatSymbols.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestDecimalFormatSymbolsC.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestNumberFormat.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestNumberFormatAPI.java"
        "src/main/tests/android/icu/dev/test/format/IntlTestSimpleDateFormatAPI.java"
        "src/main/tests/android/icu/dev/test/format/ListFormatterTest.java"
        "src/main/tests/android/icu/dev/test/format/MeasureUnitTest.java"
        "src/main/tests/android/icu/dev/test/format/MeasureUnitThreadTest.java"
        "src/main/tests/android/icu/dev/test/format/MessagePatternUtilTest.java"
        "src/main/tests/android/icu/dev/test/format/MessageRegressionTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatDataDrivenTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatJavaCompatilityTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatRegistrationTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatRegressionTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatRoundTripTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatSerialTestData.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatSpecificationTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/NumberRegressionTests.java"
        "src/main/tests/android/icu/dev/test/format/PluralFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/PluralFormatUnitTest.java"
        "src/main/tests/android/icu/dev/test/format/PluralRangesTest.java"
        "src/main/tests/android/icu/dev/test/format/PluralRulesFactory.java"
        "src/main/tests/android/icu/dev/test/format/PluralRulesTest.java"
        "src/main/tests/android/icu/dev/test/format/RBNFParseTest.java"
        "src/main/tests/android/icu/dev/test/format/RbnfLenientScannerTest.java"
        "src/main/tests/android/icu/dev/test/format/RbnfRoundTripTest.java"
        "src/main/tests/android/icu/dev/test/format/RbnfTest.java"
        "src/main/tests/android/icu/dev/test/format/RelativeDateTimeFormatterTest.java"
        "src/main/tests/android/icu/dev/test/format/ScientificNumberFormatterTest.java"
        "src/main/tests/android/icu/dev/test/format/SelectFormatAPITest.java"
        "src/main/tests/android/icu/dev/test/format/SelectFormatUnitTest.java"
        "src/main/tests/android/icu/dev/test/format/TestMessageFormat.java"
        "src/main/tests/android/icu/dev/test/format/TimeUnitTest.java"
        "src/main/tests/android/icu/dev/test/format/TimeZoneFormatTest.java"
        "src/main/tests/android/icu/dev/test/format/WriteNumberFormatSerialTestData.java"
        "src/main/tests/android/icu/dev/test/impl/CSCharacterIteratorTest.java"
        "src/main/tests/android/icu/dev/test/impl/CacheTest.java"
        "src/main/tests/android/icu/dev/test/impl/StringSegmentTest.java"
        "src/main/tests/android/icu/dev/test/iterator/TestUCharacterIterator.java"
        "src/main/tests/android/icu/dev/test/lang/DataDrivenUScriptTest.java"
        "src/main/tests/android/icu/dev/test/lang/TestUScript.java"
        "src/main/tests/android/icu/dev/test/lang/TestUScriptRun.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterCaseTest.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterCategoryTest.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterCompare.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterDirectionTest.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterSurrogateTest.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterTest.java"
        "src/main/tests/android/icu/dev/test/lang/UCharacterThreadTest.java"
        "src/main/tests/android/icu/dev/test/lang/UPropertyAliasesTest.java"
        "src/main/tests/android/icu/dev/test/lang/UTF16Test.java"
        "src/main/tests/android/icu/dev/test/lang/UnicodeSetStringSpanTest.java"
        "src/main/tests/android/icu/dev/test/lang/UnicodeSetTest.java"
        "src/main/tests/android/icu/dev/test/normalizer/BasicTest.java"
        "src/main/tests/android/icu/dev/test/normalizer/ConformanceTest.java"
        "src/main/tests/android/icu/dev/test/normalizer/IntHashtable.java"
        "src/main/tests/android/icu/dev/test/normalizer/IntStringHashtable.java"
        "src/main/tests/android/icu/dev/test/normalizer/LongHashtable.java"
        "src/main/tests/android/icu/dev/test/normalizer/NormalizationMonkeyTest.java"
        "src/main/tests/android/icu/dev/test/normalizer/NormalizerBuilder.java"
        "src/main/tests/android/icu/dev/test/normalizer/NormalizerData.java"
        "src/main/tests/android/icu/dev/test/normalizer/NormalizerRegressionTests.java"
        "src/main/tests/android/icu/dev/test/normalizer/TestCanonicalIterator.java"
        "src/main/tests/android/icu/dev/test/normalizer/TestDeprecatedNormalizerAPI.java"
        "src/main/tests/android/icu/dev/test/normalizer/UTS46Test.java"
        "src/main/tests/android/icu/dev/test/normalizer/UnicodeNormalizer.java"
        "src/main/tests/android/icu/dev/test/normalizer/UnicodeNormalizerConformanceTest.java"
        "src/main/tests/android/icu/dev/test/number/AffixUtilsTest.java"
        "src/main/tests/android/icu/dev/test/number/DecimalQuantityTest.java"
        "src/main/tests/android/icu/dev/test/number/ExhaustiveNumberTest.java"
        "src/main/tests/android/icu/dev/test/number/ModifierTest.java"
        "src/main/tests/android/icu/dev/test/number/MutablePatternModifierTest.java"
        "src/main/tests/android/icu/dev/test/number/NumberFormatterApiTest.java"
        "src/main/tests/android/icu/dev/test/number/NumberParserTest.java"
        "src/main/tests/android/icu/dev/test/number/NumberPermutationTest.java"
        "src/main/tests/android/icu/dev/test/number/NumberRangeFormatterTest.java"
        "src/main/tests/android/icu/dev/test/number/NumberSkeletonTest.java"
        "src/main/tests/android/icu/dev/test/number/PatternStringTest.java"
        "src/main/tests/android/icu/dev/test/number/PropertiesTest.java"
        "src/main/tests/android/icu/dev/test/rbbi/AbstractBreakIteratorTests.java"
        "src/main/tests/android/icu/dev/test/rbbi/BreakIteratorRegTest.java"
        "src/main/tests/android/icu/dev/test/rbbi/BreakIteratorRules_en_US_TEST.java"
        "src/main/tests/android/icu/dev/test/rbbi/BreakIteratorTest.java"
        "src/main/tests/android/icu/dev/test/rbbi/RBBIAPITest.java"
        "src/main/tests/android/icu/dev/test/rbbi/RBBIMonkeyTest.java"
        "src/main/tests/android/icu/dev/test/rbbi/RBBITest.java"
        "src/main/tests/android/icu/dev/test/rbbi/RBBITestExtended.java"
        "src/main/tests/android/icu/dev/test/rbbi/RBBITestMonkey.java"
        "src/main/tests/android/icu/dev/test/search/SearchTest.java"
        "src/main/tests/android/icu/dev/test/serializable/CalendarHandler.java"
        "src/main/tests/android/icu/dev/test/serializable/CompatibilityTest.java"
        "src/main/tests/android/icu/dev/test/serializable/CoverageTest.java"
        "src/main/tests/android/icu/dev/test/serializable/ExceptionHandler.java"
        "src/main/tests/android/icu/dev/test/serializable/FormatHandler.java"
        "src/main/tests/android/icu/dev/test/serializable/SerializableChecker.java"
        "src/main/tests/android/icu/dev/test/serializable/SerializableTestUtility.java"
        "src/main/tests/android/icu/dev/test/serializable/SerializableWriter.java"
        "src/main/tests/android/icu/dev/test/shaping/ArabicShapingRegTest.java"
        "src/main/tests/android/icu/dev/test/shaping/DataDrivenArabicShapingRegTest.java"
        "src/main/tests/android/icu/dev/test/stringprep/IDNAConformanceTest.java"
        "src/main/tests/android/icu/dev/test/stringprep/IDNAReference.java"
        "src/main/tests/android/icu/dev/test/stringprep/NFS4StringPrep.java"
        "src/main/tests/android/icu/dev/test/stringprep/NamePrepTransform.java"
        "src/main/tests/android/icu/dev/test/stringprep/PunycodeReference.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestData.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestIDNA.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestIDNARef.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestInputDataStructure.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestStringPrep.java"
        "src/main/tests/android/icu/dev/test/stringprep/TestStringPrepProfiles.java"
        "src/main/tests/android/icu/dev/test/text/SpoofCheckerTest.java"
        "src/main/tests/android/icu/dev/test/timescale/TimeScaleAPITest.java"
        "src/main/tests/android/icu/dev/test/timescale/TimeScaleDataTest.java"
        "src/main/tests/android/icu/dev/test/timescale/TimeScaleMonkeyTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneAliasTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneBoundaryTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneOffsetLocalTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneRegressionTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneRuleTest.java"
        "src/main/tests/android/icu/dev/test/timezone/TimeZoneTest.java"
        "src/main/tests/android/icu/dev/test/translit/AnyScriptTest.java"
        "src/main/tests/android/icu/dev/test/translit/CompoundTransliteratorTest.java"
        "src/main/tests/android/icu/dev/test/translit/ErrorTest.java"
        "src/main/tests/android/icu/dev/test/translit/IncrementalProgressTest.java"
        "src/main/tests/android/icu/dev/test/translit/JamoTest.java"
        "src/main/tests/android/icu/dev/test/translit/RegexUtilitiesTest.java"
        "src/main/tests/android/icu/dev/test/translit/ReplaceableTest.java"
        "src/main/tests/android/icu/dev/test/translit/RoundTripTest.java"
        "src/main/tests/android/icu/dev/test/translit/StringBoilerplateTest.java"
        "src/main/tests/android/icu/dev/test/translit/TestUtility.java"
        "src/main/tests/android/icu/dev/test/translit/ThreadTest.java"
        "src/main/tests/android/icu/dev/test/translit/TransliteratorDisorderedMarksTest.java"
        "src/main/tests/android/icu/dev/test/translit/TransliteratorInstantiateAllTest.java"
        "src/main/tests/android/icu/dev/test/translit/TransliteratorTest.java"
        "src/main/tests/android/icu/dev/test/translit/UnicodeMapBoilerplateTest.java"
        "src/main/tests/android/icu/dev/test/translit/UnicodeMapTest.java"
        "src/main/tests/android/icu/dev/test/translit/UnicodeSetBoilerplateTest.java"
        "src/main/tests/android/icu/dev/test/translit/WriteCharts.java"
        "src/main/tests/android/icu/dev/test/util/BytesTrieTest.java"
        "src/main/tests/android/icu/dev/test/util/CalendarFieldsSet.java"
        "src/main/tests/android/icu/dev/test/util/CharsTrieTest.java"
        "src/main/tests/android/icu/dev/test/util/CodePointTrieTest.java"
        "src/main/tests/android/icu/dev/test/util/CompactArrayTest.java"
        "src/main/tests/android/icu/dev/test/util/CurrencyTest.java"
        "src/main/tests/android/icu/dev/test/util/DataDrivenTestHelper.java"
        "src/main/tests/android/icu/dev/test/util/DateTimeStyleSet.java"
        "src/main/tests/android/icu/dev/test/util/DebugUtilities.java"
        "src/main/tests/android/icu/dev/test/util/DebugUtilitiesData.java"
        "src/main/tests/android/icu/dev/test/util/DebugUtilitiesTest.java"
        "src/main/tests/android/icu/dev/test/util/DisplayNameTest.java"
        "src/main/tests/android/icu/dev/test/util/Equator.java"
        "src/main/tests/android/icu/dev/test/util/FieldsSet.java"
        "src/main/tests/android/icu/dev/test/util/GenderInfoTest.java"
        "src/main/tests/android/icu/dev/test/util/ICUBinaryTest.java"
        "src/main/tests/android/icu/dev/test/util/ICUResourceBundleCollationTest.java"
        "src/main/tests/android/icu/dev/test/util/ICUResourceBundleTest.java"
        "src/main/tests/android/icu/dev/test/util/ICUServiceTest.java"
        "src/main/tests/android/icu/dev/test/util/ICUServiceTestSample.java"
        "src/main/tests/android/icu/dev/test/util/ICUServiceThreadTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleAliasCollationTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleAliasTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleBuilderTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleDataTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleDistanceTest.java"
        "src/main/tests/android/icu/dev/test/util/LocaleMatcherTest.java"
        "src/main/tests/android/icu/dev/test/util/LocalePriorityListTest.java"
        "src/main/tests/android/icu/dev/test/util/RegionTest.java"
        "src/main/tests/android/icu/dev/test/util/SimpleFormatterTest.java"
        "src/main/tests/android/icu/dev/test/util/StaticUnicodeSetsTest.java"
        "src/main/tests/android/icu/dev/test/util/StringTokenizerTest.java"
        "src/main/tests/android/icu/dev/test/util/TestLocaleValidity.java"
        "src/main/tests/android/icu/dev/test/util/TestUtilities.java"
        "src/main/tests/android/icu/dev/test/util/TextTrieMapTest.java"
        "src/main/tests/android/icu/dev/test/util/Trie2Test.java"
        "src/main/tests/android/icu/dev/test/util/TrieMap.java"
        "src/main/tests/android/icu/dev/test/util/TrieMapTest.java"
        "src/main/tests/android/icu/dev/test/util/TrieTest.java"
        "src/main/tests/android/icu/dev/test/util/ULocaleCollationTest.java"
        "src/main/tests/android/icu/dev/test/util/ULocaleTest.java"
        "src/main/tests/android/icu/dev/test/util/UtilityTest.java"
        "src/main/tests/android/icu/dev/test/util/VersionInfoTest.java"
        "src/main/tests/android/icu/dev/tool/locale/LikelySubtagsBuilder.java"
        "src/main/tests/android/icu/dev/tool/locale/LocaleDistanceBuilder.java"
        "src/main/tests/android/icu/dev/util/CollectionUtilities.java"
        "src/main/tests/android/icu/dev/util/ElapsedTimer.java"
        "src/main/tests/android/icu/dev/util/ImmutableEntry.java"
        "src/main/tests/android/icu/dev/util/Timer.java"
        "src/main/tests/android/icu/dev/util/UnicodeMap.java"
        "src/main/tests/android/icu/dev/util/UnicodeMapIterator.java"
        "testing/src/android/icu/extratest/AndroidIcuVersionTest.java"
        "testing/src/android/icu/extratest/AndroidTransliteratorAvailableIdsTest.java"
        "testing/src/android/icu/extratest/AndroidTransliteratorParameterizedTest.java"
        "testing/src/android/icu/extratest/number/FormattedNumberRangeTest.java"
        "testing/src/android/icu/extratest/number/FormattedNumberTest.java"
        "testing/src/android/icu/extratest/util/JapaneseCalendarTest.java"
        "testing/src/android/icu/extratest/util/ULocaleTest.java"
        "testing/src/android/icu/testsharding/HiMemTestShard.java"
        "testing/src/android/icu/testsharding/MainTestShard.java"
    ];
    java_resource_dirs = [
        "src/main/tests"
        "testing/src"
    ];
    libs = [
        "core-icu4j"
    ];
    static_libs = [
        "junit"
        "junit-params"
    ];

    patch_module = "java.base";
    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
};

in { inherit "i18n.module.intra.core.api.stubs" "i18n.module.platform.api.stubs" "i18n.module.public.api.stubs" _missingName android-icu4j-tests android_icu4j_public_api_files android_icu4j_repackaged_src_files android_icu4j_resources_lib android_icu4j_resources_lib_sdk_core_current core-icu4j core-icu4j-testdex core-repackaged-icu4j i18n-module-intra-core-api-stubs-source i18n-module-platform-api-stubs-source i18n-module-public-api-stubs-gen libcore_icu_bridge_src_files; }
