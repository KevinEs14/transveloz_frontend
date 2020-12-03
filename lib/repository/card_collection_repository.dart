import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/CardCollection.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/SingleDriver.dart';
import 'package:transveloz_frontend/repository/url.dart';

class CardCollectionRepository{
  
  Future<List<CardCollection>> obtainListCard(CardCollection cardCollection) async{
    try{

      String url=directionUrl+"v1/payment/cardcollection/"+cardCollection.userId.toString();

      var res = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
          var cardCollection2=jsonDecode(res.body);
          var cardCollection3=List<CardCollection>();

          for(cardCollection2 in cardCollection2){
            cardCollection3.add(CardCollection.fromJson(cardCollection2));
          }
          // body: jsonEncode(singleDriver.toJson()));
      if(res.statusCode == 200){
        print("DoneListaCards");
        return cardCollection3;
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