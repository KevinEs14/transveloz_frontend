
import 'package:flutter/material.dart';

class Travel{
  int _userId;

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int _driverId;
  int _startAddressId;
  int _deliveryAddressId;
  String _travelStatus;
  String _dateDelivery;
  int _status;

  int get driverId => _driverId;

  set driverId(int value) {
    _driverId = value;
  }

  int get startAddressId => _startAddressId;

  set startAddressId(int value) {
    _startAddressId = value;
  }

  int get deliveryAddressId => _deliveryAddressId;

  set deliveryAddressId(int value) {
    _deliveryAddressId = value;
  }

  String get travelStatus => _travelStatus;

  set travelStatus(String value) {
    _travelStatus = value;
  }

  String get dateDelivery => _dateDelivery;

  set dateDelivery(String value) {
    _dateDelivery = value;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }
  Map toJson() => {
    "userId":_userId,
    "driverId": _driverId,
    "startAddressId": _startAddressId,
    "deliveryAddressId": _deliveryAddressId,
    "travelStatus":_travelStatus,
    "dateDelivery":_dateDelivery,
    "status": _status
  };

}