import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Driver.dart';

class DriverRepository{
  
  Future<bool> createDriver(Driver driver) async{
    try{
      // var res = await http.post("http://192.168.0.18:8070/v1/driver",
      var res = await http.post("http://10.0.2.2:8070/v1/driver", //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(driver.toJson()));
      if(res.statusCode == 200){
        print("Done");
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