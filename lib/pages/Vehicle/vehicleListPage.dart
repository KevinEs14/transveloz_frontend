import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleInformationPage.dart';
import 'package:transveloz_frontend/pages/loginPage.dart';
import '../../repository/vehicleList_repository.dart';
class VehicleListPage extends StatefulWidget with NavigationStates{
  @override
  _VehicleListPage createState() => _VehicleListPage();
}

class _VehicleListPage extends State<VehicleListPage>{
  String auxFilter="";
  bool closeTopContainer = false;
  double topContainer = 0;
  Size size;
  String _nameFilter="SELECCIONAR FILTRO";
  List<String>_filterList=[
    "SELECCIONAR FILTRO",
    "ORDENAR POR MARCA",
    "ORDENAR POR COMPAÑIA",
    "ORDENAR POR TIPO VEHICULO"];
  List<VehicleModel> data = List<VehicleModel>();

  VehicleRepository vehicleRepository = VehicleRepository();

  TextEditingController filterSearch = TextEditingController();

  @override
  void initState(){
    super.initState();
    vehicleRepository.getData().then((value){
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
                            child: Text("BUSQUEDA DE VEHICULOS",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
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
                              if(_nameFilter == _filterList[1]){
                                auxFilter="A";
                              }

                              if(_nameFilter == _filterList[2]){
                                auxFilter="B";
                              }
                              if(_nameFilter == _filterList[3]){
                                auxFilter="C";
                              }

                              if(_nameFilter == _filterList[0]){
                                vehicleRepository.getData().then((value){
                                  setState(() {
                                    data.addAll(value);
                                  });
                                });

                              }
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
                        Container(
                          width: size.width*0.62,//Se debe incrementar a 0.62
                          padding: EdgeInsets.all(1),
                          child: TextFormField(
                            decoration:InputDecoration(
                              fillColor: Color(0xFFEEEBD3),
                              filled: true,
                              prefixText: "    ",
                              border: InputBorder.none,
                              hintText: "Buscar Vehiculo",
                              hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color(0xFF0F4C5C),
                                      width: 3
                                  )
                              ),
                            ),
                            controller: filterSearch,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            data.clear();
                            if (auxFilter=='A'){
                              vehicleRepository.getDatabyBrand(filterSearch.text).then((value){
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            }

                            if (auxFilter=='B'){
                              vehicleRepository.getDatabyCompany(filterSearch.text).then((value){
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            }

                            if (auxFilter=='C'){
                              vehicleRepository.getDatabyType(filterSearch.text).then((value){
                                setState(() {
                                  data.addAll(value);
                                });
                              });
                            }
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
                                              Text(
                                                "\ ${data[index].vehicleType} - ${data[index].vehicleBrand} ${data[index].vehicleModel}",
                                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                            ]
                                        ),

                                        Row(
                                          children: <Widget>[
                                            Image.asset(
                                              "assets/images/3cf0d408681a5b28ddbb099e9bcfb8a5.jpg",
                                              //"${data[index].vehiclePicture}",
                                              height: 110,
                                              width: 100,
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  "\ Conductor: ${data[index].personFirstName} ${data[index].personFirstSurname}",
                                                  style: const TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  "\ Capacidad: ${data[index].vehicleCapacity} Toneladas",
                                                  style: const TextStyle(fontSize: 11, color: Colors.black),
                                                ),
                                                Text(
                                                  "\ Compañia: ${data[index].vehicleCompany}",
                                                  style: const TextStyle(fontSize: 15, color: Colors.black),
                                                ),
                                                Text(
                                                  "\ Precio: \$ ${data[index].vehiclePrice}",
                                                  style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 10,),
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>VehicleInformationPage(data[index].vehicleId)));

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
                                                        child: Text("VER MAS",style: TextStyle(fontSize:size.height*0.018,color: Colors.white,fontWeight: FontWeight.bold),)),
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
