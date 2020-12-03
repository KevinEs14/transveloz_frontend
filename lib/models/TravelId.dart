
// import 'dart:core';

import 'package:flutter/material.dart';

class TravelId{
  int _travelId;
  int _travelUserId;

  int get travelId => _travelId;

  set travelId(int value) {
    _travelId = value;
  }

  int _travelDriverId;
  String _travelStatus;
  String _travelDateDelivery;
  String _startAddressNumber;
  String _startAddressStreet;
  String _startAddressZone;
  String _startAddressCity;
  String _startAddressCountry;
  String _deliveryAddressNumber;
  String _deliveryAddressStreet;
  String _deliveryAddressZone;
  String _deliveryAddressCity;
  String _deliveryAddressCountry;

  int get travelUserId => _travelUserId;

  set travelUserId(int value) {
    _travelUserId = value;
  }

  int get travelDriverId => _travelDriverId;

  set travelDriverId(int value) {
    _travelDriverId = value;
  }

  String get travelStatus => _travelStatus;

  set travelStatus(String value) {
    _travelStatus = value;
  }

  String get travelDateDelivery => _travelDateDelivery;

  set travelDateDelivery(String value) {
    _travelDateDelivery = value;
  }

  String get startAddressNumber => _startAddressNumber;

  set startAddressNumber(String value) {
    _startAddressNumber = value;
  }

  String get startAddressStreet => _startAddressStreet;

  set startAddressStreet(String value) {
    _startAddressStreet = value;
  }

  String get startAddressZone => _startAddressZone;

  set startAddressZone(String value) {
    _startAddressZone = value;
  }

  String get startAddressCity => _startAddressCity;

  set startAddressCity(String value) {
    _startAddressCity = value;
  }

  String get startAddressCountry => _startAddressCountry;

  set startAddressCountry(String value) {
    _startAddressCountry = value;
  }

  String get deliveryAddressNumber => _deliveryAddressNumber;

  set deliveryAddressNumber(String value) {
    _deliveryAddressNumber = value;
  }

  String get deliveryAddressStreet => _deliveryAddressStreet;

  set deliveryAddressStreet(String value) {
    _deliveryAddressStreet = value;
  }

  String get deliveryAddressZone => _deliveryAddressZone;

  set deliveryAddressZone(String value) {
    _deliveryAddressZone = value;
  }

  String get deliveryAddressCity => _deliveryAddressCity;

  set deliveryAddressCity(String value) {
    _deliveryAddressCity = value;
  }

  String get deliveryAddressCountry => _deliveryAddressCountry;

  set deliveryAddressCountry(String value) {
    _deliveryAddressCountry = value;
  }

  TravelId.fromJson(Map<String,dynamic> json){
    travelId=json["travelId"];
    travelUserId=json["travelUserId"];
    travelDriverId=json["travelDriverId"];
    travelStatus=json["travelStatus"];
    travelDateDelivery=json["travelDateDelivery"];
    startAddressNumber=json["startAddressNumber"];
    startAddressStreet=json["startAddressStreet"];
    startAddressZone=json["startAddressZone"];
    startAddressCity=json["startAddressCity"];
    startAddressCountry=json["startAddressCountry"];
    deliveryAddressNumber=json["deliveryAddressNumber"];
    deliveryAddressStreet=json["deliveryAddressStreet"];
    deliveryAddressZone=json["deliveryAddressZone"];
    deliveryAddressCity=json["deliveryAddressCity"];
    deliveryAddressCountry=json["deliveryAddressCountry"];
  }
  // Map toJson() => {
  //   "userId":_travelId,
  //   "driverId": _travelUserId,
  //   "startAddressId": _travelDriverId,
  //   "deliveryAddressId": _travelStatus,
  //   "travelStatus":_travelDateDelivery,
  //   "dateDelivery":_startAddressNumber,
  //   "dateDelivery":_startAddressStreet,
  //   "dateDelivery":_startAddressZone,
  //   "dateDelivery":_startAddressCity,
  //   "dateDelivery":_startAddressCountry,
  //   "dateDelivery":_deliveryAddressNumber,
  //   "dateDelivery":_deliveryAddressStreet,
  //   "dateDelivery":_deliveryAddressZone,
  //   "dateDelivery":_deliveryAddressCity,
  //   "dateDelivery":_deliveryAddressCountry
  // };
}