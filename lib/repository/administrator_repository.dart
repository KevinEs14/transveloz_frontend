import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/repository/url.dart';

class AdministratorRepository{

  Future<List<LogIn>> getAdmiLogList() async{
    try{
      List<LogIn> list=List();
      var res = await http.get(directionUrl+"v1/administration/sesion",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List response = jsonDecode(res.body);
      response.forEach((element) {
        LogIn newAdmiLog=LogIn();
        newAdmiLog.id=element["id"];
        newAdmiLog.email=element["email"];
        newAdmiLog.password=element["password"];
        list.add(newAdmiLog);
      });
      if(res.statusCode==200){
        print(list[0].email);
        print(list.length);
        return list;
      }
      else{
        return null;
      }
    }
    catch(error){
      print(error);
      return null;
    }
  }
}