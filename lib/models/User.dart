
import 'package:flutter/material.dart';

class User{
  String _ci;
  String _firstname;
  String _firstsurname;
  String _secondsurname;
  String _birthdate;
  String _phone;
  String _email;
  String _password;
  String _number;
  String _street;
  String _zone;
  String _city;
  String _country;

  User();

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get zone => _zone;

  set zone(String value) {
    _zone = value;
  }

  String get street => _street;

  set street(String value) {
    _street = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get birthdate => _birthdate;

  set birthdate(String value) {
    _birthdate = value;
  }

  String get secondsurname => _secondsurname;

  set secondsurname(String value) {
    _secondsurname = value;
  }

  String get firstsurname => _firstsurname;

  set firstsurname(String value) {
    _firstsurname = value;
  }

  String get firstname => _firstname;

  set firstname(String value) {
    _firstname = value;
  }

  String get ci => _ci;

  set ci(String value) {
    _ci = value;
  }

  Map toJson() => {
    "ci":ci,
    "firstName": firstname,
    "firstSurname": firstsurname,
    "secondSurname": secondsurname,
    "birthDate":birthdate,
    "phone": phone,
    "email": email,
    "password": password,
    "number":number,
    "street":street,
    "zone":zone,
    "city":city,
    "country":country
  };

  User.fromJson(Map<String, dynamic> json){
    ci = json['ci'];
    firstname = json['firstName'];
    firstsurname = json['firstSurname'];
    secondsurname = json['secondSurname'];
    birthdate = json['birthDate'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    number = json['number'];
    street = json['street'];
    zone = json['zone'];
    city = json['city'];
    country = json['country'];
  }


}