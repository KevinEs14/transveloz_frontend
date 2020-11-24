
class UserHistory{
  String _driverFirstName;
  String _startStreet;
  String _startZone;
  String _deliveryStreet;
  String _deliveryZone;
  String _dateDelivery;
  String _driverPhone;
  String _travelStatus;

  UserHistory(this._driverFirstName, this._startStreet, this._startZone, this._deliveryStreet, this._deliveryZone, this._dateDelivery, this._driverPhone, this._travelStatus);


  String get driverFirstName => _driverFirstName;

  set driverFirstName(String value) {
    _driverFirstName = value;
  }

  String get startStreet => _startStreet;

  set startStreet(String value) {
    _startStreet = value;
  }

  String get startZone => _startZone;

  set startZone(String value) {
    _startZone = value;
  }

  String get deliveryStreet => _deliveryStreet;

  set deliveryStreet(String value) {
    _deliveryStreet = value;
  }

  String get deliveryZone => _deliveryZone;

  set deliveryZone(String value) {
    _deliveryZone = value;
  }

  String get dateDelivery => _dateDelivery;

  set dateDelivery(String value) {
    _dateDelivery = value;
  }

  String get driverPhone => _driverPhone;

  set driverPhone(String value) {
    _driverPhone = value;
  }

  String get travelStatus => _travelStatus;

  set travelStatus(String value) {
    _travelStatus = value;
  }

  UserHistory.fromJson(Map<String, dynamic> json){
    driverFirstName = json['driverFirstName'];
    startStreet = json['startStreet'];
    startZone = json['startZone'];
    deliveryStreet = json['deliveryStreet'];
    deliveryZone = json['deliveryZone'];
    dateDelivery = json['dateDelivery'];
    driverPhone = json['driverPhone'];
     travelStatus = json['travelStatus'];
  }
}