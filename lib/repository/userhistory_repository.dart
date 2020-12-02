
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/UserHistory.dart';
import 'package:transveloz_frontend/repository/url.dart';

class UserHistoryRepository{

  Future<List<UserHistory>> tomar_datos() async{
    try{
      //var url = 'http://192.168.128.11:8070/v1/user/1/payment';
      //var response = await http.post(url).timeout(Duration(seconds: 90));
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      // var url = 'http://192.168.0.18:8070/v1/user/2/payment';
      //var response = await http.post(url).timeout(Duration(seconds: 90));=
      //var url = 'http://192.168.128.11:8070/v1/user/2/payment';
      var url = directionUrl+"v1/user/1/payment";
      print(url);
      var response = await   http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<UserHistory>();

      for(datos in datos){
        registros.add(UserHistory.fromJson(datos));
      }

      return registros;
    }
    catch(error){
      print(error);
      return null;
    }
  }
}