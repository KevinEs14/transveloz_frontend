
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/models/User.dart';
import 'package:transveloz_frontend/models/UserHistoryPayment.dart';
import 'package:transveloz_frontend/repository/url.dart';

class UserRepository{

  Future<bool> updateImage(File image, int id) async{
    try{
      var url =Uri.parse(directionUrl+"v1/user/"+id.toString()+"/image") ;
      var res = http.MultipartRequest('PUT',url);
      res.files.add(await http.MultipartFile.fromPath("image", image.path));
      var response = await res.send();

      if(response.statusCode == 200){
        print("Done Image");
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

  Future<List<UserHistoryPayment>> tomar_datos(int id) async{
    try{
      print("UserId: "+id.toString());
      var url = directionUrl+"v1/payment/historypayment/"+id.toString();
      print(url);
      var response = await   http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var datos = jsonDecode(response.body);
      var registros = List<UserHistoryPayment>();

      for(datos in datos){
        registros.add(UserHistoryPayment.fromJson(datos));
      }

      return registros;
    }
    catch(error){
      print(error);
      return null;
    }
  }
  Future<bool> updateUser(User user) async{
    try{
      var res = await http.put(directionUrl+"v1/user",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user.toJsonUp()));
      if(res.statusCode == 200){
        print("Done Update");
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

  Future<User> obtener_datos_usuario(User user,int userId) async{
    try{
      print("UserId Profile: "+userId.toString());
      String url=directionUrl+"v1/user/"+userId.toString();
      var response = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var user2=jsonDecode(response.body);
      // print(singleDriver2);
      user.ci=(user2["ci"]);
      user.firstname=(user2["firstName"]);
      user.firstsurname=(user2["firstSurname"]);
      user.secondsurname=(user2["secondSurname"]);
      user.birthdate=(user2["birthDate"]);
      user.phone=(user2["phone"]);
      user.email=(user2["email"]);
      user.password=(user2["password"]);
      user.number=(user2["number"]);
      user.street=(user2["street"]);
      user.zone=(user2["zone"]);
      user.city=(user2["city"]);
      user.country=(user2["country"]);

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

class UserProfileRepository{
  Future<User> obtener_datos_usuario(User user,int userId) async{
    try{
      print("UserId Profile: "+userId.toString());
      String url=directionUrl+"v1/user/"+userId.toString();
      var response = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var user2=jsonDecode(response.body);
      // print(singleDriver2);
      user.ci=(user2["ci"]);
      user.firstname=(user2["firstName"]);
      user.firstsurname=(user2["firstSurname"]);
      user.secondsurname=(user2["secondSurname"]);
      user.birthdate=(user2["birthDate"]);
      user.phone=(user2["phone"]);
      user.email=(user2["email"]);
      user.password=(user2["password"]);
      user.number=(user2["number"]);
      user.street=(user2["street"]);
      user.zone=(user2["zone"]);
      user.city=(user2["city"]);
      user.country=(user2["country"]);

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