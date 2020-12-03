import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/SingleDriver.dart';
import 'package:transveloz_frontend/models/Travel.dart';
import 'package:transveloz_frontend/models/TravelId.dart';
import 'package:transveloz_frontend/repository/url.dart';

class TravelIdRepository{
  
  Future <List<TravelId>> obtainTravelId(Travel travel) async{
    try{

      String url=directionUrl+"v1/travel/"+travel.userId.toString()+"/"+travel.driverId.toString();

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var travelId2=jsonDecode(res.body);
      var travelId3=List<TravelId>();

      for(travelId2 in travelId2){
        travelId3.add(TravelId.fromJson(travelId2));
      }

          // body: jsonEncode(singleDriver.toJson()));
      if(res.statusCode == 200){
        print("DoneIdTravel");
        return travelId3;
      }else{
        print("errorIdTravel");
        return null;
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }
}