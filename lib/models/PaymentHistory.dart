
import 'package:flutter/material.dart';

class PaymentHistory{
  String _datePayment;
  String _paymentStatus;
  double _amount;
  String _driverFirstName;
  String _driverFirstSurname;
  String _startStreet;

  String get startStreet => _startStreet;

  set startStreet(String value) {
    _startStreet = value;
  }

  String _deliveryStreet;

  PaymentHistory();
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

  String get driverFirstName => _driverFirstName;

  set driverFirstName(String value) {
    _driverFirstName = value;
  }

  String get driverFirstSurname => _driverFirstSurname;

  set driverFirstSurname(String value) {
    _driverFirstSurname = value;
  }
  // Map toJson() => {
  //   "datePayment": _datePayment,
  //   "paymentStatus": _paymentStatus,
  //   "amount":amount,
  //   "driverFirstName":_driverFirstName,
  //   "driverFirstSurname": _driverFirstSurname,
  // };

  PaymentHistory.fromJson(Map<String,dynamic> json){
    datePayment=json["datePayment"];
    paymentStatus=json["paymentStatus"];
    amount=json["amount"];
    driverFirstName=json["driverFirstName"];
    driverFirstSurname=json["driverFirstSurname"];
    startStreet=json["startStreet"];
    deliveryStreet=json["deliveryStreet"];
  }

  String get deliveryStreet => _deliveryStreet;

  set deliveryStreet(String value) {
    _deliveryStreet = value;
  }
}