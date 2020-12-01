
import 'package:flutter/material.dart';

class Payment{
  int _travelId;

  int get travelId => _travelId;

  set travelId(int value) {
    _travelId = value;
  }

  int _administrationId;
  String _datePayment;
  String _paymentStatus;
  double _amount;
  int _status;

  int get status => _status;

  set status(int value) {
    _status = value;
  }

  Payment();

  int get administrationId => _administrationId;

  set administrationId(int value) {
    _administrationId = value;
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
  Map toJson() => {
    "travelId":_travelId,
    "administrationId": _administrationId,
    "datePayment": _datePayment,
    "paymentStatus": _paymentStatus,
    "amount":amount,
    "status": _status
  };
}