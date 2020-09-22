{ cc_library_static }:
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

MagickCore = cc_library_static {
    name = "MagickCore";

    sdk_version = "24";

    srcs = [
        "accelerate.c"
        "animate.c"
        "annotate.c"
        "artifact.c"
        "attribute.c"
        "blob.c"
        "cache-view.c"
        "cache.c"
        "channel.c"
        "cipher.c"
        "client.c"
        "coder.c"
        "color.c"
        "colormap.c"
        "colorspace.c"
        "compare.c"
        "composite.c"
        "compress.c"
        "configure.c"
        "constitute.c"
        "decorate.c"
        "delegate.c"
        "deprecate.c"
        "display.c"
        "distort.c"
        "distribute-cache.c"
        "draw.c"
        "effect.c"
        "enhance.c"
        "exception.c"
        "feature.c"
        "fourier.c"
        "fx.c"
        "gem.c"
        "geometry.c"
        "histogram.c"
        "identify.c"
        "image-view.c"
        "image.c"
        "layer.c"
        "linked-list.c"
        "list.c"
        "locale.c"
        "log.c"
        "magic.c"
        "magick.c"
        "matrix.c"
        "memory.c"
        "mime.c"
        "module.c"
        "monitor.c"
        "montage.c"
        "morphology.c"
        "nt-base.c"
        "nt-feature.c"
        "opencl.c"
        "option.c"
        "paint.c"
        "pixel.c"
        "policy.c"
        "prepress.c"
        "profile.c"
        "property.c"
        "quantize.c"
        "quantum-export.c"
        "quantum-import.c"
        "quantum.c"
        "random.c"
        "registry.c"
        "resample.c"
        "resize.c"
        "resource.c"
        "segment.c"
        "semaphore.c"
        "shear.c"
        "signature.c"
        "splay-tree.c"
        "static.c"
        "statistic.c"
        "stream.c"
        "string.c"
        "thread.c"
        "threshold.c"
        "timer.c"
        "token.c"
        "transform.c"
        "type.c"
        "utility.c"
        "version.c"
        "vision.c"
        "visual-effects.c"
        "vms.c"
        "widget.c"
        "xml-tree.c"
        "xwindow.c"
    ];

    cflags = [
        "-DHAVE_CONFIG_H"
        "-Wall"
        "-Werror"
        "-Wno-deprecated-register"
        "-Wno-enum-conversion"
        "-Wno-for-loop-analysis"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
    ];

    header_libs = ["Magick_headers"];
    export_header_lib_headers = ["Magick_headers"];
    visibility = ["//vendor:__subpackages__"];
};

in { inherit MagickCore; }
