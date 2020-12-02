import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/VehicleModel.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleInformationPage.dart';
import '../../repository/vehicleList_repository.dart';
class VehicleRegister extends StatefulWidget with NavigationStates{
  @override
  _VehicleRegister createState() => _VehicleRegister();
}

class _VehicleRegister extends State<VehicleRegister>{
  Size size;

  TextEditingController vehicleLicensePlateText = TextEditingController();
  TextEditingController vehicleCapacityText = TextEditingController();

  TextEditingController vehiclePriceText = TextEditingController();
  TextEditingController vehicleBrandText = TextEditingController();
  TextEditingController vehicleBrandModel = TextEditingController();

  var _itemsTypeVehicle = ['Camioneta', 'Volqueta', 'Minibus'];
  String _nameTypeVehicle = "Seleccione una opcion";



  @override
  void initState(){
    super.initState();
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(

                        margin: EdgeInsets.only(top: size.height*0.04),
                        child: Center(
                          child: Text("AÑADIR NUEVO VEHICULO",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextField(
                          decoration:InputDecoration(
                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Ingrese numero de placa",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 3
                                )
                            ),

                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextFormField(
                          decoration:InputDecoration(
                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Ingrese la capacidad del vehiculo",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 3
                                )
                            ),

                          ),
                        ),
                      ),


                      SizedBox(
                        height: 10,
                      ),


                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.only(left:16,right: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEBD3),
                          borderRadius: BorderRadius.all(Radius.circular(10)),



                            border: Border.all(
                                color: Color(0xFF0F4C5C),
                                width: 3,

                            ),


                        ),


                        child: DropdownButton(
                          hint: Text(_nameTypeVehicle, style: TextStyle(color: Color(0xFF0F4C5C))),
                          dropdownColor: color4,
                          elevation: 5,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 36.0,
                          isExpanded: true,
                          iconDisabledColor: color4,

                          iconEnabledColor: Color(0xFF0F4C5C),
                          onChanged: (newValue){
                            setState(() {
                              _nameTypeVehicle = newValue;
                            });
                          },
                          items: _itemsTypeVehicle.map((newValue){
                            return DropdownMenuItem(
                                value: newValue,
                                child: Text(newValue, style: TextStyle(color: color1)));
                          }).toList(),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),



                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextFormField(
                          decoration:InputDecoration(
                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Ingrese la marca del vehiculo",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 3
                                )
                            ),

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextFormField(
                          decoration:InputDecoration(
                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",

                            border: InputBorder.none,
                            hintText: "Ingrese el modelo del vehiculo",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 3
                                )
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: (){
                          //user  = Submit();
                          //if(user != null){
                          //  Navigator.push(context, MaterialPageRoute(builder: (conext)=>UserRegisterAddress(user)));
                          //}
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFF0F4C5C),
                          ),
                          child: Center(child: Text("Siguiente   ➜",style: TextStyle(fontSize:size.width*0.058,color: Colors.white,fontWeight: FontWeight.bold),)),
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
