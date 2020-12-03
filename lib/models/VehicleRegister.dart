class VehicleRegister{
  int _vehicleDriverId;
  String _vehicleLicensePlate;
  double _vehicleCapacity;
  String _vehicleType;
  double _vehiclePrice;
  String _vehicleBrand;
  String _vehicleModel;

  VehicleRegister();

  String get vehicleModel => _vehicleModel;

  set vehicleModel(String value) {
    _vehicleModel = value;
  }

  String get vehicleBrand => _vehicleBrand;

  set vehicleBrand(String value) {
    _vehicleBrand = value;
  }

  double get vehiclePrice => _vehiclePrice;

  set vehiclePrice(double value) {
    _vehiclePrice = value;
  }

  String get vehicleType => _vehicleType;

  set vehicleType(String value) {
    _vehicleType = value;
  }

  double get vehicleCapacity => _vehicleCapacity;

  set vehicleCapacity(double value) {
    _vehicleCapacity = value;
  }

  String get vehicleLicensePlate => _vehicleLicensePlate;

  set vehicleLicensePlate(String value) {
    _vehicleLicensePlate = value;
  }

  int get vehicleDriverId => _vehicleDriverId;

  set vehicleDriverId(int value) {
    _vehicleDriverId = value;
  }
  Map toJson() => {
    "vehicleDriverId": vehicleDriverId,
    "vehicleLicensePlate": vehicleLicensePlate,
    "vehicleCapacity": vehicleCapacity,
    "vehicleType": vehicleType,
    "vehiclePrice": vehiclePrice,
    "vehicleBrand": vehicleBrand,
    "vehicleModel": vehicleModel
  };


}