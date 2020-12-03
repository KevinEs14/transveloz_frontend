
class UserHistoryPayment{
  String _driverFirstName;
  String _driverFirstSurname;
  String _driverSecondSurname;
  String _datePayment;
  String _paymentStatus;
  double _amount;
  String _startStreet;
  String _startZone;
  String _startCity;
  String _startCountry;
  String _deliveryStreet;
  String _deliveryZone;
  String _deliveryCity;
  String _deliveryCountry;
  String _driverPicture;

  UserHistoryPayment(this._driverFirstName,this._driverFirstSurname,this._driverSecondSurname,this._datePayment,this._paymentStatus,this._amount,this._startStreet,this._startZone,this._startCity,this._startCountry,this._deliveryStreet,this._deliveryZone,this._deliveryCity,this._deliveryCountry,this._driverPicture);

  String get driverFirstName => _driverFirstName;

  set driverFirstName(String value) {
    _driverFirstName = value;
  }

  String get driverFirstSurname => _driverFirstSurname;

  set driverFirstSurname(String value) {
    _driverFirstSurname = value;
  }

  String get driverSecondSurname => _driverSecondSurname;

  set driverSecondSurname(String value) {
    _driverSecondSurname = value;
  }

  String get datePayment => _datePayment;

  set datePayment(String value) {
    _datePayment = value;
  }

  String get paymentStatus => _paymentStatus;

  set paymentStatus(String value) {
    _paymentStatus = value;
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  String get startStreet => _startStreet;

  set startStreet(String value) {
    _startStreet = value;
  }

  String get startZone => _startZone;

  set startZone(String value) {
    _startZone = value;
  }

  String get startCity => _startCity;

  set startCity(String value) {
    _startCity = value;
  }

  String get startCountry => _startCountry;

  set startCountry(String value) {
    _startCountry = value;
  }

  String get deliveryStreet => _deliveryStreet;

  set deliveryStreet(String value) {
    _deliveryStreet = value;
  }

  String get deliveryZone => _deliveryZone;

  set deliveryZone(String value) {
    _deliveryZone = value;
  }

  String get deliveryCity => _deliveryCity;

  set deliveryCity(String value) {
    _deliveryCity = value;
  }

  String get deliveryCountry => _deliveryCountry;

  set deliveryCountry(String value) {
    _deliveryCountry = value;
  }

  String get driverPicture => _driverPicture;

  set driverPicture(String value) {
    _driverPicture = value;
  }


  UserHistoryPayment.fromJson(Map<String, dynamic> json){
    driverFirstName = json['driverFirstName'];
    driverFirstSurname = json['driverFirstSurname'];
    driverSecondSurname = json['driverSecondSurname'];
    datePayment = json['datePayment'];
    paymentStatus = json['paymentStatus'];
    amount = json['amount'];
    startStreet = json['startStreet'];
    startZone = json['startZone'];
    startCity = json['startCity'];
    startCountry = json['startCountry'];
    deliveryStreet = json['deliveryStreet'];
    deliveryZone = json['deliveryZone'];
    deliveryCity = json['deliveryCity'];
    deliveryCountry = json['deliveryCountry'];
    driverPicture = json['driverPicture'];
  }

}