{ cc_library_static }:
let

#  Music bundle
libmusicbundle = cc_library_static {
    name = "libmusicbundle";

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    vendor = true;
    srcs = [
        "StereoWidening/src/LVCS_BypassMix.cpp"
        "StereoWidening/src/LVCS_Control.cpp"
        "StereoWidening/src/LVCS_Equaliser.cpp"
        "StereoWidening/src/LVCS_Init.cpp"
        "StereoWidening/src/LVCS_Process.cpp"
        "StereoWidening/src/LVCS_ReverbGenerator.cpp"
        "StereoWidening/src/LVCS_StereoEnhancer.cpp"
        "StereoWidening/src/LVCS_Tables.cpp"
        "Bass/src/LVDBE_Control.cpp"
        "Bass/src/LVDBE_Init.cpp"
        "Bass/src/LVDBE_Process.cpp"
        "Bass/src/LVDBE_Tables.cpp"
        "Bundle/src/LVM_API_Specials.cpp"
        "Bundle/src/LVM_Buffers.cpp"
        "Bundle/src/LVM_Init.cpp"
        "Bundle/src/LVM_Process.cpp"
        "Bundle/src/LVM_Tables.cpp"
        "Bundle/src/LVM_Control.cpp"
        "SpectrumAnalyzer/src/LVPSA_Control.cpp"
        "SpectrumAnalyzer/src/LVPSA_Init.cpp"
        "SpectrumAnalyzer/src/LVPSA_Memory.cpp"
        "SpectrumAnalyzer/src/LVPSA_Process.cpp"
        "SpectrumAnalyzer/src/LVPSA_QPD_Init.cpp"
        "SpectrumAnalyzer/src/LVPSA_QPD_Process.cpp"
        "SpectrumAnalyzer/src/LVPSA_Tables.cpp"
        "Eq/src/LVEQNB_CalcCoef.cpp"
        "Eq/src/LVEQNB_Control.cpp"
        "Eq/src/LVEQNB_Init.cpp"
        "Eq/src/LVEQNB_Process.cpp"
        "Eq/src/LVEQNB_Tables.cpp"
        "Common/src/InstAlloc.cpp"
        "Common/src/DC_2I_D16_TRC_WRA_01.cpp"
        "Common/src/DC_2I_D16_TRC_WRA_01_Init.cpp"
        "Common/src/FO_2I_D16F32C15_LShx_TRC_WRA_01.cpp"
        "Common/src/FO_2I_D16F32Css_LShx_TRC_WRA_01_Init.cpp"
        "Common/src/FO_1I_D16F16C15_TRC_WRA_01.cpp"
        "Common/src/FO_1I_D16F16Css_TRC_WRA_01_Init.cpp"
        "Common/src/BP_1I_D16F32C30_TRC_WRA_01.cpp"
        "Common/src/BP_1I_D16F16C14_TRC_WRA_01.cpp"
        "Common/src/BP_1I_D32F32C30_TRC_WRA_02.cpp"
        "Common/src/BP_1I_D16F16Css_TRC_WRA_01_Init.cpp"
        "Common/src/BP_1I_D16F32Cll_TRC_WRA_01_Init.cpp"
        "Common/src/BP_1I_D32F32Cll_TRC_WRA_02_Init.cpp"
        "Common/src/BQ_2I_D32F32Cll_TRC_WRA_01_Init.cpp"
        "Common/src/BQ_2I_D32F32C30_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F32C15_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F32C14_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F32C13_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F32Css_TRC_WRA_01_init.cpp"
        "Common/src/BQ_2I_D16F16C15_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F16C14_TRC_WRA_01.cpp"
        "Common/src/BQ_2I_D16F16Css_TRC_WRA_01_Init.cpp"
        "Common/src/BQ_1I_D16F16C15_TRC_WRA_01.cpp"
        "Common/src/BQ_1I_D16F16Css_TRC_WRA_01_Init.cpp"
        "Common/src/BQ_1I_D16F32C14_TRC_WRA_01.cpp"
        "Common/src/BQ_1I_D16F32Css_TRC_WRA_01_init.cpp"
        "Common/src/PK_2I_D32F32C30G11_TRC_WRA_01.cpp"
        "Common/src/PK_2I_D32F32C14G11_TRC_WRA_01.cpp"
        "Common/src/PK_2I_D32F32CssGss_TRC_WRA_01_Init.cpp"
        "Common/src/PK_2I_D32F32CllGss_TRC_WRA_01_Init.cpp"
        "Common/src/Int16LShiftToInt32_16x32.cpp"
        "Common/src/From2iToMono_16.cpp"
        "Common/src/Copy_16.cpp"
        "Common/src/MonoTo2I_16.cpp"
        "Common/src/MonoTo2I_32.cpp"
        "Common/src/LoadConst_16.cpp"
        "Common/src/LoadConst_32.cpp"
        "Common/src/dB_to_Lin32.cpp"
        "Common/src/Shift_Sat_v16xv16.cpp"
        "Common/src/Shift_Sat_v32xv32.cpp"
        "Common/src/Abs_32.cpp"
        "Common/src/Int32RShiftToInt16_Sat_32x16.cpp"
        "Common/src/From2iToMono_32.cpp"
        "Common/src/mult3s_16x16.cpp"
        "Common/src/Mult3s_32x16.cpp"
        "Common/src/NonLinComp_D16.cpp"
        "Common/src/DelayMix_16x16.cpp"
        "Common/src/MSTo2i_Sat_16x16.cpp"
        "Common/src/From2iToMS_16x16.cpp"
        "Common/src/Mac3s_Sat_16x16.cpp"
        "Common/src/Mac3s_Sat_32x16.cpp"
        "Common/src/Add2_Sat_16x16.cpp"
        "Common/src/Add2_Sat_32x32.cpp"
        "Common/src/LVC_MixSoft_1St_2i_D16C31_SAT.cpp"
        "Common/src/LVC_MixSoft_1St_D16C31_SAT.cpp"
        "Common/src/LVC_Mixer_VarSlope_SetTimeConstant.cpp"
        "Common/src/LVC_Mixer_SetTimeConstant.cpp"
        "Common/src/LVC_Mixer_SetTarget.cpp"
        "Common/src/LVC_Mixer_GetTarget.cpp"
        "Common/src/LVC_Mixer_Init.cpp"
        "Common/src/LVC_Core_MixHard_1St_2i_D16C31_SAT.cpp"
        "Common/src/LVC_Core_MixSoft_1St_2i_D16C31_WRA.cpp"
        "Common/src/LVC_Core_MixInSoft_D16C31_SAT.cpp"
        "Common/src/LVC_Mixer_GetCurrent.cpp"
        "Common/src/LVC_MixSoft_2St_D16C31_SAT.cpp"
        "Common/src/LVC_Core_MixSoft_1St_D16C31_WRA.cpp"
        "Common/src/LVC_Core_MixHard_2St_D16C31_SAT.cpp"
        "Common/src/LVC_MixInSoft_D16C31_SAT.cpp"
        "Common/src/AGC_MIX_VOL_2St1Mon_D32_WRA.cpp"
        "Common/src/LVM_Timer.cpp"
        "Common/src/LVM_Timer_Init.cpp"
    ];

    local_include_dirs = [
        "Eq/lib"
        "Eq/src"
        "Bass/lib"
        "Bass/src"
        "Common/src"
        "Bundle/src"
        "SpectrumAnalyzer/lib"
        "SpectrumAnalyzer/src"
        "StereoWidening/src"
        "StereoWidening/lib"
    ];
    export_include_dirs = [
        "Common/lib"
        "Bundle/lib"
    ];
    shared_libs = [
        "liblog"
    ];
    header_libs = [
        "libhardware_headers"
    ];
    cppflags = [
        "-fvisibility=hidden"
        "-DSUPPORT_MC"

        "-Wall"
        "-Werror"
    ];

};

