import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleInformationPage.dart';
import '../../repository/vehicleList_repository.dart';
class VehicleList extends StatefulWidget with NavigationStates{
  @override
  _VehicleList createState() => _VehicleList();
}

class _VehicleList extends State<VehicleList>{
  bool closeTopContainer = false;
  double topContainer = 0;
  Size size;
  String _nameFilter="SELECCIONAR FILTRO";
  List<String>_filterList=[
    "SELECCIONAR FILTRO",
    "ORDENAR POR MARCA",
    "ORDENAR POR COMPAÑIA",
    "ORDENAR POR TIPO VEHICULO",
    "ORDENAR POR CAPACIDAD"];
  List<VehicleModel> data = List<VehicleModel>();
  VehicleRepository vehicleRepository = VehicleRepository();

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
    return SafeArea(
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
                      padding: EdgeInsets.only(left:16,right: 16),
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
    );
  }
}
