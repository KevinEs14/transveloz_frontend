
class VehicleModel{
  int _vehicleId;
  String _vehicleType;
  String _vehicleBrand;
  String _vehicleModel;
  String _personFirstName;
  String _personFirstSurname;
  double _vehicleCapacity;
  String _vehicleCompany;
  double _vehiclePrice;
  VehicleModel();
  double get vehiclePrice => _vehiclePrice;

  set vehiclePrice(double value) {
    _vehiclePrice = value;
  }

  String get vehicleCompany => _vehicleCompany;

  set vehicleCompany(String value) {
    _vehicleCompany = value;
  }

  double get vehicleCapacity => _vehicleCapacity;

  set vehicleCapacity(double value) {
    _vehicleCapacity = value;
  }

  String get personFirstSurname => _personFirstSurname;

  set personFirstSurname(String value) {
    _personFirstSurname = value;
  }

  String get personFirstName => _personFirstName;

  set personFirstName(String value) {
    _personFirstName = value;
  }

  String get vehicleModel => _vehicleModel;

  set vehicleModel(String value) {
    _vehicleModel = value;
  }

  String get vehicleBrand => _vehicleBrand;

  set vehicleBrand(String value) {
    _vehicleBrand = value;
  }

  String get vehicleType => _vehicleType;

  set vehicleType(String value) {
    _vehicleType = value;
  }

  int get vehicleId => _vehicleId;

  set vehicleId(int value) {
    _vehicleId = value;
  }
  VehicleModel.fromJson(Map<String,dynamic> json){
    _vehicleId = json['vehicleId'];
    _vehicleType =json['vehicleType'] ;
    _vehicleBrand =json ['vehicleBrand'];
    _vehicleModel =json ['vehicleModel'];;
    _personFirstName  =json ['personFirstName'];
    _personFirstSurname  =json ['personFirstSurname'];
    _vehicleCapacity =json ['vehicleCapacity'];
    _vehicleCompany =json ['vehicleCompany'];
    _vehiclePrice =json ['vehiclePrice'];
  }


}