#  Reverb library
libreverb = cc_library_static {
    name = "libreverb";

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    vendor = true;
    srcs = [
        "Reverb/src/LVREV_ApplyNewSettings.cpp"
        "Reverb/src/LVREV_ClearAudioBuffers.cpp"
        "Reverb/src/LVREV_GetControlParameters.cpp"
        "Reverb/src/LVREV_GetInstanceHandle.cpp"
        "Reverb/src/LVREV_GetMemoryTable.cpp"
        "Reverb/src/LVREV_Process.cpp"
        "Reverb/src/LVREV_SetControlParameters.cpp"
        "Reverb/src/LVREV_Tables.cpp"
        "Common/src/Abs_32.cpp"
        "Common/src/InstAlloc.cpp"
        "Common/src/LoadConst_16.cpp"
        "Common/src/LoadConst_32.cpp"
        "Common/src/From2iToMono_32.cpp"
        "Common/src/Mult3s_32x16.cpp"
        "Common/src/FO_1I_D32F32C31_TRC_WRA_01.cpp"
        "Common/src/FO_1I_D32F32Cll_TRC_WRA_01_Init.cpp"
        "Common/src/DelayAllPass_Sat_32x16To32.cpp"
        "Common/src/Copy_16.cpp"
        "Common/src/Mac3s_Sat_32x16.cpp"
        "Common/src/DelayWrite_32.cpp"
        "Common/src/Shift_Sat_v32xv32.cpp"
        "Common/src/Add2_Sat_32x32.cpp"
        "Common/src/JoinTo2i_32x32.cpp"
        "Common/src/MonoTo2I_32.cpp"
        "Common/src/LVM_FO_HPF.cpp"
        "Common/src/LVM_FO_LPF.cpp"
        "Common/src/LVM_Polynomial.cpp"
        "Common/src/LVM_Power10.cpp"
        "Common/src/LVM_GetOmega.cpp"
        "Common/src/MixSoft_2St_D32C31_SAT.cpp"
        "Common/src/MixSoft_1St_D32C31_WRA.cpp"
        "Common/src/MixInSoft_D32C31_SAT.cpp"
        "Common/src/LVM_Mixer_TimeConstant.cpp"
        "Common/src/Core_MixHard_2St_D32C31_SAT.cpp"
        "Common/src/Core_MixSoft_1St_D32C31_WRA.cpp"
        "Common/src/Core_MixInSoft_D32C31_SAT.cpp"
    ];

    local_include_dirs = [
        "Reverb/src"
        "Common/src"
    ];
    export_include_dirs = [
        "Reverb/lib"
        "Common/lib"
    ];

    cppflags = [
        "-fvisibility=hidden"

        "-Wall"
        "-Werror"
    ];
};

in { inherit libmusicbundle libreverb; }
