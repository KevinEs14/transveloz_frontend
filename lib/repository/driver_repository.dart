import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:transveloz_frontend/models/CompanyRequest.dart';
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/repository/url.dart';

class DriverRepository{

  Future<bool> updateImage(File image, int id) async{
    try{
      var url =Uri.parse(directionUrl+"v1/driver/"+id.toString()+"/image") ;
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

  Future<bool> updateDriver(Driver driver) async{
    try{

      var res = await http.put(directionUrl+"v1/driver",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(driver.toJsonUp()));
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
        newDriver.pathImage=element["pathImage"];
        if(newDriver.companyName==null){
          newDriver.companyName="Independiente";
        }
        if(newDriver.pathImage==null){
          newDriver.pathImage="nulo";
        }
        drivers.add(newDriver);
      });
      if(res.statusCode==200){
        print(drivers[0].pathImage);
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

  Future<Driver> getDriver(int id) async{
    try{
      Driver driver=Driver();
      print(id);
      String url=directionUrl+"v1/driver/"+id.toString();
      var res = await http.get(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );
      var driver2=jsonDecode(res.body);
      // print(singleDriver2);
      driver.ci=(driver2["ci"]);
      driver.firstname=(driver2["firstName"]);
      driver.firstsurname=(driver2["firstSurname"]);
      driver.secondsurname=(driver2["secondSurname"]);
      driver.birthdate=(driver2["birthDate"]);
      driver.phone=(driver2["phone"]);
      driver.email=(driver2["email"]);
      driver.password=(driver2["password"]);
      driver.number=(driver2["number"]);
      driver.street=(driver2["street"]);
      driver.zone=(driver2["zone"]);
      driver.city=(driver2["city"]);
      driver.country=(driver2["country"]);
      if(res.statusCode==200){
        print(driver.email);
        return driver;
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
  Future<bool> deleteDriver(int id) async{
    try{
      print(id);
      String url=directionUrl+"v1/driver/"+id.toString();
      var res = await http.delete(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );

      if(res.statusCode==200){
        print("Conductor borrado");
        return true;
      }
      else{
        return false;
      }
    }
    catch(error){
      print(error);
      return false;
    }
  }

  Future<Driver> obtener_datos_conductor(Driver driver,int driverId) async{
    try{
      print("DriverId Profile: "+driverId.toString());
      String url=directionUrl+"v1/driver/"+driverId.toString();
      var response = await http.get(url, //ip for virtualized devices
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var driver2=jsonDecode(response.body);
      // print(singleDriver2);
      driver.ci=(driver2["ci"]);
      driver.firstname=(driver2["firstName"]);
      driver.firstsurname=(driver2["firstSurname"]);
      driver.secondsurname=(driver2["secondSurname"]);
      driver.birthdate=(driver2["birthDate"]);
      driver.phone=(driver2["phone"]);
      driver.email=(driver2["email"]);
      driver.password=(driver2["password"]);
      driver.number=(driver2["number"]);
      driver.street=(driver2["street"]);
      driver.zone=(driver2["zone"]);
      driver.city=(driver2["city"]);
      driver.country=(driver2["country"]);
      driver.picture=(driver2["picture"]);

      if(response.statusCode == 200){
        print("Done Profile Driver");
        return driver;
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