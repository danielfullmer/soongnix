{ filegroup }:
let

BluetoothNeighborSources = filegroup {
    name = "BluetoothNeighborSources";
    srcs = [
        "connectability.cc"
        "discoverability.cc"
        "inquiry.cc"
        "name.cc"
        "name_db.cc"
        "page.cc"
        "scan.cc"
    ];
};

BluetoothNeighborTestSources = filegroup {
    name = "BluetoothNeighborTestSources";
    srcs = [
        "inquiry_test.cc"
    ];
};

BluetoothFacade_neighbor = filegroup {
    name = "BluetoothFacade_neighbor";
    srcs = [
        "facade/facade.cc"
    ];
};

in { inherit BluetoothFacade_neighbor BluetoothNeighborSources BluetoothNeighborTestSources; }
