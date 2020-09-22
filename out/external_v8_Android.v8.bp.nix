{ cc_library_static }:
let

#  GENERATED, do not edit
#  for changes, see genmakefiles.py
libv8src = cc_library_static {
    name = "libv8src";
    defaults = ["v8_defaults"];
    srcs = [
        "src/accessors.cc"
        "src/address-map.cc"
        "src/allocation.cc"
        "src/api-arguments.cc"
        "src/api-natives.cc"
        "src/api.cc"
        "src/arguments.cc"
        "src/asmjs/asm-js.cc"
        "src/asmjs/asm-parser.cc"
        "src/asmjs/asm-scanner.cc"
        "src/asmjs/asm-types.cc"
        "src/asmjs/switch-logic.cc"
        "src/assembler.cc"
        "src/assert-scope.cc"
        "src/ast/ast-function-literal-id-reindexer.cc"
        "src/ast/ast-value-factory.cc"
        "src/ast/ast.cc"
        "src/ast/context-slot-cache.cc"
        "src/ast/modules.cc"
        "src/ast/prettyprinter.cc"
        "src/ast/scopes.cc"
        "src/ast/variables.cc"
        "src/bailout-reason.cc"
        "src/basic-block-profiler.cc"
        "src/bignum-dtoa.cc"
        "src/bignum.cc"
        "src/bit-vector.cc"
        "src/bootstrapper.cc"
        "src/builtins/builtins-api.cc"
        "src/builtins/builtins-arguments-gen.cc"
        "src/builtins/builtins-array-gen.cc"
        "src/builtins/builtins-array.cc"
        "src/builtins/builtins-arraybuffer.cc"
        "src/builtins/builtins-async-function-gen.cc"
        "src/builtins/builtins-async-gen.cc"
        "src/builtins/builtins-async-generator-gen.cc"
        "src/builtins/builtins-async-iterator-gen.cc"
        "src/builtins/builtins-bigint.cc"
        "src/builtins/builtins-boolean-gen.cc"
        "src/builtins/builtins-boolean.cc"
        "src/builtins/builtins-call-gen.cc"
        "src/builtins/builtins-call.cc"
        "src/builtins/builtins-callsite.cc"
        "src/builtins/builtins-collections-gen.cc"
        "src/builtins/builtins-collections.cc"
        "src/builtins/builtins-console-gen.cc"
        "src/builtins/builtins-console.cc"
        "src/builtins/builtins-constructor-gen.cc"
        "src/builtins/builtins-conversion-gen.cc"
        "src/builtins/builtins-dataview.cc"
        "src/builtins/builtins-date-gen.cc"
        "src/builtins/builtins-date.cc"
        "src/builtins/builtins-debug-gen.cc"
        "src/builtins/builtins-error.cc"
        "src/builtins/builtins-function-gen.cc"
        "src/builtins/builtins-function.cc"
        "src/builtins/builtins-generator-gen.cc"
        "src/builtins/builtins-global-gen.cc"
        "src/builtins/builtins-global.cc"
        "src/builtins/builtins-handler-gen.cc"
        "src/builtins/builtins-ic-gen.cc"
        "src/builtins/builtins-internal-gen.cc"
        "src/builtins/builtins-internal.cc"
        "src/builtins/builtins-interpreter-gen.cc"
        "src/builtins/builtins-interpreter.cc"
        "src/builtins/builtins-intl-gen.cc"
        "src/builtins/builtins-intl.cc"
        "src/builtins/builtins-iterator-gen.cc"
        "src/builtins/builtins-json.cc"
        "src/builtins/builtins-lazy-gen.cc"
        "src/builtins/builtins-math-gen.cc"
        "src/builtins/builtins-math.cc"
        "src/builtins/builtins-number-gen.cc"
        "src/builtins/builtins-number.cc"
        "src/builtins/builtins-object-gen.cc"
        "src/builtins/builtins-object.cc"
        "src/builtins/builtins-promise-gen.cc"
        "src/builtins/builtins-promise.cc"
        "src/builtins/builtins-proxy-gen.cc"
        "src/builtins/builtins-reflect-gen.cc"
        "src/builtins/builtins-reflect.cc"
        "src/builtins/builtins-regexp-gen.cc"
        "src/builtins/builtins-regexp.cc"
        "src/builtins/builtins-sharedarraybuffer-gen.cc"
        "src/builtins/builtins-sharedarraybuffer.cc"
        "src/builtins/builtins-string-gen.cc"
        "src/builtins/builtins-string.cc"
        "src/builtins/builtins-symbol-gen.cc"
        "src/builtins/builtins-symbol.cc"
        "src/builtins/builtins-trace.cc"
        "src/builtins/builtins-typed-array-gen.cc"
        "src/builtins/builtins-typed-array.cc"
        "src/builtins/builtins-wasm-gen.cc"
        "src/builtins/builtins.cc"
        "src/builtins/constants-table-builder.cc"
        "src/builtins/growable-fixed-array-gen.cc"
        "src/builtins/setup-builtins-internal.cc"
        "src/cached-powers.cc"
        "src/cancelable-task.cc"
        "src/char-predicates.cc"
        "src/code-factory.cc"
        "src/code-reference.cc"
        "src/code-stub-assembler.cc"
        "src/code-stubs.cc"
        "src/codegen.cc"
        "src/compilation-cache.cc"
        "src/compilation-statistics.cc"
        "src/compiler-dispatcher/compiler-dispatcher-job.cc"
        "src/compiler-dispatcher/compiler-dispatcher-tracer.cc"
        "src/compiler-dispatcher/compiler-dispatcher.cc"
        "src/compiler-dispatcher/optimizing-compile-dispatcher.cc"
        "src/compiler-dispatcher/unoptimized-compile-job.cc"
        "src/compiler.cc"
        "src/compiler/access-builder.cc"
        "src/compiler/access-info.cc"
        "src/compiler/all-nodes.cc"
        "src/compiler/basic-block-instrumentor.cc"
        "src/compiler/branch-elimination.cc"
        "src/compiler/bytecode-analysis.cc"
        "src/compiler/bytecode-graph-builder.cc"
        "src/compiler/bytecode-liveness-map.cc"
        "src/compiler/c-linkage.cc"
        "src/compiler/checkpoint-elimination.cc"
        "src/compiler/code-assembler.cc"
        "src/compiler/code-generator.cc"
        "src/compiler/common-node-cache.cc"
        "src/compiler/common-operator-reducer.cc"
        "src/compiler/common-operator.cc"
        "src/compiler/compilation-dependencies.cc"
        "src/compiler/compiler-source-position-table.cc"
        "src/compiler/constant-folding-reducer.cc"
        "src/compiler/control-equivalence.cc"
        "src/compiler/control-flow-optimizer.cc"
        "src/compiler/dead-code-elimination.cc"
        "src/compiler/effect-control-linearizer.cc"
        "src/compiler/escape-analysis-reducer.cc"
        "src/compiler/escape-analysis.cc"
        "src/compiler/frame-elider.cc"
        "src/compiler/frame-states.cc"
        "src/compiler/frame.cc"
        "src/compiler/gap-resolver.cc"
        "src/compiler/graph-assembler.cc"
        "src/compiler/graph-reducer.cc"
        "src/compiler/graph-trimmer.cc"
        "src/compiler/graph-visualizer.cc"
        "src/compiler/graph.cc"
        "src/compiler/instruction-scheduler.cc"
        "src/compiler/instruction-selector.cc"
        "src/compiler/instruction.cc"
        "src/compiler/int64-lowering.cc"
        "src/compiler/js-call-reducer.cc"
        "src/compiler/js-context-specialization.cc"
        "src/compiler/js-create-lowering.cc"
        "src/compiler/js-generic-lowering.cc"
        "src/compiler/js-graph.cc"
        "src/compiler/js-heap-broker.cc"
        "src/compiler/js-heap-copy-reducer.cc"
        "src/compiler/js-inlining-heuristic.cc"
        "src/compiler/js-inlining.cc"
        "src/compiler/js-intrinsic-lowering.cc"
        "src/compiler/js-native-context-specialization.cc"
        "src/compiler/js-operator.cc"
        "src/compiler/js-type-hint-lowering.cc"
        "src/compiler/js-typed-lowering.cc"
        "src/compiler/jump-threading.cc"
        "src/compiler/linkage.cc"
        "src/compiler/live-range-separator.cc"
        "src/compiler/load-elimination.cc"
        "src/compiler/loop-analysis.cc"
        "src/compiler/loop-peeling.cc"
        "src/compiler/loop-variable-optimizer.cc"
        "src/compiler/machine-graph-verifier.cc"
        "src/compiler/machine-graph.cc"
        "src/compiler/machine-operator-reducer.cc"
        "src/compiler/machine-operator.cc"
        "src/compiler/memory-optimizer.cc"
        "src/compiler/move-optimizer.cc"
        "src/compiler/node-cache.cc"
        "src/compiler/node-marker.cc"
        "src/compiler/node-matchers.cc"
        "src/compiler/node-origin-table.cc"
        "src/compiler/node-properties.cc"
        "src/compiler/node.cc"
        "src/compiler/opcodes.cc"
        "src/compiler/operation-typer.cc"
        "src/compiler/operator-properties.cc"
        "src/compiler/operator.cc"
        "src/compiler/osr.cc"
        "src/compiler/pipeline-statistics.cc"
        "src/compiler/pipeline.cc"
        "src/compiler/property-access-builder.cc"
        "src/compiler/raw-machine-assembler.cc"
        "src/compiler/redundancy-elimination.cc"
        "src/compiler/register-allocator-verifier.cc"
        "src/compiler/register-allocator.cc"
        "src/compiler/representation-change.cc"
        "src/compiler/schedule.cc"
        "src/compiler/scheduler.cc"
        "src/compiler/select-lowering.cc"
        "src/compiler/simd-scalar-lowering.cc"
        "src/compiler/simplified-lowering.cc"
        "src/compiler/simplified-operator-reducer.cc"
        "src/compiler/simplified-operator.cc"
        "src/compiler/state-values-utils.cc"
        "src/compiler/store-store-elimination.cc"
        "src/compiler/type-cache.cc"
        "src/compiler/type-narrowing-reducer.cc"
        "src/compiler/typed-optimization.cc"
        "src/compiler/typer.cc"
        "src/compiler/types.cc"
        "src/compiler/value-numbering-reducer.cc"
        "src/compiler/verifier.cc"
        "src/compiler/wasm-compiler.cc"
        "src/compiler/zone-stats.cc"
        "src/contexts.cc"
        "src/conversions.cc"
        "src/counters.cc"
        "src/date.cc"
        "src/dateparser.cc"
        "src/debug/debug-coverage.cc"
        "src/debug/debug-evaluate.cc"
        "src/debug/debug-frames.cc"
        "src/debug/debug-scope-iterator.cc"
        "src/debug/debug-scopes.cc"
        "src/debug/debug-stack-trace-iterator.cc"
        "src/debug/debug-type-profile.cc"
        "src/debug/debug.cc"
        "src/debug/liveedit.cc"
        "src/deoptimize-reason.cc"
        "src/deoptimizer.cc"
        "src/disassembler.cc"
        "src/diy-fp.cc"
        "src/dtoa.cc"
        "src/eh-frame.cc"
        "src/elements-kind.cc"
        "src/elements.cc"
        "src/execution.cc"
        "src/extensions/externalize-string-extension.cc"
        "src/extensions/free-buffer-extension.cc"
        "src/extensions/gc-extension.cc"
        "src/extensions/ignition-statistics-extension.cc"
        "src/extensions/statistics-extension.cc"
        "src/extensions/trigger-failure-extension.cc"
        "src/external-reference-table.cc"
        "src/external-reference.cc"
        "src/fast-dtoa.cc"
        "src/feedback-vector.cc"
        "src/field-type.cc"
        "src/fixed-dtoa.cc"
        "src/flags.cc"
        "src/frames.cc"
        "src/futex-emulation.cc"
        "src/gdb-jit.cc"
        "src/global-handles.cc"
        "src/handler-table.cc"
        "src/handles.cc"
        "src/heap/array-buffer-collector.cc"
        "src/heap/array-buffer-tracker.cc"
        "src/heap/code-stats.cc"
        "src/heap/concurrent-marking.cc"
        "src/heap/embedder-tracing.cc"
        "src/heap/factory.cc"
        "src/heap/gc-idle-time-handler.cc"
        "src/heap/gc-tracer.cc"
        "src/heap/heap-controller.cc"
        "src/heap/heap.cc"
        "src/heap/incremental-marking-job.cc"
        "src/heap/incremental-marking.cc"
        "src/heap/invalidated-slots.cc"
        "src/heap/item-parallel-job.cc"
        "src/heap/mark-compact.cc"
        "src/heap/marking.cc"
        "src/heap/memory-reducer.cc"
        "src/heap/object-stats.cc"
        "src/heap/objects-visiting.cc"
        "src/heap/scavenge-job.cc"
        "src/heap/scavenger.cc"
        "src/heap/setup-heap-internal.cc"
        "src/heap/spaces.cc"
        "src/heap/store-buffer.cc"
        "src/heap/stress-marking-observer.cc"
        "src/heap/stress-scavenge-observer.cc"
        "src/heap/sweeper.cc"
        "src/ic/accessor-assembler.cc"
        "src/ic/binary-op-assembler.cc"
        "src/ic/call-optimization.cc"
        "src/ic/handler-configuration.cc"
        "src/ic/ic-stats.cc"
        "src/ic/ic.cc"
        "src/ic/keyed-store-generic.cc"
        "src/ic/stub-cache.cc"
        "src/icu_util.cc"
        "src/identity-map.cc"
        "src/instruction-stream.cc"
        "src/interface-descriptors.cc"
        "src/interpreter/bytecode-array-accessor.cc"
        "src/interpreter/bytecode-array-builder.cc"
        "src/interpreter/bytecode-array-iterator.cc"
        "src/interpreter/bytecode-array-random-iterator.cc"
        "src/interpreter/bytecode-array-writer.cc"
        "src/interpreter/bytecode-decoder.cc"
        "src/interpreter/bytecode-flags.cc"
        "src/interpreter/bytecode-generator.cc"
        "src/interpreter/bytecode-label.cc"
        "src/interpreter/bytecode-node.cc"
        "src/interpreter/bytecode-operands.cc"
        "src/interpreter/bytecode-register-optimizer.cc"
        "src/interpreter/bytecode-register.cc"
        "src/interpreter/bytecode-source-info.cc"
        "src/interpreter/bytecodes.cc"
        "src/interpreter/constant-array-builder.cc"
        "src/interpreter/control-flow-builders.cc"
        "src/interpreter/handler-table-builder.cc"
        "src/interpreter/interpreter-assembler.cc"
        "src/interpreter/interpreter-generator.cc"
        "src/interpreter/interpreter-intrinsics-generator.cc"
        "src/interpreter/interpreter-intrinsics.cc"
        "src/interpreter/interpreter.cc"
        "src/interpreter/setup-interpreter-internal.cc"
        "src/intl.cc"
        "src/isolate.cc"
        "src/json-parser.cc"
        "src/json-stringifier.cc"
        "src/keys.cc"
        "src/layout-descriptor.cc"
        "src/log-utils.cc"
        "src/log.cc"
        "src/lookup-cache.cc"
        "src/lookup.cc"
        "src/machine-type.cc"
        "src/map-updater.cc"
        "src/messages.cc"
        "src/objects-debug.cc"
        "src/objects-printer.cc"
        "src/objects.cc"
        "src/objects/bigint.cc"
        "src/objects/debug-objects.cc"
        "src/objects/intl-objects.cc"
        "src/objects/js-array-buffer.cc"
        "src/objects/js-collator.cc"
        "src/objects/js-list-format.cc"
        "src/objects/js-locale.cc"
        "src/objects/js-plural-rules.cc"
        "src/objects/js-relative-time-format.cc"
        "src/objects/literal-objects.cc"
        "src/objects/managed.cc"
        "src/objects/module.cc"
        "src/objects/ordered-hash-table.cc"
        "src/objects/scope-info.cc"
        "src/objects/template-objects.cc"
        "src/optimized-compilation-info.cc"
        "src/ostreams.cc"
        "src/parsing/expression-scope-reparenter.cc"
        "src/parsing/func-name-inferrer.cc"
        "src/parsing/parse-info.cc"
        "src/parsing/parser.cc"
        "src/parsing/parsing.cc"
        "src/parsing/pattern-rewriter.cc"
        "src/parsing/preparsed-scope-data.cc"
        "src/parsing/preparser.cc"
        "src/parsing/rewriter.cc"
        "src/parsing/scanner-character-streams.cc"
        "src/parsing/scanner.cc"
        "src/parsing/token.cc"
        "src/pending-compilation-error-handler.cc"
        "src/perf-jit.cc"
        "src/profiler/allocation-tracker.cc"
        "src/profiler/cpu-profiler.cc"
        "src/profiler/heap-profiler.cc"
        "src/profiler/heap-snapshot-generator.cc"
        "src/profiler/profile-generator.cc"
        "src/profiler/profiler-listener.cc"
        "src/profiler/sampling-heap-profiler.cc"
        "src/profiler/strings-storage.cc"
        "src/profiler/tick-sample.cc"
        "src/profiler/tracing-cpu-profiler.cc"
        "src/property-descriptor.cc"
        "src/property.cc"
        "src/regexp/interpreter-irregexp.cc"
        "src/regexp/jsregexp.cc"
        "src/regexp/regexp-ast.cc"
        "src/regexp/regexp-macro-assembler-irregexp.cc"
        "src/regexp/regexp-macro-assembler-tracer.cc"
        "src/regexp/regexp-macro-assembler.cc"
        "src/regexp/regexp-parser.cc"
        "src/regexp/regexp-stack.cc"
        "src/regexp/regexp-utils.cc"
        "src/register-configuration.cc"
        "src/reloc-info.cc"
        "src/runtime-profiler.cc"
        "src/runtime/runtime-array.cc"
        "src/runtime/runtime-atomics.cc"
        "src/runtime/runtime-bigint.cc"
        "src/runtime/runtime-classes.cc"
        "src/runtime/runtime-collections.cc"
        "src/runtime/runtime-compiler.cc"
        "src/runtime/runtime-date.cc"
        "src/runtime/runtime-debug.cc"
        "src/runtime/runtime-forin.cc"
        "src/runtime/runtime-function.cc"
        "src/runtime/runtime-futex.cc"
        "src/runtime/runtime-generator.cc"
        "src/runtime/runtime-internal.cc"
        "src/runtime/runtime-interpreter.cc"
        "src/runtime/runtime-intl.cc"
        "src/runtime/runtime-literals.cc"
        "src/runtime/runtime-maths.cc"
        "src/runtime/runtime-module.cc"
        "src/runtime/runtime-numbers.cc"
        "src/runtime/runtime-object.cc"
        "src/runtime/runtime-operators.cc"
        "src/runtime/runtime-promise.cc"
        "src/runtime/runtime-proxy.cc"
        "src/runtime/runtime-regexp.cc"
        "src/runtime/runtime-scopes.cc"
        "src/runtime/runtime-strings.cc"
        "src/runtime/runtime-symbol.cc"
        "src/runtime/runtime-test.cc"
        "src/runtime/runtime-typedarray.cc"
        "src/runtime/runtime-wasm.cc"
        "src/runtime/runtime.cc"
        "src/safepoint-table.cc"
        "src/setup-isolate-full.cc"
        "src/simulator-base.cc"
        "src/snapshot/builtin-deserializer-allocator.cc"
        "src/snapshot/builtin-deserializer.cc"
        "src/snapshot/builtin-serializer-allocator.cc"
        "src/snapshot/builtin-serializer.cc"
        "src/snapshot/builtin-snapshot-utils.cc"
        "src/snapshot/code-serializer.cc"
        "src/snapshot/default-deserializer-allocator.cc"
        "src/snapshot/default-serializer-allocator.cc"
        "src/snapshot/deserializer.cc"
        "src/snapshot/natives-common.cc"
        "src/snapshot/object-deserializer.cc"
        "src/snapshot/partial-deserializer.cc"
        "src/snapshot/partial-serializer.cc"
        "src/snapshot/serializer-common.cc"
        "src/snapshot/serializer.cc"
        "src/snapshot/snapshot-common.cc"
        "src/snapshot/snapshot-source-sink.cc"
        "src/snapshot/startup-deserializer.cc"
        "src/snapshot/startup-serializer.cc"
        "src/source-position-table.cc"
        "src/source-position.cc"
        "src/startup-data-util.cc"
        "src/string-builder.cc"
        "src/string-case.cc"
        "src/string-stream.cc"
        "src/strtod.cc"
        "src/tracing/trace-event.cc"
        "src/tracing/traced-value.cc"
        "src/tracing/tracing-category-observer.cc"
        "src/transitions.cc"
        "src/trap-handler/handler-inside.cc"
        "src/trap-handler/handler-outside.cc"
        "src/trap-handler/handler-shared.cc"
        "src/turbo-assembler.cc"
        "src/type-hints.cc"
        "src/unicode-decoder.cc"
        "src/unicode.cc"
        "src/unoptimized-compilation-info.cc"
        "src/uri.cc"
        "src/utils.cc"
        "src/v8.cc"
        "src/v8threads.cc"
        "src/value-serializer.cc"
        "src/vector-slot-pair.cc"
        "src/version.cc"
        "src/visitors.cc"
        "src/wasm/baseline/liftoff-assembler.cc"
        "src/wasm/baseline/liftoff-compiler.cc"
        "src/wasm/function-body-decoder.cc"
        "src/wasm/function-compiler.cc"
        "src/wasm/jump-table-assembler.cc"
        "src/wasm/local-decl-encoder.cc"
        "src/wasm/memory-tracing.cc"
        "src/wasm/module-compiler.cc"
        "src/wasm/module-decoder.cc"
        "src/wasm/signature-map.cc"
        "src/wasm/streaming-decoder.cc"
        "src/wasm/wasm-code-manager.cc"
        "src/wasm/wasm-debug.cc"
        "src/wasm/wasm-engine.cc"
        "src/wasm/wasm-external-refs.cc"
        "src/wasm/wasm-features.cc"
        "src/wasm/wasm-interpreter.cc"
        "src/wasm/wasm-js.cc"
        "src/wasm/wasm-memory.cc"
        "src/wasm/wasm-module-builder.cc"
        "src/wasm/wasm-module.cc"
        "src/wasm/wasm-objects.cc"
        "src/wasm/wasm-opcodes.cc"
        "src/wasm/wasm-result.cc"
        "src/wasm/wasm-serialization.cc"
        "src/wasm/wasm-text.cc"
        "src/zone/accounting-allocator.cc"
        "src/zone/zone-segment.cc"
        "src/zone/zone.cc"
    ];
    arch = {
        arm = {
            srcs = [
                "src/arm/assembler-arm.cc"
                "src/arm/code-stubs-arm.cc"
                "src/arm/codegen-arm.cc"
                "src/arm/constants-arm.cc"
                "src/arm/cpu-arm.cc"
                "src/arm/deoptimizer-arm.cc"
                "src/arm/disasm-arm.cc"
                "src/arm/eh-frame-arm.cc"
                "src/arm/frame-constants-arm.cc"
                "src/arm/interface-descriptors-arm.cc"
                "src/arm/macro-assembler-arm.cc"
                "src/arm/simulator-arm.cc"
                "src/builtins/arm/builtins-arm.cc"
                "src/compiler/arm/code-generator-arm.cc"
                "src/compiler/arm/instruction-scheduler-arm.cc"
                "src/compiler/arm/instruction-selector-arm.cc"
                "src/compiler/arm/unwinding-info-writer-arm.cc"
                "src/debug/arm/debug-arm.cc"
                "src/regexp/arm/regexp-macro-assembler-arm.cc"
            ];
        };
        arm64 = {
            srcs = [
                "src/arm64/assembler-arm64.cc"
                "src/arm64/code-stubs-arm64.cc"
                "src/arm64/codegen-arm64.cc"
                "src/arm64/cpu-arm64.cc"
                "src/arm64/decoder-arm64.cc"
                "src/arm64/deoptimizer-arm64.cc"
                "src/arm64/disasm-arm64.cc"
                "src/arm64/eh-frame-arm64.cc"
                "src/arm64/frame-constants-arm64.cc"
                "src/arm64/instructions-arm64-constants.cc"
                "src/arm64/instructions-arm64.cc"
                "src/arm64/instrument-arm64.cc"
                "src/arm64/interface-descriptors-arm64.cc"
                "src/arm64/macro-assembler-arm64.cc"
                "src/arm64/simulator-arm64.cc"
                "src/arm64/simulator-logic-arm64.cc"
                "src/arm64/utils-arm64.cc"
                "src/builtins/arm64/builtins-arm64.cc"
                "src/compiler/arm64/code-generator-arm64.cc"
                "src/compiler/arm64/instruction-scheduler-arm64.cc"
                "src/compiler/arm64/instruction-selector-arm64.cc"
                "src/compiler/arm64/unwinding-info-writer-arm64.cc"
                "src/debug/arm64/debug-arm64.cc"
                "src/regexp/arm64/regexp-macro-assembler-arm64.cc"
            ];
        };
        mips = {
            srcs = [
                "src/builtins/mips/builtins-mips.cc"
                "src/compiler/mips/code-generator-mips.cc"
                "src/compiler/mips/instruction-scheduler-mips.cc"
                "src/compiler/mips/instruction-selector-mips.cc"
                "src/debug/mips/debug-mips.cc"
                "src/mips/assembler-mips.cc"
                "src/mips/code-stubs-mips.cc"
                "src/mips/codegen-mips.cc"
                "src/mips/constants-mips.cc"
                "src/mips/cpu-mips.cc"
                "src/mips/deoptimizer-mips.cc"
                "src/mips/disasm-mips.cc"
                "src/mips/frame-constants-mips.cc"
                "src/mips/interface-descriptors-mips.cc"
                "src/mips/macro-assembler-mips.cc"
                "src/mips/simulator-mips.cc"
                "src/regexp/mips/regexp-macro-assembler-mips.cc"
            ];
        };
        mips64 = {
            srcs = [
                "src/builtins/mips64/builtins-mips64.cc"
                "src/compiler/mips64/code-generator-mips64.cc"
                "src/compiler/mips64/instruction-scheduler-mips64.cc"
                "src/compiler/mips64/instruction-selector-mips64.cc"
                "src/debug/mips64/debug-mips64.cc"
                "src/mips64/assembler-mips64.cc"
                "src/mips64/code-stubs-mips64.cc"
                "src/mips64/codegen-mips64.cc"
                "src/mips64/constants-mips64.cc"
                "src/mips64/cpu-mips64.cc"
                "src/mips64/deoptimizer-mips64.cc"
                "src/mips64/disasm-mips64.cc"
                "src/mips64/frame-constants-mips64.cc"
                "src/mips64/interface-descriptors-mips64.cc"
                "src/mips64/macro-assembler-mips64.cc"
                "src/mips64/simulator-mips64.cc"
                "src/regexp/mips64/regexp-macro-assembler-mips64.cc"
            ];
        };
        x86 = {
            srcs = [
                "src/builtins/ia32/builtins-ia32.cc"
                "src/compiler/ia32/code-generator-ia32.cc"
                "src/compiler/ia32/instruction-scheduler-ia32.cc"
                "src/compiler/ia32/instruction-selector-ia32.cc"
                "src/debug/ia32/debug-ia32.cc"
                "src/ia32/assembler-ia32.cc"
                "src/ia32/code-stubs-ia32.cc"
                "src/ia32/codegen-ia32.cc"
                "src/ia32/cpu-ia32.cc"
                "src/ia32/deoptimizer-ia32.cc"
                "src/ia32/disasm-ia32.cc"
                "src/ia32/frame-constants-ia32.cc"
                "src/ia32/interface-descriptors-ia32.cc"
                "src/ia32/macro-assembler-ia32.cc"
                "src/ia32/simulator-ia32.cc"
                "src/regexp/ia32/regexp-macro-assembler-ia32.cc"
            ];
        };
        x86_64 = {
            srcs = [
                "src/builtins/x64/builtins-x64.cc"
                "src/compiler/x64/code-generator-x64.cc"
                "src/compiler/x64/instruction-scheduler-x64.cc"
                "src/compiler/x64/instruction-selector-x64.cc"
                "src/compiler/x64/unwinding-info-writer-x64.cc"
                "src/debug/x64/debug-x64.cc"
                "src/regexp/x64/regexp-macro-assembler-x64.cc"
                "src/x64/assembler-x64.cc"
                "src/x64/code-stubs-x64.cc"
                "src/x64/codegen-x64.cc"
                "src/x64/cpu-x64.cc"
                "src/x64/deoptimizer-x64.cc"
                "src/x64/disasm-x64.cc"
                "src/x64/eh-frame-x64.cc"
                "src/x64/frame-constants-x64.cc"
                "src/x64/interface-descriptors-x64.cc"
                "src/x64/macro-assembler-x64.cc"
                "src/x64/simulator-x64.cc"
            ];
        };
    };
    target = {
        android = {
            cflags = ["-DANDROID_LINK_SHARED_ICU4C"];
        };
    };
    local_include_dirs = ["src"];
    header_libs = [
        "libicuuc_headers"
        "libicui18n_headers"
    ];
    generated_headers = ["v8_torque_file"];
    generated_sources = ["v8_torque_file_cc"];
    sanitize = {
        cfi = true;
        blacklist = "./tools/cfi/blacklist.txt";
    };

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

in { inherit libv8src; }
