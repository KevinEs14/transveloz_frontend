
import 'package:flutter/material.dart';

class Travel{
  int _travelUserId;

  int get travelUserId => _travelUserId;

  set travelUserId(int value) {
    _travelUserId = value;
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
  Travel();

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
  Map toJson() => {
    "travelUserId":_travelUserId,
    "travelDriverId": _travelDriverId,
    "travelStatus": _travelStatus,
    "travelDateDelivery": _travelDateDelivery,
    "startAddressNumber":_startAddressNumber,
    "startAddressStreet":_startAddressStreet,
    "startAddressZone":_startAddressZone,
    "startAddressCity":_startAddressCity,
    "startAddressCountry":_startAddressCountry,
    "deliveryAddressNumber":_deliveryAddressNumber,
    "deliveryAddressStreet":_deliveryAddressStreet,
    "deliveryAddressZone":_deliveryAddressZone,
    "deliveryAddressCity":_deliveryAddressCity,
    "deliveryAddressCountry":_deliveryAddressCountry
  };
}