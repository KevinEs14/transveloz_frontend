
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/models/User.dart';
import 'package:transveloz_frontend/repository/url.dart';

class UserRepository{

  Future<bool> createUser(User user) async{
    try{
      var res = await http.post(directionUrl+"v1/user",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()));
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

  Future<List<LogIn>> getUserLogList() async{
    try{
      List<LogIn> list=List();
      var res = await http.get(directionUrl+"v1/user/sesion",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List response = jsonDecode(res.body);
      response.forEach((element) {
        LogIn newUserLog=LogIn();
        newUserLog.id=element["id"];
        newUserLog.email=element["email"];
        newUserLog.password=element["password"];
        list.add(newUserLog);
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