import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/CompanyRequest.dart';
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/repository/url.dart';

class DriverRepository{
  
  Future<bool> createDriver(Driver driver) async{
    try{

      var res = await http.post(directionUrl+"v1/driver",
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
      var res = await http.get(directionUrl+"v1/driver/company",
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

  Future<List<DriverContact>> getDriverList() async{
    try{
      List<DriverContact> drivers=List();
      var res = await http.get(directionUrl+"v1/driver/contact",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List response = jsonDecode(res.body);
      response.forEach((element) {
        DriverContact newDriver=DriverContact();
        newDriver.driverId=element["driverId"];
        newDriver.ci=element["ci"];
        newDriver.firstName=element["firstName"];
        newDriver.firstSurname=element["firstSurname"];
        newDriver.secondSurname=element["secondSurname"];
        newDriver.companyName=element["companyName"];
        if(newDriver.companyName==null){
          newDriver.companyName="Independiente";
        }
        drivers.add(newDriver);
      });
      if(res.statusCode==200){
        print(drivers[0].firstSurname);
        return drivers;
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

  Future<List<LogIn>> getDriverLogList() async{
    try{
      List<LogIn> list=List();
      var res = await http.get(directionUrl+"v1/driver/sesion",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      List response = jsonDecode(res.body);
      response.forEach((element) {
        LogIn newDriverLog=LogIn();
        newDriverLog.id=element["id"];
        newDriverLog.email=element["email"];
        newDriverLog.password=element["password"];
        list.add(newDriverLog);
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