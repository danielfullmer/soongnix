{ bootstrap_go_package, cc_library_static, filegroup, wayland_protocol_codegen }:
let

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

#  Build and use the "wayland_protocol_codegen" extension.
soong-wayland-protocol-codegen = bootstrap_go_package {
    name = "soong-wayland-protocol-codegen";
    pkgPath = "android/soong/external/wayland-protocol";
    deps = [
        "blueprint"
        "blueprint-proptools"
        "soong-android"
        "soong-genrule"
    ];
    srcs = [
        "wayland_protocol_codegen.go"
    ];
    pluginFor = ["soong_build"];
};

wayland_extension_protocols = filegroup {
    name = "wayland_extension_protocols";
    srcs = [
        "freedesktop.org/stable/presentation-time/presentation-time.xml"
        "freedesktop.org/stable/viewporter/viewporter.xml"
        "freedesktop.org/unstable/fullscreen-shell/fullscreen-shell-unstable-v1.xml"
        "freedesktop.org/unstable/idle-inhibit/idle-inhibit-unstable-v1.xml"
        "freedesktop.org/unstable/input-method/input-method-unstable-v1.xml"
        "freedesktop.org/unstable/keyboard-shortcuts-inhibit/keyboard-shortcuts-inhibit-unstable-v1.xml"
        "freedesktop.org/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml"
        "freedesktop.org/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml"
        "freedesktop.org/unstable/pointer-gestures/pointer-gestures-unstable-v1.xml"
        "freedesktop.org/unstable/relative-pointer/relative-pointer-unstable-v1.xml"
        "freedesktop.org/unstable/tablet/tablet-unstable-v1.xml"
        "freedesktop.org/unstable/tablet/tablet-unstable-v2.xml"
        "freedesktop.org/unstable/text-input/text-input-unstable-v1.xml"
        "freedesktop.org/unstable/xdg-foreign/xdg-foreign-unstable-v1.xml"
        "freedesktop.org/unstable/xdg-foreign/xdg-foreign-unstable-v2.xml"
        "freedesktop.org/unstable/xdg-output/xdg-output-unstable-v1.xml"
        "freedesktop.org/unstable/xdg-shell/xdg-shell-unstable-v5.xml"
        "freedesktop.org/unstable/xdg-shell/xdg-shell-unstable-v6.xml"
        "freedesktop.org/unstable/xwayland-keyboard-grab/xwayland-keyboard-grab-unstable-v1.xml"
        "chromium.org/unstable/alpha-compositing/alpha-compositing-unstable-v1.xml"
        "chromium.org/unstable/aura-shell/aura-shell.xml"
        "chromium.org/unstable/cursor-shapes/cursor-shapes-unstable-v1.xml"
        "chromium.org/unstable/gaming-input/gaming-input-unstable-v1.xml"
        "chromium.org/unstable/gaming-input/gaming-input-unstable-v2.xml"
        "chromium.org/unstable/keyboard/keyboard-configuration-unstable-v1.xml"
        "chromium.org/unstable/keyboard/keyboard-extension-unstable-v1.xml"
        "chromium.org/unstable/remote-shell/remote-shell-unstable-v1.xml"
        "chromium.org/unstable/secure-output/secure-output-unstable-v1.xml"
        "chromium.org/unstable/stylus/stylus-unstable-v2.xml"
        "chromium.org/unstable/stylus-tools/stylus-tools-unstable-v1.xml"
        "chromium.org/unstable/vsync-feedback/vsync-feedback-unstable-v1.xml"
    ];
};

#  Generate protocol source files used by both client and server
wayland_extension_protocol_sources = wayland_protocol_codegen {
    name = "wayland_extension_protocol_sources";
    cmd = "$(location wayland_scanner) code < $(in) > $(out)";
    suffix = ".c";
    srcs = [":wayland_extension_protocols"];
    tools = ["wayland_scanner"];
};

#  Generate protocol header files used by the client
wayland_extension_client_protocol_headers = wayland_protocol_codegen {
    name = "wayland_extension_client_protocol_headers";
    cmd = "$(location wayland_scanner) client-header < $(in) > $(out)";
    suffix = "-client-protocol.h";
    srcs = [":wayland_extension_protocols"];
    tools = ["wayland_scanner"];
};

#  Generate protocol header files used by the server
wayland_extension_server_protocol_headers = wayland_protocol_codegen {
    name = "wayland_extension_server_protocol_headers";
    cmd = "$(location wayland_scanner) server-header < $(in) > $(out)";
    suffix = "-server-protocol.h";
    srcs = [":wayland_extension_protocols"];
    tools = ["wayland_scanner"];
};

#  Generate a library with the protocol files, configured to export the client
#  header files
libwayland_extension_client_protocols = cc_library_static {
    name = "libwayland_extension_client_protocols";
    vendor_available = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-g"
        "-fvisibility=hidden"
    ];
    static_libs = ["libwayland_client"];
    generated_sources = ["wayland_extension_protocol_sources"];
    generated_headers = ["wayland_extension_client_protocol_headers"];
    export_generated_headers = ["wayland_extension_client_protocol_headers"];
};

subdirs = ["flinger_headers"];

in { inherit libwayland_extension_client_protocols soong-wayland-protocol-codegen wayland_extension_client_protocol_headers wayland_extension_protocol_sources wayland_extension_protocols wayland_extension_server_protocol_headers; }
