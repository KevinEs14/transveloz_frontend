import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
class VehicleRepository{
  Future<List<VehicleModel>>getData() async{
    try{
      var url="http://192.168.128.4:8070/v1/vehicle";
      //var url = "http://192.168.1.12:8070/v1/vehicle";
      List<VehicleModel> listVehicle=List();
      //var url="http://192.168.1.7:8070/v1/vehicle";
      //var url="http://10.0.2.2:8070/v1/vehicle";
      print(url);
      final response = await http.get(url,
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