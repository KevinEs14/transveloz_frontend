import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/repository/url.dart';
class VehicleRepository{

  
  Future<List<VehicleModel>>getData() async{
    try{
      var url=directionUrl+"v1/vehicle";
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