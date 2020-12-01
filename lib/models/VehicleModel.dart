class VehicleModel{
  int _vehicleId;
  String _vehicleType;
  String _vehicleBrand;
  String _vehicleModel;
  String _vehiclePicture;
  String _personFirstName;
  String _personFirstSurname;
  double _vehicleCapacity;
  String _vehicleCompany;
  double _vehiclePrice;


  int get vehicleId => _vehicleId;

  set vehicleId(int value) {
    _vehicleId = value;
  }

  String get vehicleType => _vehicleType;

  set vehicleType(String value) {
    _vehicleType = value;
  }

  String get vehicleBrand => _vehicleBrand;

  set vehicleBrand(String value) {
    _vehicleBrand = value;
  }

  String get vehicleModel => _vehicleModel;

  set vehicleModel(String value) {
    _vehicleModel = value;
  }

  String get vehiclePicture => _vehiclePicture;

  set vehiclePicture(String value) {
    _vehiclePicture = value;
  }

  String get personFirstName => _personFirstName;

  set personFirstName(String value) {
    _personFirstName = value;
  }

  String get personFirstSurname => _personFirstSurname;

  set personFirstSurname(String value) {
    _personFirstSurname = value;
  }

  double get vehicleCapacity => _vehicleCapacity;

  set vehicleCapacity(double value) {
    _vehicleCapacity = value;
  }

  String get vehicleCompany => _vehicleCompany;

  set vehicleCompany(String value) {
    if(value==null){
      value="No Tiene";
    }
    _vehicleCompany = value;
  }

  double get vehiclePrice => _vehiclePrice;

  set vehiclePrice(double value) {
    _vehiclePrice = value;
  }

  VehicleModel.fromJson(Map<String, dynamic> json){
    vehicleId = json['vehicleId'];
    vehicleType = json['vehicleType'];
    vehicleBrand = json['vehicleBrand'];
    vehicleModel = json['vehicleModel'];
    vehiclePicture=json['vehiclePicture'];
    personFirstName = json['personFirstName'];
    personFirstSurname = json['personFirstSurname'];
    vehicleCapacity = json['vehicleCapacity'];
    vehicleCompany = json['vehicleCompany'];
    vehiclePrice = json['vehiclePrice'];

  }

}