class TravelByDriver{
  int _userId;
  String _userFirstName;
  String _userFirsSurname;
  String _travelDateDelivery;
  String _userPhone;
  String _travelStatus;
  int _startAddressId;
  int _deliveryAddressId;

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  String get userFirstName => _userFirstName;

  int get deliveryAddressId => _deliveryAddressId;

  set deliveryAddressId(int value) {
    _deliveryAddressId = value;
  }

  int get startAddressId => _startAddressId;

  set startAddressId(int value) {
    _startAddressId = value;
  }

  String get travelStatus => _travelStatus;

  set travelStatus(String value) {
    _travelStatus = value;
  }

  String get userPhone => _userPhone;

  set userPhone(String value) {
    _userPhone = value;
  }

  String get travelDateDelivery => _travelDateDelivery;

  set travelDateDelivery(String value) {
    _travelDateDelivery = value;
  }

  String get userFirsSurname => _userFirsSurname;

  set userFirsSurname(String value) {
    _userFirsSurname = value;
  }

  set userFirstName(String value) {
    _userFirstName = value;
  }

  TravelByDriver.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    userFirstName = json['userFirstName'];
    userFirsSurname = json['userFirsSurname'];
    travelDateDelivery = json['travelDateDelivery'];
    userPhone=json['userPhone'];
    travelStatus = json['travelStatus'];
    startAddressId = json['startAddressId'];
    deliveryAddressId = json['deliveryAddressId'];

  }

}