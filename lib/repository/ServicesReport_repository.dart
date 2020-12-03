import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/models/TravelByDriver.dart';
import 'package:transveloz_frontend/repository/url.dart';
class ServiceReportRepository{


  var url=directionUrl;
  var auxUrl;

  Future<List<DriverContact>>getDrivers() async{
    try{
      auxUrl = directionUrl+"v1/driver/contact";
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<DriverContact>();

      for(datos in datos){
        registros.add(DriverContact.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error);
    }
  }

  Future<List<TravelByDriver>>getUseres(int id) async{
    try{
      auxUrl = directionUrl+"v1/driver/travel/"+id.toString();
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<TravelByDriver>();

      for(datos in datos){
        registros.add(TravelByDriver.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error);
    }
  }
}