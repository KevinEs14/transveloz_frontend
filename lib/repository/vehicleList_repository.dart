import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/repository/url.dart';
class VehicleRepository{
  var url=directionUrl;
  var auxUrl;

  Future<List<VehicleModel>>getData() async{
    try{
      auxUrl = directionUrl+"v1/vehicle";
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<VehicleModel>();

      for(datos in datos){
        registros.add(VehicleModel.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error);
    }
  }
  Future<List<VehicleModel>>getDatabyType(String type) async{
    try{
      auxUrl = directionUrl+"v1/vehicle/type/"+type;
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<VehicleModel>();

      for(datos in datos){
        registros.add(VehicleModel.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error);
    }
  }

  Future<List<VehicleModel>>getDatabyBrand(String brand) async{
    try{
      auxUrl = directionUrl+"v1/vehicle/brand/"+brand;
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<VehicleModel>();

      for(datos in datos){
        registros.add(VehicleModel.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error.toString());
    }
  }

  Future<List<VehicleModel>>getDatabyCompany(String company) async{
    try{
      auxUrl = directionUrl+"v1/vehicle/company/"+company;
      print(auxUrl);
      final response = await http.get(auxUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<VehicleModel>();

      for(datos in datos){
        registros.add(VehicleModel.fromJson(datos));
      }
      return registros;
    }catch(error){
      debugPrint(error);
    }
  }
}