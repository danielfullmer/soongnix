{ cc_library_host_static, cc_library_shared }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

libctsopengl_jni = cc_library_shared {
    name = "libctsopengl_jni";

    cflags = [
        #  Needed in order to use fences for synchronization
        "-DEGL_EGLEXT_PROTOTYPES"
        "-funsigned-char"

        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    #  Get all cpp files but not hidden files
    srcs = [
        "graphics/GLUtils.cpp"
        "graphics/Matrix.cpp"
        "graphics/Mesh.cpp"
        "graphics/MeshNode.cpp"
        "graphics/PerspectiveMeshNode.cpp"
        "graphics/PerspectiveProgram.cpp"
        "graphics/Program.cpp"
        "graphics/ProgramNode.cpp"
        "graphics/Renderer.cpp"
        "graphics/SceneGraphNode.cpp"
        "graphics/TexturedMeshNode.cpp"
        "graphics/TransformationNode.cpp"
        "graphics/Vector2D.cpp"
        "primitive/GLPrimitive.cpp"
        "primitive/contextswitch/ContextSwitchRenderer.cpp"
        "primitive/fullpipeline/FullPipelineRenderer.cpp"
        "primitive/pixeloutput/PixelOutputRenderer.cpp"
        "primitive/shaderperf/ShaderPerfRenderer.cpp"
        "reference/GLReference.cpp"
        "reference/ReferenceRenderer.cpp"
        "reference/scene/Scene.cpp"
        "reference/scene/flocking/Boid.cpp"
        "reference/scene/flocking/FlockingScene.cpp"
        "reference/scene/flocking/WaterMeshNode.cpp"
        "reference/scene/glowing/BlurMeshNode.cpp"
        "reference/scene/glowing/GlowingScene.cpp"
    ];

    shared_libs = [
        "libEGL"
        "libGLESv2"
        "libandroid"
        "liblog"
    ];

    sdk_version = "current";
    stl = "c++_static";
};

libctsopengl_test = cc_library_host_static {
    name = "libctsopengl_test";

    srcs = ["graphics/Matrix.cpp"];
    export_include_dirs = ["graphics"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libctsopengl_jni libctsopengl_test; }
