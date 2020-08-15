{ java_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

universal-tween-engine = java_library {
    name = "universal-tween-engine";
    srcs = [
        "java/api/src/aurelienribon/tweenengine/BaseTween.java"
        "java/api/src/aurelienribon/tweenengine/Pool.java"
        "java/api/src/aurelienribon/tweenengine/Timeline.java"
        "java/api/src/aurelienribon/tweenengine/Tween.java"
        "java/api/src/aurelienribon/tweenengine/TweenAccessor.java"
        "java/api/src/aurelienribon/tweenengine/TweenCallback.java"
        "java/api/src/aurelienribon/tweenengine/TweenEquation.java"
        "java/api/src/aurelienribon/tweenengine/TweenEquations.java"
        "java/api/src/aurelienribon/tweenengine/TweenManager.java"
        "java/api/src/aurelienribon/tweenengine/TweenPath.java"
        "java/api/src/aurelienribon/tweenengine/TweenPaths.java"
        "java/api/src/aurelienribon/tweenengine/TweenUtils.java"
        "java/api/src/aurelienribon/tweenengine/equations/Back.java"
        "java/api/src/aurelienribon/tweenengine/equations/Bounce.java"
        "java/api/src/aurelienribon/tweenengine/equations/Circ.java"
        "java/api/src/aurelienribon/tweenengine/equations/Cubic.java"
        "java/api/src/aurelienribon/tweenengine/equations/Elastic.java"
        "java/api/src/aurelienribon/tweenengine/equations/Expo.java"
        "java/api/src/aurelienribon/tweenengine/equations/Linear.java"
        "java/api/src/aurelienribon/tweenengine/equations/Quad.java"
        "java/api/src/aurelienribon/tweenengine/equations/Quart.java"
        "java/api/src/aurelienribon/tweenengine/equations/Quint.java"
        "java/api/src/aurelienribon/tweenengine/equations/Sine.java"
        "java/api/src/aurelienribon/tweenengine/paths/CatmullRom.java"
        "java/api/src/aurelienribon/tweenengine/paths/Linear.java"
        "java/api/src/aurelienribon/tweenengine/primitives/MutableFloat.java"
        "java/api/src/aurelienribon/tweenengine/primitives/MutableInteger.java"
    ];
    sdk_version = "current";
};

in { inherit universal-tween-engine; }
