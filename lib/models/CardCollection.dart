
import 'dart:math';

import 'package:flutter/material.dart';

class CardCollection{
  int _userId;
  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
  String _accountNumber;
  String _pin;
  String _bank;
  String _typeAccount;
  String _cvvCode;
  int _status;
  CardCollection();


  String get accountNumber => _accountNumber;

  set accountNumber(String value) {
    _accountNumber = value;
  }

  String get pin => _pin;

  set pin(String value) {
    _pin = value;
  }

  String get bank => _bank;

  set bank(String value) {
    _bank = value;
  }

  String get typeAccount => _typeAccount;

  set typeAccount(String value) {
    _typeAccount = value;
  }

  String get cvvCode => _cvvCode;

  set cvvCode(String value) {
    _cvvCode = value;
  }

  int get status => _status;

  set status(int value) {
    _status = value;
  }
  Map toJson() => {
    "userId":_userId,
    "accountNumber": _accountNumber,
    "pin": _pin,
    "bank": _bank,
    "typeAccount":_typeAccount,
    "cvvCode":_cvvCode,
    "status": _status
  };
  CardCollection.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    accountNumber = json['accountNumber'];
    pin = json['pin'];
    bank = json['bank'];
    typeAccount = json['typeAccount'];
    cvvCode = json['cvvCode'];
    status = json['status'];
    // travelStatus = json['travelStatus'];
  }
}