{ filegroup }:
let

BluetoothL2capSources = filegroup {
    name = "BluetoothL2capSources";
    srcs = [
        "fcs.cc"
        "classic/dynamic_channel_manager.cc"
        "classic/dynamic_channel_service.cc"
        "classic/fixed_channel.cc"
        "classic/fixed_channel_manager.cc"
        "classic/fixed_channel_service.cc"
        "classic/internal/dynamic_channel_service_manager_impl.cc"
        "classic/internal/fixed_channel_impl.cc"
        "classic/internal/fixed_channel_service_manager_impl.cc"
        "classic/internal/link.cc"
        "classic/internal/link_manager.cc"
        "classic/internal/signalling_manager.cc"
        "classic/l2cap_classic_module.cc"
        "dynamic_channel.cc"
        "internal/basic_mode_channel_data_controller.cc"
        "internal/data_pipeline_manager.cc"
        "internal/dynamic_channel_allocator.cc"
        "internal/dynamic_channel_impl.cc"
        "internal/enhanced_retransmission_mode_channel_data_controller.cc"
        "internal/le_credit_based_channel_data_controller.cc"
        "internal/receiver.cc"
        "internal/scheduler_fifo.cc"
        "internal/sender.cc"
        "le/dynamic_channel_manager.cc"
        "le/dynamic_channel_service.cc"
        "le/fixed_channel.cc"
        "le/fixed_channel_manager.cc"
        "le/fixed_channel_service.cc"
        "le/internal/dynamic_channel_service_manager_impl.cc"
        "le/internal/fixed_channel_impl.cc"
        "le/internal/fixed_channel_service_manager_impl.cc"
        "le/internal/link.cc"
        "le/internal/link_manager.cc"
        "le/internal/signalling_manager.cc"
        "le/l2cap_le_module.cc"
    ];
};

BluetoothL2capTestSources = filegroup {
    name = "BluetoothL2capTestSources";
    srcs = [
        "classic/internal/dynamic_channel_service_manager_test.cc"
        "classic/internal/fixed_channel_impl_test.cc"
        "classic/internal/fixed_channel_service_manager_test.cc"
        "classic/internal/link_test.cc"
        "classic/internal/link_manager_test.cc"
        "classic/internal/signalling_manager_test.cc"
        "internal/basic_mode_channel_data_controller_test.cc"
        "internal/dynamic_channel_allocator_test.cc"
        "internal/dynamic_channel_impl_test.cc"
        "internal/enhanced_retransmission_mode_channel_data_controller_test.cc"
        "internal/fixed_channel_allocator_test.cc"
        "internal/le_credit_based_channel_data_controller_test.cc"
        "internal/receiver_test.cc"
        "internal/scheduler_fifo_test.cc"
        "internal/sender_test.cc"
        "l2cap_packet_test.cc"
        "le/internal/dynamic_channel_service_manager_test.cc"
        "le/internal/fixed_channel_impl_test.cc"
        "le/internal/fixed_channel_service_manager_test.cc"
        "le/internal/link_manager_test.cc"
        "signal_id_test.cc"
    ];
};

BluetoothFacade_l2cap_layer = filegroup {
    name = "BluetoothFacade_l2cap_layer";
    srcs = [
        "classic/facade.cc"
    ];
};

BluetoothL2capFuzzTestSources = filegroup {
    name = "BluetoothL2capFuzzTestSources";
    srcs = [
        "internal/dynamic_channel_allocator_fuzz_test.cc"
        "l2cap_packet_fuzz_test.cc"
    ];
};

in { inherit BluetoothFacade_l2cap_layer BluetoothL2capFuzzTestSources BluetoothL2capSources BluetoothL2capTestSources; }