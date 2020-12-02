import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/CompanyRequest.dart';

class DriverRepository{
  
  Future<bool> createDriver(Driver driver) async{
    try{

      //var res = await http.post("http://192.168.1.7:8070/v1/driver",
      //var res = await http.post("http://192.168.128.11:8070/v1/driver",
      // var res = await http.post("http://192.168.0.18:8070/v1/driver",
      var res = await http.post("http://192.168.128.4:8070/v1/driver", //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(driver.toJson()));
      if(res.statusCode == 200){
        print("Done");
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
  Future<List<CompanyRequest>> getCompanies() async{
    try{
      List<CompanyRequest> companies=List();
      var res = await http.get("http://192.168.0.18:8070/v1/driver/company",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List response = jsonDecode(res.body);
      response.forEach((element) {
        CompanyRequest newCompany=CompanyRequest();
        newCompany.companyId=element["companyId"];
        newCompany.name=element["name"];
        companies.add(newCompany);
      });
      if(res.statusCode==200){
        print(companies[0].companyId);
        return companies;
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