import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/VehicleRegister.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleInformationPage.dart';
import 'package:transveloz_frontend/repository/vehicleRegister_repository.dart';
import 'package:transveloz_frontend/sidebar/driversidebar_layout.dart';
import '../../repository/vehicleList_repository.dart';
class VehicleRegisterPage extends StatefulWidget with NavigationStates{
  @override
  _VehicleRegisterPage createState() => _VehicleRegisterPage();
}

class _VehicleRegisterPage extends State<VehicleRegisterPage>{
  Size size;

  VehicleRegister vehicleRegister = VehicleRegister();
  VehicleRegisterRepository vehicleRegisterRepository = VehicleRegisterRepository();

  TextEditingController vehicleLicensePlate = TextEditingController();
  TextEditingController vehicleCapacity = TextEditingController();
  String vehicleType="";
  TextEditingController vehiclePrice = TextEditingController();
  TextEditingController vehicleBrand = TextEditingController();
  TextEditingController vehicleModel = TextEditingController();

  var _itemsTypeVehicle = ['Camioneta', 'Volqueta', 'Minibus'];
  String _nameTypeVehicle = "Seleccione una opcion";

  String verifyVehicleRegister ="";
  String verifyVehicleLicensePlate ="";
  String verifyVehicleCapacity ="";
  String verifyVehicleType="";
  String verifyVehiclePrice ="";
  String verifyVehicleBrand ="";
  String verifyVehicleModel ="";

  SharedPreferences user;

  _initSharedPreferences() async{
    user = await SharedPreferences.getInstance();
  }



  @override
  void initState(){
    super.initState();
    _initSharedPreferences();
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
                          controller: vehicleLicensePlate,
                        ),
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: Text(
                          verifyVehicleRegister,
                          style: TextStyle(
                              color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width*0.82,
                        padding: EdgeInsets.all(1),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
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
                          controller: vehicleCapacity,
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
                              vehicleType = newValue;
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
                          keyboardType: TextInputType.number,
                          decoration:InputDecoration(

                            fillColor: Color(0xFFEEEBD3),
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Ingrese el precio del vehiculo",
                            hintStyle: TextStyle(color: Color(0xFF0F4C5C)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color(0xFF0F4C5C),
                                    width: 3
                                )
                            ),
                          ),
                          controller: vehiclePrice,
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
                          controller: vehicleBrand,
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
                          controller: vehicleModel,
                        ),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: (){
                          bool check = Submit();
                          if(check){
                            vehicleRegisterRepository.createVehicle(vehicleRegister);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverSideBarLayout()));
                          }
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

  bool Submit(){
    bool aux = false;
    if(vehicleLicensePlate.text.isNotEmpty && vehicleCapacity.text.isNotEmpty && vehiclePrice.text.isNotEmpty &&
        vehicleBrand.text.isNotEmpty && vehicleModel.text.isNotEmpty ){

      vehicleRegister.vehicleDriverId = user.getInt('id');
      vehicleRegister.vehicleLicensePlate = vehicleLicensePlate.text;
      vehicleRegister.vehicleCapacity = double.parse(vehicleCapacity.text);
      vehicleRegister.vehiclePrice = double.parse(vehiclePrice.text);
      vehicleRegister.vehicleBrand = vehicleBrand.text;
      vehicleRegister.vehicleModel = vehicleModel.text;
      vehicleRegister.vehicleType = vehicleType;
      aux = true;
    }else{
      print("CAMPOS VACIOS");
      aux = false;
    }
    return aux;
  }

}
