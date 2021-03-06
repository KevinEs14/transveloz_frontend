class DriverContact{
  int _driverId;
  String _firstName;
  String _firstSurname;
  String _secondSurname;
  String _companyName;
  String _ci;
  String _pathImage;

  DriverContact();

  String get ci => _ci;

  set ci(String value) {
    _ci = value;
  }

  String get companyName => _companyName;

  set companyName(String value) {
    _companyName = value;
  }

  String get secondSurname => _secondSurname;

  set secondSurname(String value) {
    _secondSurname = value;
  }

  String get firstSurname => _firstSurname;

  set firstSurname(String value) {
    _firstSurname = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  int get driverId => _driverId;

  set driverId(int value) {
    _driverId = value;
  }

  String get pathImage => _pathImage;

  set pathImage(String value) {
    _pathImage = value;
  }
  DriverContact.fromJson(Map<String, dynamic> json){
    driverId = json['driverId'];
    firstName = json['firstName'];
    firstSurname = json['firstSurname'];
    secondSurname = json['secondSurname'];
    companyName=json['companyName'];
    ci = json['ci'];
    pathImage = json['pathImage'];

  }
  

}