import 'dart:ffi';

import 'package:intl/intl.dart';

class SingleDriver{
  int _vehicleId;
  SingleDriver();
  int get vehicleId => _vehicleId;

  set vehicleId(int value) {
    _vehicleId = value;
  }

  String _personFirstName;

  String get personFirstName => _personFirstName;

  set personFirstName(String value) {
    _personFirstName = value;
  }

  String _personFirstSurname;
  String _vehicleLicensePlate;
  double _vehicleCapacity;
  String _vehicleType;
  double _vehiclePrice;
  String _vehicleStatus;
  String _vehicleBrand;
  String _vehicleModel;


  // SingleDriver(this.personFirstSurname,this.personFirstName,this.vehicleLicensePlate,this.vehicleCapacity,this.vehicleType,this.vehiclePrice,this.vehicleStatus,this.vehicleBrand,this.vehicleModel);
  SingleDriver.fromJson(Map<String,dynamic> json){
    personFirstName=json["personFirstName"];
    personFirstSurname=json["personFirstSurname"];
    vehicleLicensePlate=json["vehicleLicensePlate"];
    vehicleCapacity=json["vehicleCapacity"];
    vehicleType=json["vehicleType"];
    vehiclePrice=json["vehiclePrice"];
    vehicleStatus=json["vehicleStatus"];
    vehicleBrand=json["vehicleBrand"];
    vehicleModel=json["vehicleModel"];

  }

  String get personFirstSurname => _personFirstSurname;

  set personFirstSurname(String value) {
    _personFirstSurname = value;
  }

  String get vehicleLicensePlate => _vehicleLicensePlate;

  set vehicleLicensePlate(String value) {
    _vehicleLicensePlate = value;
  }

  double get vehicleCapacity => _vehicleCapacity;

  set vehicleCapacity(double value) {
    _vehicleCapacity = value;
  }

  String get vehicleType => _vehicleType;

  set vehicleType(String value) {
    _vehicleType = value;
  }

  double get vehiclePrice => _vehiclePrice;

  set vehiclePrice(double value) {
    _vehiclePrice = value;
  }

  String get vehicleStatus => _vehicleStatus;

  set vehicleStatus(String value) {
    _vehicleStatus = value;
  }

  String get vehicleBrand => _vehicleBrand;

  set vehicleBrand(String value) {
    _vehicleBrand = value;
  }

  String get vehicleModel => _vehicleModel;

  set vehicleModel(String value) {
    _vehicleModel = value;
  }
}