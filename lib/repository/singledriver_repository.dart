import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/SingleDriver.dart';
import 'package:transveloz_frontend/repository/url.dart';

class SingleDriverRepository{
  
  Future<SingleDriver> obtainVehicle(SingleDriver singleDriver) async{
    try{

      String url=directionUrl+"v1/vehicle/"+singleDriver.vehicleId.toString();

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
          var singleDriver2=jsonDecode(res.body);
          // print(singleDriver2);
          singleDriver.personFirstName=(singleDriver2["personFirstName"]);
          singleDriver.personFirstSurname=(singleDriver2["personFirstSurname"]);
          singleDriver.vehicleLicensePlate=(singleDriver2["vehicleLicensePlate"]);
          singleDriver.vehicleCapacity=(singleDriver2["vehicleCapacity"]);
          singleDriver.vehicleType=(singleDriver2["vehicleType"]);
          singleDriver.vehiclePrice=(singleDriver2["vehiclePrice"]);
          singleDriver.vehicleStatus=(singleDriver2["vehicleStatus"]);
          singleDriver.vehicleBrand=(singleDriver2["vehicleBrand"]);
          singleDriver.vehicleModel=(singleDriver2["vehicleModel"]);

          // body: jsonEncode(singleDriver.toJson()));
      if(res.statusCode == 200){
        print("Done2");
        return singleDriver;
      }else{
        return null;
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }
}