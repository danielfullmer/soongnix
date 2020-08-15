{ java_library_host, java_library_static }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

guava = java_library_static {
    name = "guava";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [
        "guava/src/com/google/common/annotations/Beta.java"
        "guava/src/com/google/common/annotations/GwtCompatible.java"
        "guava/src/com/google/common/annotations/GwtIncompatible.java"
        "guava/src/com/google/common/annotations/VisibleForTesting.java"
        "guava/src/com/google/common/annotations/package-info.java"
        "guava/src/com/google/common/base/Absent.java"
        "guava/src/com/google/common/base/AbstractIterator.java"
        "guava/src/com/google/common/base/Ascii.java"
        "guava/src/com/google/common/base/CaseFormat.java"
        "guava/src/com/google/common/base/CharMatcher.java"
        "guava/src/com/google/common/base/Charsets.java"
        "guava/src/com/google/common/base/Converter.java"
        "guava/src/com/google/common/base/Defaults.java"
        "guava/src/com/google/common/base/Enums.java"
        "guava/src/com/google/common/base/Equivalence.java"
        "guava/src/com/google/common/base/FinalizablePhantomReference.java"
        "guava/src/com/google/common/base/FinalizableReference.java"
        "guava/src/com/google/common/base/FinalizableReferenceQueue.java"
        "guava/src/com/google/common/base/FinalizableSoftReference.java"
        "guava/src/com/google/common/base/FinalizableWeakReference.java"
        "guava/src/com/google/common/base/Function.java"
        "guava/src/com/google/common/base/FunctionalEquivalence.java"
        "guava/src/com/google/common/base/Functions.java"
        "guava/src/com/google/common/base/Joiner.java"
        "guava/src/com/google/common/base/MoreObjects.java"
        "guava/src/com/google/common/base/Objects.java"
        "guava/src/com/google/common/base/Optional.java"
        "guava/src/com/google/common/base/PairwiseEquivalence.java"
        "guava/src/com/google/common/base/Platform.java"
        "guava/src/com/google/common/base/Preconditions.java"
        "guava/src/com/google/common/base/Predicate.java"
        "guava/src/com/google/common/base/Predicates.java"
        "guava/src/com/google/common/base/Present.java"
        "guava/src/com/google/common/base/SmallCharMatcher.java"
        "guava/src/com/google/common/base/Splitter.java"
        "guava/src/com/google/common/base/StandardSystemProperty.java"
        "guava/src/com/google/common/base/Stopwatch.java"
        "guava/src/com/google/common/base/Strings.java"
        "guava/src/com/google/common/base/Supplier.java"
        "guava/src/com/google/common/base/Suppliers.java"
        "guava/src/com/google/common/base/Throwables.java"
        "guava/src/com/google/common/base/Ticker.java"
        "guava/src/com/google/common/base/Utf8.java"
        "guava/src/com/google/common/base/Verify.java"
        "guava/src/com/google/common/base/VerifyException.java"
        "guava/src/com/google/common/base/package-info.java"
        "guava/src/com/google/common/base/internal/Finalizer.java"
        "guava/src/com/google/common/cache/AbstractCache.java"
        "guava/src/com/google/common/cache/AbstractLoadingCache.java"
        "guava/src/com/google/common/cache/Cache.java"
        "guava/src/com/google/common/cache/CacheBuilder.java"
        "guava/src/com/google/common/cache/CacheBuilderSpec.java"
        "guava/src/com/google/common/cache/CacheLoader.java"
        "guava/src/com/google/common/cache/CacheStats.java"
        "guava/src/com/google/common/cache/ForwardingCache.java"
        "guava/src/com/google/common/cache/ForwardingLoadingCache.java"
        "guava/src/com/google/common/cache/LoadingCache.java"
        "guava/src/com/google/common/cache/LocalCache.java"
        "guava/src/com/google/common/cache/LongAddable.java"
        "guava/src/com/google/common/cache/LongAddables.java"
        "guava/src/com/google/common/cache/LongAdder.java"
        "guava/src/com/google/common/cache/RemovalCause.java"
        "guava/src/com/google/common/cache/RemovalListener.java"
        "guava/src/com/google/common/cache/RemovalListeners.java"
        "guava/src/com/google/common/cache/RemovalNotification.java"
        "guava/src/com/google/common/cache/Striped64.java"
        "guava/src/com/google/common/cache/Weigher.java"
        "guava/src/com/google/common/cache/package-info.java"
        "guava/src/com/google/common/collect/AbstractBiMap.java"
        "guava/src/com/google/common/collect/AbstractIndexedListIterator.java"
        "guava/src/com/google/common/collect/AbstractIterator.java"
        "guava/src/com/google/common/collect/AbstractListMultimap.java"
        "guava/src/com/google/common/collect/AbstractMapBasedMultimap.java"
        "guava/src/com/google/common/collect/AbstractMapBasedMultiset.java"
        "guava/src/com/google/common/collect/AbstractMapEntry.java"
        "guava/src/com/google/common/collect/AbstractMultimap.java"
        "guava/src/com/google/common/collect/AbstractMultiset.java"
        "guava/src/com/google/common/collect/AbstractNavigableMap.java"
        "guava/src/com/google/common/collect/AbstractRangeSet.java"
        "guava/src/com/google/common/collect/AbstractSequentialIterator.java"
        "guava/src/com/google/common/collect/AbstractSetMultimap.java"
        "guava/src/com/google/common/collect/AbstractSortedKeySortedSetMultimap.java"
        "guava/src/com/google/common/collect/AbstractSortedMultiset.java"
        "guava/src/com/google/common/collect/AbstractSortedSetMultimap.java"
        "guava/src/com/google/common/collect/AbstractTable.java"
        "guava/src/com/google/common/collect/AllEqualOrdering.java"
        "guava/src/com/google/common/collect/ArrayListMultimap.java"
        "guava/src/com/google/common/collect/ArrayTable.java"
        "guava/src/com/google/common/collect/BiMap.java"
        "guava/src/com/google/common/collect/BinaryTreeTraverser.java"
        "guava/src/com/google/common/collect/BoundType.java"
        "guava/src/com/google/common/collect/ByFunctionOrdering.java"
        "guava/src/com/google/common/collect/CartesianList.java"
        "guava/src/com/google/common/collect/ClassToInstanceMap.java"
        "guava/src/com/google/common/collect/CollectPreconditions.java"
        "guava/src/com/google/common/collect/Collections2.java"
        "guava/src/com/google/common/collect/ComparatorOrdering.java"
        "guava/src/com/google/common/collect/ComparisonChain.java"
        "guava/src/com/google/common/collect/CompoundOrdering.java"
        "guava/src/com/google/common/collect/ComputationException.java"
        "guava/src/com/google/common/collect/ComputingConcurrentHashMap.java"
        "guava/src/com/google/common/collect/ConcurrentHashMultiset.java"
        "guava/src/com/google/common/collect/Constraint.java"
        "guava/src/com/google/common/collect/Constraints.java"
        "guava/src/com/google/common/collect/ContiguousSet.java"
        "guava/src/com/google/common/collect/Count.java"
        "guava/src/com/google/common/collect/Cut.java"
        "guava/src/com/google/common/collect/DenseImmutableTable.java"
        "guava/src/com/google/common/collect/DescendingImmutableSortedMultiset.java"
        "guava/src/com/google/common/collect/DescendingImmutableSortedSet.java"
        "guava/src/com/google/common/collect/DescendingMultiset.java"
        "guava/src/com/google/common/collect/DiscreteDomain.java"
        "guava/src/com/google/common/collect/EmptyContiguousSet.java"
        "guava/src/com/google/common/collect/EmptyImmutableBiMap.java"
        "guava/src/com/google/common/collect/EmptyImmutableListMultimap.java"
        "guava/src/com/google/common/collect/EmptyImmutableSet.java"
        "guava/src/com/google/common/collect/EmptyImmutableSetMultimap.java"
        "guava/src/com/google/common/collect/EmptyImmutableSortedMap.java"
        "guava/src/com/google/common/collect/EmptyImmutableSortedMultiset.java"
        "guava/src/com/google/common/collect/EmptyImmutableSortedSet.java"
        "guava/src/com/google/common/collect/EnumBiMap.java"
        "guava/src/com/google/common/collect/EnumHashBiMap.java"
        "guava/src/com/google/common/collect/EnumMultiset.java"
        "guava/src/com/google/common/collect/EvictingQueue.java"
        "guava/src/com/google/common/collect/ExplicitOrdering.java"
        "guava/src/com/google/common/collect/FilteredEntryMultimap.java"
        "guava/src/com/google/common/collect/FilteredEntrySetMultimap.java"
        "guava/src/com/google/common/collect/FilteredKeyListMultimap.java"
        "guava/src/com/google/common/collect/FilteredKeyMultimap.java"
        "guava/src/com/google/common/collect/FilteredKeySetMultimap.java"
        "guava/src/com/google/common/collect/FilteredMultimap.java"
        "guava/src/com/google/common/collect/FilteredMultimapValues.java"
        "guava/src/com/google/common/collect/FilteredSetMultimap.java"
        "guava/src/com/google/common/collect/FluentIterable.java"
        "guava/src/com/google/common/collect/ForwardingBlockingDeque.java"
        "guava/src/com/google/common/collect/ForwardingCollection.java"
        "guava/src/com/google/common/collect/ForwardingConcurrentMap.java"
        "guava/src/com/google/common/collect/ForwardingDeque.java"
        "guava/src/com/google/common/collect/ForwardingImmutableCollection.java"
        "guava/src/com/google/common/collect/ForwardingImmutableList.java"
        "guava/src/com/google/common/collect/ForwardingImmutableMap.java"
        "guava/src/com/google/common/collect/ForwardingImmutableSet.java"
        "guava/src/com/google/common/collect/ForwardingIterator.java"
        "guava/src/com/google/common/collect/ForwardingList.java"
        "guava/src/com/google/common/collect/ForwardingListIterator.java"
        "guava/src/com/google/common/collect/ForwardingListMultimap.java"
        "guava/src/com/google/common/collect/ForwardingMap.java"
        "guava/src/com/google/common/collect/ForwardingMapEntry.java"
        "guava/src/com/google/common/collect/ForwardingMultimap.java"
        "guava/src/com/google/common/collect/ForwardingMultiset.java"
        "guava/src/com/google/common/collect/ForwardingNavigableMap.java"
        "guava/src/com/google/common/collect/ForwardingNavigableSet.java"
        "guava/src/com/google/common/collect/ForwardingObject.java"
        "guava/src/com/google/common/collect/ForwardingQueue.java"
        "guava/src/com/google/common/collect/ForwardingSet.java"
        "guava/src/com/google/common/collect/ForwardingSetMultimap.java"
        "guava/src/com/google/common/collect/ForwardingSortedMap.java"
        "guava/src/com/google/common/collect/ForwardingSortedMultiset.java"
        "guava/src/com/google/common/collect/ForwardingSortedSet.java"
        "guava/src/com/google/common/collect/ForwardingSortedSetMultimap.java"
        "guava/src/com/google/common/collect/ForwardingTable.java"
        "guava/src/com/google/common/collect/GeneralRange.java"
        "guava/src/com/google/common/collect/GenericMapMaker.java"
        "guava/src/com/google/common/collect/GwtTransient.java"
        "guava/src/com/google/common/collect/HashBasedTable.java"
        "guava/src/com/google/common/collect/HashBiMap.java"
        "guava/src/com/google/common/collect/HashMultimap.java"
        "guava/src/com/google/common/collect/HashMultiset.java"
        "guava/src/com/google/common/collect/Hashing.java"
        "guava/src/com/google/common/collect/ImmutableAsList.java"
        "guava/src/com/google/common/collect/ImmutableBiMap.java"
        "guava/src/com/google/common/collect/ImmutableClassToInstanceMap.java"
        "guava/src/com/google/common/collect/ImmutableCollection.java"
        "guava/src/com/google/common/collect/ImmutableEntry.java"
        "guava/src/com/google/common/collect/ImmutableEnumMap.java"
        "guava/src/com/google/common/collect/ImmutableEnumSet.java"
        "guava/src/com/google/common/collect/ImmutableList.java"
        "guava/src/com/google/common/collect/ImmutableListMultimap.java"
        "guava/src/com/google/common/collect/ImmutableMap.java"
        "guava/src/com/google/common/collect/ImmutableMapEntry.java"
        "guava/src/com/google/common/collect/ImmutableMapEntrySet.java"
        "guava/src/com/google/common/collect/ImmutableMapKeySet.java"
        "guava/src/com/google/common/collect/ImmutableMapValues.java"
        "guava/src/com/google/common/collect/ImmutableMultimap.java"
        "guava/src/com/google/common/collect/ImmutableMultiset.java"
        "guava/src/com/google/common/collect/ImmutableRangeMap.java"
        "guava/src/com/google/common/collect/ImmutableRangeSet.java"
        "guava/src/com/google/common/collect/ImmutableSet.java"
        "guava/src/com/google/common/collect/ImmutableSetMultimap.java"
        "guava/src/com/google/common/collect/ImmutableSortedAsList.java"
        "guava/src/com/google/common/collect/ImmutableSortedMap.java"
        "guava/src/com/google/common/collect/ImmutableSortedMapFauxverideShim.java"
        "guava/src/com/google/common/collect/ImmutableSortedMultiset.java"
        "guava/src/com/google/common/collect/ImmutableSortedMultisetFauxverideShim.java"
        "guava/src/com/google/common/collect/ImmutableSortedSet.java"
        "guava/src/com/google/common/collect/ImmutableSortedSetFauxverideShim.java"
        "guava/src/com/google/common/collect/ImmutableTable.java"
        "guava/src/com/google/common/collect/Interner.java"
        "guava/src/com/google/common/collect/Interners.java"
        "guava/src/com/google/common/collect/Iterables.java"
        "guava/src/com/google/common/collect/Iterators.java"
        "guava/src/com/google/common/collect/LexicographicalOrdering.java"
        "guava/src/com/google/common/collect/LinkedHashMultimap.java"
        "guava/src/com/google/common/collect/LinkedHashMultiset.java"
        "guava/src/com/google/common/collect/LinkedListMultimap.java"
        "guava/src/com/google/common/collect/ListMultimap.java"
        "guava/src/com/google/common/collect/Lists.java"
        "guava/src/com/google/common/collect/MapConstraint.java"
        "guava/src/com/google/common/collect/MapConstraints.java"
        "guava/src/com/google/common/collect/MapDifference.java"
        "guava/src/com/google/common/collect/MapMaker.java"
        "guava/src/com/google/common/collect/MapMakerInternalMap.java"
        "guava/src/com/google/common/collect/Maps.java"
        "guava/src/com/google/common/collect/MinMaxPriorityQueue.java"
        "guava/src/com/google/common/collect/Multimap.java"
        "guava/src/com/google/common/collect/MultimapBuilder.java"
        "guava/src/com/google/common/collect/Multimaps.java"
        "guava/src/com/google/common/collect/Multiset.java"
        "guava/src/com/google/common/collect/Multisets.java"
        "guava/src/com/google/common/collect/MutableClassToInstanceMap.java"
        "guava/src/com/google/common/collect/NaturalOrdering.java"
        "guava/src/com/google/common/collect/NullsFirstOrdering.java"
        "guava/src/com/google/common/collect/NullsLastOrdering.java"
        "guava/src/com/google/common/collect/ObjectArrays.java"
        "guava/src/com/google/common/collect/Ordering.java"
        "guava/src/com/google/common/collect/PeekingIterator.java"
        "guava/src/com/google/common/collect/Platform.java"
        "guava/src/com/google/common/collect/Queues.java"
        "guava/src/com/google/common/collect/Range.java"
        "guava/src/com/google/common/collect/RangeMap.java"
        "guava/src/com/google/common/collect/RangeSet.java"
        "guava/src/com/google/common/collect/RegularContiguousSet.java"
        "guava/src/com/google/common/collect/RegularImmutableAsList.java"
        "guava/src/com/google/common/collect/RegularImmutableBiMap.java"
        "guava/src/com/google/common/collect/RegularImmutableList.java"
        "guava/src/com/google/common/collect/RegularImmutableMap.java"
        "guava/src/com/google/common/collect/RegularImmutableMultiset.java"
        "guava/src/com/google/common/collect/RegularImmutableSet.java"
        "guava/src/com/google/common/collect/RegularImmutableSortedMap.java"
        "guava/src/com/google/common/collect/RegularImmutableSortedMultiset.java"
        "guava/src/com/google/common/collect/RegularImmutableSortedSet.java"
        "guava/src/com/google/common/collect/RegularImmutableTable.java"
        "guava/src/com/google/common/collect/ReverseNaturalOrdering.java"
        "guava/src/com/google/common/collect/ReverseOrdering.java"
        "guava/src/com/google/common/collect/RowSortedTable.java"
        "guava/src/com/google/common/collect/Serialization.java"
        "guava/src/com/google/common/collect/SetMultimap.java"
        "guava/src/com/google/common/collect/Sets.java"
        "guava/src/com/google/common/collect/SingletonImmutableBiMap.java"
        "guava/src/com/google/common/collect/SingletonImmutableList.java"
        "guava/src/com/google/common/collect/SingletonImmutableSet.java"
        "guava/src/com/google/common/collect/SingletonImmutableTable.java"
        "guava/src/com/google/common/collect/SortedIterable.java"
        "guava/src/com/google/common/collect/SortedIterables.java"
        "guava/src/com/google/common/collect/SortedLists.java"
        "guava/src/com/google/common/collect/SortedMapDifference.java"
        "guava/src/com/google/common/collect/SortedMultiset.java"
        "guava/src/com/google/common/collect/SortedMultisetBridge.java"
        "guava/src/com/google/common/collect/SortedMultisets.java"
        "guava/src/com/google/common/collect/SortedSetMultimap.java"
        "guava/src/com/google/common/collect/SparseImmutableTable.java"
        "guava/src/com/google/common/collect/StandardRowSortedTable.java"
        "guava/src/com/google/common/collect/StandardTable.java"
        "guava/src/com/google/common/collect/Synchronized.java"
        "guava/src/com/google/common/collect/Table.java"
        "guava/src/com/google/common/collect/Tables.java"
        "guava/src/com/google/common/collect/TransformedIterator.java"
        "guava/src/com/google/common/collect/TransformedListIterator.java"
        "guava/src/com/google/common/collect/TreeBasedTable.java"
        "guava/src/com/google/common/collect/TreeMultimap.java"
        "guava/src/com/google/common/collect/TreeMultiset.java"
        "guava/src/com/google/common/collect/TreeRangeMap.java"
        "guava/src/com/google/common/collect/TreeRangeSet.java"
        "guava/src/com/google/common/collect/TreeTraverser.java"
        "guava/src/com/google/common/collect/UnmodifiableIterator.java"
        "guava/src/com/google/common/collect/UnmodifiableListIterator.java"
        "guava/src/com/google/common/collect/UnmodifiableSortedMultiset.java"
        "guava/src/com/google/common/collect/UsingToStringOrdering.java"
        "guava/src/com/google/common/collect/WellBehavedMap.java"
        "guava/src/com/google/common/collect/package-info.java"
        "guava/src/com/google/common/escape/ArrayBasedCharEscaper.java"
        "guava/src/com/google/common/escape/ArrayBasedEscaperMap.java"
        "guava/src/com/google/common/escape/ArrayBasedUnicodeEscaper.java"
        "guava/src/com/google/common/escape/CharEscaper.java"
        "guava/src/com/google/common/escape/CharEscaperBuilder.java"
        "guava/src/com/google/common/escape/Escaper.java"
        "guava/src/com/google/common/escape/Escapers.java"
        "guava/src/com/google/common/escape/Platform.java"
        "guava/src/com/google/common/escape/UnicodeEscaper.java"
        "guava/src/com/google/common/escape/package-info.java"
        "guava/src/com/google/common/eventbus/AllowConcurrentEvents.java"
        "guava/src/com/google/common/eventbus/AnnotatedSubscriberFinder.java"
        "guava/src/com/google/common/eventbus/AsyncEventBus.java"
        "guava/src/com/google/common/eventbus/DeadEvent.java"
        "guava/src/com/google/common/eventbus/EventBus.java"
        "guava/src/com/google/common/eventbus/EventSubscriber.java"
        "guava/src/com/google/common/eventbus/Subscribe.java"
        "guava/src/com/google/common/eventbus/SubscriberExceptionContext.java"
        "guava/src/com/google/common/eventbus/SubscriberExceptionHandler.java"
        "guava/src/com/google/common/eventbus/SubscriberFindingStrategy.java"
        "guava/src/com/google/common/eventbus/SynchronizedEventSubscriber.java"
        "guava/src/com/google/common/eventbus/package-info.java"
        "guava/src/com/google/common/hash/AbstractByteHasher.java"
        "guava/src/com/google/common/hash/AbstractCompositeHashFunction.java"
        "guava/src/com/google/common/hash/AbstractHasher.java"
        "guava/src/com/google/common/hash/AbstractNonStreamingHashFunction.java"
        "guava/src/com/google/common/hash/AbstractStreamingHashFunction.java"
        "guava/src/com/google/common/hash/BloomFilter.java"
        "guava/src/com/google/common/hash/BloomFilterStrategies.java"
        "guava/src/com/google/common/hash/ChecksumHashFunction.java"
        "guava/src/com/google/common/hash/Crc32cHashFunction.java"
        "guava/src/com/google/common/hash/Funnel.java"
        "guava/src/com/google/common/hash/Funnels.java"
        "guava/src/com/google/common/hash/HashCode.java"
        "guava/src/com/google/common/hash/HashFunction.java"
        "guava/src/com/google/common/hash/Hasher.java"
        "guava/src/com/google/common/hash/Hashing.java"
        "guava/src/com/google/common/hash/HashingInputStream.java"
        "guava/src/com/google/common/hash/HashingOutputStream.java"
        "guava/src/com/google/common/hash/MessageDigestHashFunction.java"
        "guava/src/com/google/common/hash/Murmur3_128HashFunction.java"
        "guava/src/com/google/common/hash/Murmur3_32HashFunction.java"
        "guava/src/com/google/common/hash/PrimitiveSink.java"
        "guava/src/com/google/common/hash/SipHashFunction.java"
        "guava/src/com/google/common/hash/package-info.java"
        "guava/src/com/google/common/html/HtmlEscapers.java"
        "guava/src/com/google/common/html/package-info.java"
        "guava/src/com/google/common/io/AppendableWriter.java"
        "guava/src/com/google/common/io/BaseEncoding.java"
        "guava/src/com/google/common/io/ByteArrayDataInput.java"
        "guava/src/com/google/common/io/ByteArrayDataOutput.java"
        "guava/src/com/google/common/io/ByteProcessor.java"
        "guava/src/com/google/common/io/ByteSink.java"
        "guava/src/com/google/common/io/ByteSource.java"
        "guava/src/com/google/common/io/ByteStreams.java"
        "guava/src/com/google/common/io/CharSequenceReader.java"
        "guava/src/com/google/common/io/CharSink.java"
        "guava/src/com/google/common/io/CharSource.java"
        "guava/src/com/google/common/io/CharStreams.java"
        "guava/src/com/google/common/io/Closeables.java"
        "guava/src/com/google/common/io/Closer.java"
        "guava/src/com/google/common/io/CountingInputStream.java"
        "guava/src/com/google/common/io/CountingOutputStream.java"
        "guava/src/com/google/common/io/FileBackedOutputStream.java"
        "guava/src/com/google/common/io/FileWriteMode.java"
        "guava/src/com/google/common/io/Files.java"
        "guava/src/com/google/common/io/Flushables.java"
        "guava/src/com/google/common/io/GwtWorkarounds.java"
        "guava/src/com/google/common/io/InputSupplier.java"
        "guava/src/com/google/common/io/LegacyCloseables.java"
        "guava/src/com/google/common/io/LineBuffer.java"
        "guava/src/com/google/common/io/LineProcessor.java"
        "guava/src/com/google/common/io/LineReader.java"
        "guava/src/com/google/common/io/LittleEndianDataInputStream.java"
        "guava/src/com/google/common/io/LittleEndianDataOutputStream.java"
        "guava/src/com/google/common/io/MultiInputStream.java"
        "guava/src/com/google/common/io/MultiReader.java"
        "guava/src/com/google/common/io/OutputSupplier.java"
        "guava/src/com/google/common/io/PatternFilenameFilter.java"
        "guava/src/com/google/common/io/Resources.java"
        "guava/src/com/google/common/io/package-info.java"
        "guava/src/com/google/common/math/BigIntegerMath.java"
        "guava/src/com/google/common/math/DoubleMath.java"
        "guava/src/com/google/common/math/DoubleUtils.java"
        "guava/src/com/google/common/math/IntMath.java"
        "guava/src/com/google/common/math/LongMath.java"
        "guava/src/com/google/common/math/MathPreconditions.java"
        "guava/src/com/google/common/math/package-info.java"
        "guava/src/com/google/common/net/HostAndPort.java"
        "guava/src/com/google/common/net/HostSpecifier.java"
        "guava/src/com/google/common/net/HttpHeaders.java"
        "guava/src/com/google/common/net/InetAddresses.java"
        "guava/src/com/google/common/net/InternetDomainName.java"
        "guava/src/com/google/common/net/MediaType.java"
        "guava/src/com/google/common/net/PercentEscaper.java"
        "guava/src/com/google/common/net/UrlEscapers.java"
        "guava/src/com/google/common/net/package-info.java"
        "guava/src/com/google/common/primitives/Booleans.java"
        "guava/src/com/google/common/primitives/Bytes.java"
        "guava/src/com/google/common/primitives/Chars.java"
        "guava/src/com/google/common/primitives/Doubles.java"
        "guava/src/com/google/common/primitives/Floats.java"
        "guava/src/com/google/common/primitives/Ints.java"
        "guava/src/com/google/common/primitives/Longs.java"
        "guava/src/com/google/common/primitives/ParseRequest.java"
        "guava/src/com/google/common/primitives/Primitives.java"
        "guava/src/com/google/common/primitives/Shorts.java"
        "guava/src/com/google/common/primitives/SignedBytes.java"
        "guava/src/com/google/common/primitives/UnsignedBytes.java"
        "guava/src/com/google/common/primitives/UnsignedInteger.java"
        "guava/src/com/google/common/primitives/UnsignedInts.java"
        "guava/src/com/google/common/primitives/UnsignedLong.java"
        "guava/src/com/google/common/primitives/UnsignedLongs.java"
        "guava/src/com/google/common/primitives/package-info.java"
        "guava/src/com/google/common/reflect/AbstractInvocationHandler.java"
        "guava/src/com/google/common/reflect/ClassPath.java"
        "guava/src/com/google/common/reflect/Element.java"
        "guava/src/com/google/common/reflect/ImmutableTypeToInstanceMap.java"
        "guava/src/com/google/common/reflect/Invokable.java"
        "guava/src/com/google/common/reflect/MutableTypeToInstanceMap.java"
        "guava/src/com/google/common/reflect/Parameter.java"
        "guava/src/com/google/common/reflect/Reflection.java"
        "guava/src/com/google/common/reflect/TypeCapture.java"
        "guava/src/com/google/common/reflect/TypeParameter.java"
        "guava/src/com/google/common/reflect/TypeResolver.java"
        "guava/src/com/google/common/reflect/TypeToInstanceMap.java"
        "guava/src/com/google/common/reflect/TypeToken.java"
        "guava/src/com/google/common/reflect/TypeVisitor.java"
        "guava/src/com/google/common/reflect/Types.java"
        "guava/src/com/google/common/reflect/package-info.java"
        "guava/src/com/google/common/util/concurrent/AbstractCheckedFuture.java"
        "guava/src/com/google/common/util/concurrent/AbstractExecutionThreadService.java"
        "guava/src/com/google/common/util/concurrent/AbstractFuture.java"
        "guava/src/com/google/common/util/concurrent/AbstractIdleService.java"
        "guava/src/com/google/common/util/concurrent/AbstractListeningExecutorService.java"
        "guava/src/com/google/common/util/concurrent/AbstractScheduledService.java"
        "guava/src/com/google/common/util/concurrent/AbstractService.java"
        "guava/src/com/google/common/util/concurrent/AsyncFunction.java"
        "guava/src/com/google/common/util/concurrent/AsyncSettableFuture.java"
        "guava/src/com/google/common/util/concurrent/AtomicDouble.java"
        "guava/src/com/google/common/util/concurrent/AtomicDoubleArray.java"
        "guava/src/com/google/common/util/concurrent/AtomicLongMap.java"
        "guava/src/com/google/common/util/concurrent/Atomics.java"
        "guava/src/com/google/common/util/concurrent/Callables.java"
        "guava/src/com/google/common/util/concurrent/CheckedFuture.java"
        "guava/src/com/google/common/util/concurrent/CycleDetectingLockFactory.java"
        "guava/src/com/google/common/util/concurrent/ExecutionError.java"
        "guava/src/com/google/common/util/concurrent/ExecutionList.java"
        "guava/src/com/google/common/util/concurrent/FakeTimeLimiter.java"
        "guava/src/com/google/common/util/concurrent/ForwardingBlockingQueue.java"
        "guava/src/com/google/common/util/concurrent/ForwardingCheckedFuture.java"
        "guava/src/com/google/common/util/concurrent/ForwardingExecutorService.java"
        "guava/src/com/google/common/util/concurrent/ForwardingFuture.java"
        "guava/src/com/google/common/util/concurrent/ForwardingListenableFuture.java"
        "guava/src/com/google/common/util/concurrent/ForwardingListeningExecutorService.java"
        "guava/src/com/google/common/util/concurrent/FutureCallback.java"
        "guava/src/com/google/common/util/concurrent/FutureFallback.java"
        "guava/src/com/google/common/util/concurrent/Futures.java"
        "guava/src/com/google/common/util/concurrent/JdkFutureAdapters.java"
        "guava/src/com/google/common/util/concurrent/ListenableFuture.java"
        "guava/src/com/google/common/util/concurrent/ListenableFutureTask.java"
        "guava/src/com/google/common/util/concurrent/ListenableScheduledFuture.java"
        "guava/src/com/google/common/util/concurrent/ListenerCallQueue.java"
        "guava/src/com/google/common/util/concurrent/ListeningExecutorService.java"
        "guava/src/com/google/common/util/concurrent/ListeningScheduledExecutorService.java"
        "guava/src/com/google/common/util/concurrent/Monitor.java"
        "guava/src/com/google/common/util/concurrent/MoreExecutors.java"
        "guava/src/com/google/common/util/concurrent/RateLimiter.java"
        "guava/src/com/google/common/util/concurrent/Runnables.java"
        "guava/src/com/google/common/util/concurrent/SerializingExecutor.java"
        "guava/src/com/google/common/util/concurrent/Service.java"
        "guava/src/com/google/common/util/concurrent/ServiceManager.java"
        "guava/src/com/google/common/util/concurrent/SettableFuture.java"
        "guava/src/com/google/common/util/concurrent/SimpleTimeLimiter.java"
        "guava/src/com/google/common/util/concurrent/SmoothRateLimiter.java"
        "guava/src/com/google/common/util/concurrent/Striped.java"
        "guava/src/com/google/common/util/concurrent/ThreadFactoryBuilder.java"
        "guava/src/com/google/common/util/concurrent/TimeLimiter.java"
        "guava/src/com/google/common/util/concurrent/UncaughtExceptionHandlers.java"
        "guava/src/com/google/common/util/concurrent/UncheckedExecutionException.java"
        "guava/src/com/google/common/util/concurrent/UncheckedTimeoutException.java"
        "guava/src/com/google/common/util/concurrent/Uninterruptibles.java"
        "guava/src/com/google/common/util/concurrent/WrappingExecutorService.java"
        "guava/src/com/google/common/util/concurrent/WrappingScheduledExecutorService.java"
        "guava/src/com/google/common/util/concurrent/package-info.java"
        "guava/src/com/google/common/xml/XmlEscapers.java"
        "guava/src/com/google/common/xml/package-info.java"
        "guava/src/com/google/thirdparty/publicsuffix/PublicSuffixPatterns.java"
        "guava/src/com/google/thirdparty/publicsuffix/PublicSuffixType.java"
        "guava/src/com/google/thirdparty/publicsuffix/TrieParser.java"
    ];
    static_libs = ["jsr305"];
    java_version = "1.7";
};

#  Compatibility name for existing host modules
guavalib = java_library_host {
    name = "guavalib";
    static_libs = ["guava"];
};

in { inherit guava guavalib; }
