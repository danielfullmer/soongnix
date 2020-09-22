{ android_app }:
let

/*
 * Copyright 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

UniversalMediaPlayer = android_app {
    name = "UniversalMediaPlayer";
    min_sdk_version = "24"; #  TODO(b/123716038) Sync min SDK version with build.gradle
    sdk_version = "28";
    srcs = [
        "gen/com/android/pump/BuildConfig.java" #  TODO(b/123702784) Remove gen/ (either generate or remove dependencies)
        "java/com/android/pump/activity/ActivityStarterActivity.java"
        "java/com/android/pump/activity/AlbumDetailsActivity.java"
        "java/com/android/pump/activity/ArtistDetailsActivity.java"
        "java/com/android/pump/activity/AudioPlayerActivity.java"
        "java/com/android/pump/activity/GenreDetailsActivity.java"
        "java/com/android/pump/activity/MovieDetailsActivity.java"
        "java/com/android/pump/activity/OtherDetailsActivity.java"
        "java/com/android/pump/activity/PlaylistDetailsActivity.java"
        "java/com/android/pump/activity/PumpActivity.java"
        "java/com/android/pump/activity/SeriesDetailsActivity.java"
        "java/com/android/pump/activity/VideoPlayerActivity.java"
        "java/com/android/pump/app/GlobalsApplication.java"
        "java/com/android/pump/app/PumpApplication.java"
        "java/com/android/pump/concurrent/Executors.java"
        "java/com/android/pump/concurrent/UniqueExecutor.java"
        "java/com/android/pump/db/Album.java"
        "java/com/android/pump/db/Artist.java"
        "java/com/android/pump/db/Audio.java"
        "java/com/android/pump/db/AudioStore.java"
        "java/com/android/pump/db/DataProvider.java"
        "java/com/android/pump/db/Episode.java"
        "java/com/android/pump/db/Genre.java"
        "java/com/android/pump/db/MediaDb.java"
        "java/com/android/pump/db/MediaProvider.java"
        "java/com/android/pump/db/Movie.java"
        "java/com/android/pump/db/Other.java"
        "java/com/android/pump/db/Playlist.java"
        "java/com/android/pump/db/Series.java"
        "java/com/android/pump/db/Video.java"
        "java/com/android/pump/db/VideoStore.java"
        "java/com/android/pump/fragment/AlbumFragment.java"
        "java/com/android/pump/fragment/ArtistFragment.java"
        "java/com/android/pump/fragment/AudioFragment.java"
        "java/com/android/pump/fragment/GenreFragment.java"
        "java/com/android/pump/fragment/HomeFragment.java"
        "java/com/android/pump/fragment/MovieFragment.java"
        "java/com/android/pump/fragment/OtherFragment.java"
        "java/com/android/pump/fragment/PermissionFragment.java"
        "java/com/android/pump/fragment/PlaylistFragment.java"
        "java/com/android/pump/fragment/SeriesFragment.java"
        "java/com/android/pump/provider/ApiKeys.java"
        "java/com/android/pump/provider/KnowledgeGraph.java"
        "java/com/android/pump/provider/OmdbApi.java"
        "java/com/android/pump/provider/Query.java"
        "java/com/android/pump/provider/Wikidata.java"
        "java/com/android/pump/ui/CustomRecycledViewPool.java"
        "java/com/android/pump/util/BitmapCache.java"
        "java/com/android/pump/util/Clog.java"
        "java/com/android/pump/util/Collections.java"
        "java/com/android/pump/util/Globals.java"
        "java/com/android/pump/util/Http.java"
        "java/com/android/pump/util/ImageLoader.java"
        "java/com/android/pump/util/IntentUtils.java"
        "java/com/android/pump/util/IoUtils.java"
        "java/com/android/pump/util/Orientation.java"
        "java/com/android/pump/util/OrientationCache.java"
        "java/com/android/pump/util/Scheme.java"
        "java/com/android/pump/widget/AspectRatioImageView.java"
        "java/com/android/pump/widget/PlaceholderImageView.java"
        "java/com/android/pump/widget/SortOrderSpinner.java"
        "java/com/android/pump/widget/UriImageView.java"
    ];
    static_libs = [
        "androidx-constraintlayout_constraintlayout"
        "androidx.media2_media2-widget"
        "androidx.media2_media2-player"
        "com.google.android.material_material"
    ];
    optimize = {
        #  TODO(b/123703963) Re-enable. Currently disabled due to issues with media2-exoplayer
        enabled = false;
    };
};

in { inherit UniversalMediaPlayer; }
