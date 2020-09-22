{ java_library }:
let

#  Copyright 2011, The Android Open Source Project
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

"com.android.gallery3d.common2" = java_library {
    name = "com.android.gallery3d.common2";
    srcs = [
        "src/com/android/gallery3d/common/ApiHelper.java"
        "src/com/android/gallery3d/common/AsyncTaskUtil.java"
        "src/com/android/gallery3d/common/BitmapUtils.java"
        "src/com/android/gallery3d/common/BlobCache.java"
        "src/com/android/gallery3d/common/Entry.java"
        "src/com/android/gallery3d/common/EntrySchema.java"
        "src/com/android/gallery3d/common/FileCache.java"
        "src/com/android/gallery3d/common/Fingerprint.java"
        "src/com/android/gallery3d/common/HttpClientFactory.java"
        "src/com/android/gallery3d/common/LruCache.java"
        "src/com/android/gallery3d/common/OverScroller.java"
        "src/com/android/gallery3d/common/Scroller.java"
        "src/com/android/gallery3d/common/Utils.java"
        "src/com/android/gallery3d/exif/ByteBufferInputStream.java"
        "src/com/android/gallery3d/exif/CountedDataInputStream.java"
        "src/com/android/gallery3d/exif/ExifData.java"
        "src/com/android/gallery3d/exif/ExifInterface.java"
        "src/com/android/gallery3d/exif/ExifInvalidFormatException.java"
        "src/com/android/gallery3d/exif/ExifModifier.java"
        "src/com/android/gallery3d/exif/ExifOutputStream.java"
        "src/com/android/gallery3d/exif/ExifParser.java"
        "src/com/android/gallery3d/exif/ExifReader.java"
        "src/com/android/gallery3d/exif/ExifTag.java"
        "src/com/android/gallery3d/exif/IfdData.java"
        "src/com/android/gallery3d/exif/IfdId.java"
        "src/com/android/gallery3d/exif/JpegHeader.java"
        "src/com/android/gallery3d/exif/OrderedDataOutputStream.java"
        "src/com/android/gallery3d/exif/Rational.java"
        "src/com/android/gallery3d/jpegstream/JPEGInputStream.java"
        "src/com/android/gallery3d/jpegstream/JPEGOutputStream.java"
        "src/com/android/gallery3d/jpegstream/JpegConfig.java"
        "src/com/android/gallery3d/jpegstream/StreamUtils.java"
        "src/com/android/gallery3d/util/Future.java"
        "src/com/android/gallery3d/util/FutureListener.java"
        "src/com/android/gallery3d/util/PriorityThreadFactory.java"
        "src/com/android/gallery3d/util/ThreadPool.java"
    ];
    sdk_version = "16";
};

in { inherit "com.android.gallery3d.common2"; }
