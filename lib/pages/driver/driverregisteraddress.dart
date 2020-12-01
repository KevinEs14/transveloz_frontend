import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/CompanyRequest.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/pages/homepage.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/sidebar/sidebar.dart';
import 'package:transveloz_frontend/sidebar/sidebar_layout.dart';

class DriverRegisterAddress extends StatefulWidget with NavigationStates {
  DriverRegisterAddress(this.driver);
  Driver driver;
  @override
  _DriverRegisterAddress createState() => _DriverRegisterAddress(driver);
}

class _DriverRegisterAddress extends State<DriverRegisterAddress>{
  _DriverRegisterAddress(this.driver);

  CompanyRequest _value = CompanyRequest();
  List<String>_List=[
    "SELECCIONAR FILTRO",
    "ORDENAR POR MARCA",
    "ORDENAR POR COMPAÑIA",
    "ORDENAR POR TIPO VEHICULO",
    "ORDENAR POR CAPACIDAD"];

  Driver driver;
  DriverRepository driverRepository = DriverRepository();
  List<CompanyRequest> companies = List();

  TextEditingController number = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  _loadCompanies() async{
    var compAux=await driverRepository.getCompanies();
   setState(() {
     companies = compAux;
   });
    print('Companies');
    print(companies);
  }


  @override
  void initState() {
    super.initState();
    _loadCompanies();
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondoRegistro.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              Column(
                children: [
                  Container(
                        margin: EdgeInsets.only(top: size.height*0.08),
                        child: Center(
                          child: Text("Dirección de domicilio",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Número de casa",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: number,
                      ),
                    ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Calle",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: street,
                      ),
                    ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Zona",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: zone,
                      ),
                    ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ciudad",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: city,
                      ),
                    ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: color4,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 20,
                              offset: Offset(0,10),
                            )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "País",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: country,
                      ),
                    ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    padding: EdgeInsets.only(left:16,right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(

                      dropdownColor: color1,
                      elevation: 5,
                      value: _value.companyId,
                      iconEnabledColor: Colors.white,

                      hint: Text("Seleccione un opción", style: TextStyle(color: Colors.white),),
                      onChanged: (newValue){
                        setState(() {
                          _value = companies.firstWhere((element) {
                            if(element.companyId==newValue){
                              return true;
                            }
                            else{
                              return false;
                            }
                          });

                        });
                        print(_value.companyId);
                      },
                      items: companies.map((newValue){
                        return DropdownMenuItem(
                          value: newValue.companyId,

                          child: Text(newValue.name, style: TextStyle(color: Colors.white)),);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  GestureDetector(
                    onTap: (){
                      bool verificacion = Submit();
                      if(verificacion){
                        driverRepository.createDriver(driver);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SideBarLayout()));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: color1
                      ),
                      child: Center(child: Text("Registrar",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ) 
            ],
          ),
        ),
      ),
    );
  }

  bool Submit(){
    bool x = false;
    if( number.text.isNotEmpty && street.text.isNotEmpty && zone.text.isNotEmpty && city.text.isNotEmpty && country.text.isNotEmpty){
      x = true;
      driver.number=number.text;
      driver.street=street.text;
      driver.zone=zone.text;
      driver.city=city.text;
      driver.country=country.text;
      driver.companyId=_value.companyId;
    }else{
      x = false;
    }
    return x;
  }

}

