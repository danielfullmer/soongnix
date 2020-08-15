{ cc_library_static }:
let

libLLVMCodeGen = cc_library_static {
    name = "libLLVMCodeGen";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "AggressiveAntiDepBreaker.cpp"
        "AllocationOrder.cpp"
        "Analysis.cpp"
        "AtomicExpandPass.cpp"
        "BasicTargetTransformInfo.cpp"
        "BranchFolding.cpp"
        "BuiltinGCs.cpp"
        "CalcSpillWeights.cpp"
        "CallingConvLower.cpp"
        "CodeGen.cpp"
        "CodeGenPrepare.cpp"
        "CriticalAntiDepBreaker.cpp"
        "DFAPacketizer.cpp"
        "DeadMachineInstructionElim.cpp"
        "DetectDeadLanes.cpp"
        "DwarfEHPrepare.cpp"
        "EarlyIfConversion.cpp"
        "EdgeBundles.cpp"
        "ExecutionDepsFix.cpp"
        "ExpandISelPseudos.cpp"
        "ExpandPostRAPseudos.cpp"
        "FaultMaps.cpp"
        "FuncletLayout.cpp"
        "GCMetadata.cpp"
        "GCMetadataPrinter.cpp"
        "GCRootLowering.cpp"
        "GCStrategy.cpp"
        "GlobalMerge.cpp"
        "IfConversion.cpp"
        "ImplicitNullChecks.cpp"
        "InlineSpiller.cpp"
        "InterferenceCache.cpp"
        "InterleavedAccessPass.cpp"
        "IntrinsicLowering.cpp"
        "LLVMTargetMachine.cpp"
        "LatencyPriorityQueue.cpp"
        "LexicalScopes.cpp"
        "LiveDebugValues.cpp"
        "LiveDebugVariables.cpp"
        "LiveInterval.cpp"
        "LiveIntervalAnalysis.cpp"
        "LiveIntervalUnion.cpp"
        "LivePhysRegs.cpp"
        "LiveRangeCalc.cpp"
        "LiveRangeEdit.cpp"
        "LiveRegMatrix.cpp"
        "LiveStackAnalysis.cpp"
        "LiveVariables.cpp"
        "LocalStackSlotAllocation.cpp"
        "LowerEmuTLS.cpp"
        "MIRPrinter.cpp"
        "MIRPrintingPass.cpp"
        "MachineBasicBlock.cpp"
        "MachineBlockFrequencyInfo.cpp"
        "MachineBlockPlacement.cpp"
        "MachineBranchProbabilityInfo.cpp"
        "MachineCSE.cpp"
        "MachineCombiner.cpp"
        "MachineCopyPropagation.cpp"
        "MachineDominanceFrontier.cpp"
        "MachineDominators.cpp"
        "MachineFunction.cpp"
        "MachineFunctionAnalysis.cpp"
        "MachineFunctionPass.cpp"
        "MachineFunctionPrinterPass.cpp"
        "MachineInstr.cpp"
        "MachineInstrBundle.cpp"
        "MachineLICM.cpp"
        "MachineLoopInfo.cpp"
        "MachineModuleInfo.cpp"
        "MachineModuleInfoImpls.cpp"
        "MachinePassRegistry.cpp"
        "MachinePipeliner.cpp"
        "MachinePostDominators.cpp"
        "MachineRegionInfo.cpp"
        "MachineRegisterInfo.cpp"
        "MachineSSAUpdater.cpp"
        "MachineScheduler.cpp"
        "MachineSink.cpp"
        "MachineTraceMetrics.cpp"
        "MachineVerifier.cpp"
        "OptimizePHIs.cpp"
        "PHIElimination.cpp"
        "PHIEliminationUtils.cpp"
        "ParallelCG.cpp"
        "PatchableFunction.cpp"
        "PeepholeOptimizer.cpp"
        "PostRAHazardRecognizer.cpp"
        "PostRASchedulerList.cpp"
        "PreISelIntrinsicLowering.cpp"
        "ProcessImplicitDefs.cpp"
        "PrologEpilogInserter.cpp"
        "PseudoSourceValue.cpp"
        "RegAllocBase.cpp"
        "RegAllocBasic.cpp"
        "RegAllocFast.cpp"
        "RegAllocGreedy.cpp"
        "RegAllocPBQP.cpp"
        "RegUsageInfoCollector.cpp"
        "RegUsageInfoPropagate.cpp"
        "RegisterClassInfo.cpp"
        "RegisterCoalescer.cpp"
        "RegisterPressure.cpp"
        "RegisterScavenging.cpp"
        "RegisterUsageInfo.cpp"
        "RenameIndependentSubregs.cpp"
        "SafeStack.cpp"
        "SafeStackColoring.cpp"
        "SafeStackLayout.cpp"
        "ScheduleDAG.cpp"
        "ScheduleDAGInstrs.cpp"
        "ScheduleDAGPrinter.cpp"
        "ScoreboardHazardRecognizer.cpp"
        "ShadowStackGCLowering.cpp"
        "ShrinkWrap.cpp"
        "SjLjEHPrepare.cpp"
        "SlotIndexes.cpp"
        "SpillPlacement.cpp"
        "SplitKit.cpp"
        "StackColoring.cpp"
        "StackMapLivenessAnalysis.cpp"
        "StackMaps.cpp"
        "StackProtector.cpp"
        "StackSlotColoring.cpp"
        "TailDuplication.cpp"
        "TailDuplicator.cpp"
        "TargetFrameLoweringImpl.cpp"
        "TargetInstrInfo.cpp"
        "TargetLoweringBase.cpp"
        "TargetLoweringObjectFileImpl.cpp"
        "TargetOptionsImpl.cpp"
        "TargetPassConfig.cpp"
        "TargetRegisterInfo.cpp"
        "TargetSchedule.cpp"
        "TwoAddressInstructionPass.cpp"
        "UnreachableBlockElim.cpp"
        "VirtRegMap.cpp"
        "WinEHPrepare.cpp"
        "XRayInstrumentation.cpp"
    ];
};

subdirs = ["*"];

in { inherit libLLVMCodeGen; }
