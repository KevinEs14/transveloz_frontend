

import 'package:transveloz_frontend/models/VehicleRegister.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/repository/url.dart';

class VehicleRegisterRepository{

  Future<bool> createVehicle(VehicleRegister vehicleRegister) async{
    try{
      var res = await http.post(directionUrl+"v1/vehicle",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(vehicleRegister.toJson()));
      if(res.statusCode == 200){
        print("Done1");
        return true;
      }else{
        return false;
      }
    }
    catch(error){
      print(error);
      return false;
    }
  }

}