{ cc_library_shared }:
let

libandroid_runtime = cc_library_shared {
    name = "libandroid_runtime";
    host_supported = true;
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-non-virtual-dtor"
        "-Wno-maybe-uninitialized"
        "-Wno-parentheses"

        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"

        "-DU_USING_ICU_NAMESPACE=0"

        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];

    cppflags = ["-Wno-conversion-null"];

    srcs = [
        "android_animation_PropertyValuesHolder.cpp"
        "android_os_SystemClock.cpp"
        "android_os_SystemProperties.cpp"
        "android_os_Trace.cpp"
        "android_text_AndroidCharacter.cpp"
        "android_util_EventLog.cpp"
        "android_util_Log.cpp"
        "android_util_StringBlock.cpp"
        "android_util_XmlBlock.cpp"
        "android_util_jar_StrictJarFile.cpp"
        "com_android_internal_util_VirtualRefBasePtr.cpp"
    ];

    include_dirs = [
        "external/skia/include/private"
        "frameworks/base/media/jni"
        "system/media/camera/include"
        "system/media/private/camera/include"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libharfbuzz_ng"
        "libhwui"
        "liblog"
        "libminikin"
        "libnativehelper"
        "libz"
        "libziparchive"
    ];

    export_include_dirs = [
        "."
        "include"
    ];

    target = {
        android = {
            srcs = [
                "AndroidRuntime.cpp"
                "com_android_internal_content_NativeLibraryHelper.cpp"
                "com_google_android_gles_jni_EGLImpl.cpp"
                "com_google_android_gles_jni_GLImpl.cpp" #  TODO: .arm
                "android_app_Activity.cpp"
                "android_app_ActivityThread.cpp"
                "android_app_NativeActivity.cpp"
                "android_app_admin_SecurityLog.cpp"
                "android_opengl_EGL14.cpp"
                "android_opengl_EGL15.cpp"
                "android_opengl_EGLExt.cpp"
                "android_opengl_GLES10.cpp"
                "android_opengl_GLES10Ext.cpp"
                "android_opengl_GLES11.cpp"
                "android_opengl_GLES11Ext.cpp"
                "android_opengl_GLES20.cpp"
                "android_opengl_GLES30.cpp"
                "android_opengl_GLES31.cpp"
                "android_opengl_GLES31Ext.cpp"
                "android_opengl_GLES32.cpp"
                "android_database_CursorWindow.cpp"
                "android_database_SQLiteCommon.cpp"
                "android_database_SQLiteConnection.cpp"
                "android_database_SQLiteGlobal.cpp"
                "android_database_SQLiteDebug.cpp"
                "android_graphics_GraphicBuffer.cpp"
                "android_graphics_SurfaceTexture.cpp"
                "android_view_CompositionSamplingListener.cpp"
                "android_view_DisplayEventReceiver.cpp"
                "android_view_InputChannel.cpp"
                "android_view_InputDevice.cpp"
                "android_view_InputEventReceiver.cpp"
                "android_view_InputEventSender.cpp"
                "android_view_InputQueue.cpp"
                "android_view_KeyCharacterMap.cpp"
                "android_view_KeyEvent.cpp"
                "android_view_MotionEvent.cpp"
                "android_view_PointerIcon.cpp"
                "android_view_Surface.cpp"
                "android_view_SurfaceControl.cpp"
                "android_graphics_BLASTBufferQueue.cpp"
                "android_view_SurfaceSession.cpp"
                "android_view_TextureView.cpp"
                "android_view_VelocityTracker.cpp"
                "android_view_VerifiedKeyEvent.cpp"
                "android_view_VerifiedMotionEvent.cpp"
                "android_text_Hyphenator.cpp"
                "android_os_Debug.cpp"
                "android_os_GraphicsEnvironment.cpp"
                "android_os_HidlMemory.cpp"
                "android_os_HidlSupport.cpp"
                "android_os_HwBinder.cpp"
                "android_os_HwBlob.cpp"
                "android_os_HwParcel.cpp"
                "android_os_HwRemoteBinder.cpp"
                "android_os_NativeHandle.cpp"
                "android_os_MemoryFile.cpp"
                "android_os_MessageQueue.cpp"
                "android_os_Parcel.cpp"
                "android_os_SELinux.cpp"
                "android_os_ServiceManager.cpp"
                "android_os_SharedMemory.cpp"
                "android_os_storage_StorageManager.cpp"
                "android_os_UEventObserver.cpp"
                "android_os_VintfObject.cpp"
                "android_os_VintfRuntimeInfo.cpp"
                "android_os_incremental_IncrementalManager.cpp"
                "android_net_LocalSocketImpl.cpp"
                "android_net_NetUtils.cpp"
                "android_service_DataLoaderService.cpp"
                "android_util_AssetManager.cpp"
                "android_util_Binder.cpp"
                "android_util_MemoryIntArray.cpp"
                "android_util_Process.cpp"
                "android_media_AudioDeviceAttributes.cpp"
                "android_media_AudioEffectDescriptor.cpp"
                "android_media_AudioRecord.cpp"
                "android_media_AudioSystem.cpp"
                "android_media_AudioTrackCallback.cpp"
                "android_media_AudioTrack.cpp"
                "android_media_AudioAttributes.cpp"
                "android_media_AudioProductStrategies.cpp"
                "android_media_AudioVolumeGroups.cpp"
                "android_media_AudioVolumeGroupCallback.cpp"
                "android_media_DeviceCallback.cpp"
                "android_media_MediaMetricsJNI.cpp"
                "android_media_MicrophoneInfo.cpp"
                "android_media_midi.cpp"
                "android_media_RemoteDisplay.cpp"
                "android_media_ToneGenerator.cpp"
                "android_hardware_Camera.cpp"
                "android_hardware_camera2_CameraMetadata.cpp"
                "android_hardware_camera2_legacy_LegacyCameraDevice.cpp"
                "android_hardware_camera2_legacy_PerfMeasurement.cpp"
                "android_hardware_camera2_DngCreator.cpp"
                "android_hardware_display_DisplayManagerGlobal.cpp"
                "android_hardware_display_DisplayViewport.cpp"
                "android_hardware_HardwareBuffer.cpp"
                "android_hardware_SensorManager.cpp"
                "android_hardware_SerialPort.cpp"
                "android_hardware_UsbDevice.cpp"
                "android_hardware_UsbDeviceConnection.cpp"
                "android_hardware_UsbRequest.cpp"
                "android_hardware_location_ActivityRecognitionHardware.cpp"
                "android_util_FileObserver.cpp"
                "android/opengl/poly_clip.cpp" #  TODO: .arm
                "android/opengl/util.cpp"
                "android_server_NetworkManagementSocketTagger.cpp"
                "android_ddm_DdmHandleNativeHeap.cpp"
                "android_backup_BackupDataInput.cpp"
                "android_backup_BackupDataOutput.cpp"
                "android_backup_FileBackupHelperBase.cpp"
                "android_backup_BackupHelperDispatcher.cpp"
                "android_app_backup_FullBackup.cpp"
                "android_content_res_ApkAssets.cpp"
                "android_content_res_ObbScanner.cpp"
                "android_content_res_Configuration.cpp"
                "android_security_Scrypt.cpp"
                "com_android_internal_content_om_OverlayConfig.cpp"
                "com_android_internal_os_ClassLoaderFactory.cpp"
                "com_android_internal_os_FuseAppLoop.cpp"
                "com_android_internal_os_KernelCpuUidBpfMapReader.cpp"
                "com_android_internal_os_KernelSingleUidTimeReader.cpp"
                "com_android_internal_os_Zygote.cpp"
                "com_android_internal_os_ZygoteInit.cpp"
                "hwbinder/EphemeralStorage.cpp"
                "fd_utils.cpp"
                "android_hardware_input_InputWindowHandle.cpp"
                "android_hardware_input_InputApplicationHandle.cpp"
            ];

            static_libs = [
                "libasync_safe"
                "libbinderthreadstateutils"
                "libdmabufinfo"
                "libgif"
                "libseccomp_policy"
                "libgrallocusage"
                "libscrypt_static"
            ];

            shared_libs = [
                "libandroidicu"
                "libbpf_android"
                "libnetdbpf"
                "libnetdutils"
                "libmemtrack"
                "libandroidfw"
                "libappfuse"
                "libcrypto"
                "libcutils"
                "libdebuggerd_client"
                "libutils"
                "libbinder"
                "libui"
                "libgraphicsenv"
                "libgui"
                "libmediandk"
                "libsensor"
                "libinput"
                "libcamera_client"
                "libcamera_metadata"
                "libsqlite"
                "libEGL"
                "libGLESv1_CM"
                "libGLESv2"
                "libGLESv3"
                "libincfs"
                "libdataloader"
                "libvulkan"
                "libETC1"
                "libhardware"
                "libhardware_legacy"
                "libselinux"
                "libmedia"
                "libmedia_helper"
                "libmediametrics"
                "libmeminfo"
                "libaudioclient"
                "libaudiofoundation"
                "libaudiopolicy"
                "libusbhost"
                "libpdfium"
                "libimg_utils"
                "libnetd_client"
                "libprocessgroup"
                "libnativebridge_lazy"
                "libnativeloader_lazy"
                "libmemunreachable"
                "libhidlbase"
                "libvintf"
                "libnativedisplay"
                "libnativewindow"
                "libdl"
                "libdl_android"
                "libstatslog"
                "libstatssocket"
                "libtimeinstate"
                "server_configurable_flags"
                "libstatspull"
            ];
            export_shared_lib_headers = [
                #  AndroidRuntime.h depends on nativehelper/jni.h
                "libnativehelper"

                #  our headers include libnativewindow's public headers
                "libnativewindow"
            ];
            header_libs = [
                "bionic_libc_platform_headers"
                "dnsproxyd_protocol_headers"
            ];
        };
        host = {
            cflags = [
                "-Wno-unused-const-variable"
                "-Wno-unused-function"
            ];
            srcs = [
                "LayoutlibLoader.cpp"
            ];
            include_dirs = [
                "external/vulkan-headers/include"
                "frameworks/native/libs/nativebase/include"
                "frameworks/native/libs/nativewindow/include"
            ];
            shared_libs = [
                "libicui18n"
                "libicuuc"
            ];
            static_libs = [
                "libandroidfw"
                "libcompiler_rt"
                "libutils"
                "libhostgraphics"
            ];
        };
        linux_glibc = {
            srcs = [
                "android_content_res_ApkAssets.cpp"
                "android_os_MessageQueue.cpp"
                "android_util_AssetManager.cpp"
                "android_util_FileObserver.cpp"
            ];
        };
    };
};

in { inherit libandroid_runtime; }
