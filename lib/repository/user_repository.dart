
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/User.dart';

class UserRepository{

  Future<bool> createUser(User user) async{
    try{
      var res = await http.post("http://192.168.128.11:8070/v1/user",
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
}