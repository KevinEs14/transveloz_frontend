import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/models/TravelByDriver.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleInformationPage.dart';
import 'package:transveloz_frontend/pages/loginPage.dart';
import 'package:transveloz_frontend/repository/ServicesReport_repository.dart';
class ServicesReportPage extends StatefulWidget with NavigationStates{
  @override
  _ServicesReportPage createState() => _ServicesReportPage();
}

class _ServicesReportPage extends State<ServicesReportPage>{
  String auxFilter="";
  bool closeTopContainer = false;
  double topContainer = 0;
  Size size;
  String _nameFilter="NOMBRE DE CONDUCTOR";
  List<String>_filterList=List<String>();
  ServiceReportRepository serviceReportRepository = ServiceReportRepository();
  TextEditingController filterSearch = TextEditingController();

  List<TravelByDriver> data;

  @override
  void initState(){
    super.initState();
    serviceReportRepository.getUseres(1).then((value){
      setState(() {
        data.addAll(value);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        // setState(() {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        // });
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp
        ]);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Container(
            height: size.height,
            child: ListView(
              children:[
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/fondoRegistro.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: size.height*0.04),
                          child: Center(
                            child: Text("REPORTES DE SERVICIOS",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left:30,right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(

                            dropdownColor: color4,
                            elevation: 5,
                            iconEnabledColor: Colors.white,
                            hint: Text(_nameFilter, style: TextStyle(color: Colors.white)),
                            onChanged: (newValue){
                              setState(() {
                                _nameFilter = newValue;
                              });
                            },
                            items: _filterList.map((newValue){
                              return DropdownMenuItem(
                                  value: newValue,
                                  child: Text(newValue, style: TextStyle(color: color1)));
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                data.clear();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xFF0F4C5C),
                                ),
                                child: Center(child: Text("  BUSCAR  ",style: TextStyle(fontSize:size.width*0.058,color: Colors.white,fontWeight: FontWeight.bold),)),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.all(5),
                              itemCount: data == null ?0:data.length,
                              itemBuilder: (BuildContext context, int index){
                                return Container(
                                  height: 180,
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: color4, boxShadow: [
                                    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                                  ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 20),
                                    child: Column(
                                      children: [

                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  //"\ Conductor: ${data[index].personFirstName} ${data[index].personFirstSurname}",
                                                  'Nombre: ${data[index].userFirstName} ${data[index].userFirsSurname}',
                                                  style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  //"\ Capacidad: ${data[index].vehicleCapacity} Toneladas",
                                                  'Fecha: ${data[index].travelDateDelivery}',
                                                  style: const TextStyle(fontSize: 11, color: Colors.black),
                                                ),
                                                Text(
                                                  //"\ Compañia: ${data[index].vehicleCompany}",
                                                  'Telefono: ${data[index].userPhone}',
                                                  style: const TextStyle(fontSize: 15, color: Colors.black),
                                                ),
                                                Text(
                                                  //"\ Precio: \$ ${data[index].vehiclePrice}",
                                                  'Estado: ${data[index].travelStatus}',
                                                  style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 10,),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>VehicleInformationPage(1)));

                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 5,right: 5),
                                                    padding: EdgeInsets.all(5),
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: color1
                                                    ),
                                                    child: Center(
                                                        child: Text("VER DIRECCION INICIO",style: TextStyle(fontSize:size.height*0.018,color: Colors.white,fontWeight: FontWeight.bold),)
                                                    ),

                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),

                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>VehicleInformationPage(1)));

                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 5,right: 5),
                                                    padding: EdgeInsets.all(5),
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        color: color1
                                                    ),
                                                    child: Center(
                                                        child: Text("VER DIRECCION DESTINO",style: TextStyle(fontSize:size.height*0.018,color: Colors.white,fontWeight: FontWeight.bold),)
                                                    ),

                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
