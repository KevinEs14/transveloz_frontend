
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/User.dart';

class UserRepository{

  Future<bool> createUser(User user) async{
    try{
      //var res = await http.post("http://192.168.128.11:8070/v1/user",
      //var res = await http.post("http://192.168.1.7:8070/v1/user",
      // var res = await http.post("http://192.168.128.11:8070/v1/user",
      var res = await http.post("http://192.168.128.4:8070/v1/user",
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

class UserProfileRepository {
  Future<User> obtener_datos_usuario(User user) async{
    try{
      //var url = 'http://192.168.128.11:8070/v1/user/1/payment';
      //var response = await http.post(url).timeout(Duration(seconds: 90));
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      var url = 'http://192.168.128.4:8070/v1/user/1';
      //var response = await http.post(url).timeout(Duration(seconds: 90));=
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      //var url = 'http://10.0.2.2:8070/v1/user/1/payment';
      print(url);
      var response = await   http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var user2=jsonDecode(response.body);
      user.ci= (user2["ci"]);
      user.firstname  = (user2['firstName']);
      user.firstsurname = (user2['firstSurname']);
      user.secondsurname = (user2['secondSurname']);
      user.birthdate = (user2['birthDate']);
      user.phone = (user2['phone']);
      user.email = (user2['email']);
      user.password = (user2['password']);
      user.number = (user2['number']);
      user.street = (user2['street']);
      user.zone = (user2['zone']);
      user.city = (user2['city']);
      user.country = (user2['country']);

      if(response.statusCode == 200){
        print("Done Profile");
        return user;

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
class UserProfileRepository1 {
  Future<List<User>> obtener_datos_usuario() async{
    try{
      //var url = 'http://192.168.128.11:8070/v1/user/1/payment';
      //var response = await http.post(url).timeout(Duration(seconds: 90));
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      var url = 'http://192.168.128.4:8070/v1/user/1';
      //var response = await http.post(url).timeout(Duration(seconds: 90));=
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      //var url = 'http://10.0.2.2:8070/v1/user/1/payment';
      print(url);
      var response = await   http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      debugPrint(response.body);
      var registros = List<User>();

      for(datos in datos){
        registros.add(User.fromJson(datos));
      }

      return registros;
    }
    catch(error){
      print(error);
      return null;
    }
  }
}