import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Card.dart';
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/repository/url.dart';

class CardRepository{

  Future<bool> createCard(Card card) async{
    try{
      print(card.userId);
      var res = await http.post(directionUrl+"v1/payment/card",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(card.toJson()));
      if(res.statusCode == 200){
        print("CardDone");
        return true;
      }else{
        print("no crea");
        return false;
      }
    }
    catch(error){
      print(error);
      return false;
    }
  }
}