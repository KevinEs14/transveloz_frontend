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

  var _items = ['Camioneta', 'Volqueta', 'Minibus'];
  String _vista = "Seleccione una opcion";




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
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.04),
                        child: Center(
                          child: Text("AÑADIR NUEVO VEHICULO",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Ingrese numero de placa",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 5
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                          ),
                          controller: vehicleLicensePlateText,
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
