import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/VehicleList.dart';
import 'package:flutter/cupertino.dart';
class VehicleRepository{

  Future <List<VehicleModel>> getListVehicles() async{
    try{
      List<VehicleModel> listVehicle=List();
      var url="http://192.168.1.7:8070/v1/vehicle";
      print(url);
      final response = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List resVehicle = jsonDecode(response.body);
      resVehicle.forEach((element) {

        VehicleModel newVehicle=VehicleModel();
        newVehicle.vehicleId=element["vehicleId"];
        newVehicle.vehicleType=element["vehicleType"];
        newVehicle.vehicleBrand=element["vehicleBrand"];
        newVehicle.vehicleModel=element["vehicleModel"];
        newVehicle.personFirstName=element["personFirstName"];
        newVehicle.personFirstSurname=element["personFirstSurname"];
        newVehicle.vehicleCapacity=element["vehicleCapacity"];
        newVehicle.vehicleCompany=element["vehicleCompany"];
        newVehicle.vehiclePrice=element["vehiclePrice"];
        listVehicle.add(newVehicle);
      });
      print(listVehicle);
      if(response.statusCode==200){
        return resVehicle;
      }
      else{
        return null;
      }
    }catch(error){
      print(error);
      return null;
    }
  }

}