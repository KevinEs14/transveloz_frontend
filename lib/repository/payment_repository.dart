import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Card.dart';
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/models/Payment.dart';
import 'package:transveloz_frontend/models/Travel.dart';
import 'package:transveloz_frontend/repository/url.dart';

class PaymentRepository{

  Future<bool> createPayment(Payment payment) async{
    try{
      // print(travel.userId);
      // print(travel.startAddressStreet);
      // print(travel.deliveryAddressStreet);
      var res = await http.post(directionUrl+"v1/payment",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(payment.toJson()));

      if(res.statusCode == 200){
        print("PaymentDone");
        return true;
      }else{
        print("no crea payment");
        return false;
      }
    }
    catch(error){
      print(error);
      return false;
    }
  }
}