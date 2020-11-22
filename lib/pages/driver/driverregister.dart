import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/pages/driver/driverregisteraddress.dart';

class DriverRegister extends StatefulWidget with NavigationStates {
  @override
  _DriverRegister createState() => _DriverRegister();
}

class _DriverRegister extends State<DriverRegister>{
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
                  Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: size.height*0.08),
                        child: Center(
                          child: Text("REGISTRO DE CONDUCTOR",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
                      )
                  ),
                  SizedBox(height: size.height*0.05,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: color4)),
                        color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cedula de Identidad",
                            hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nombres",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Apellido Paterno",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Apellido Materno",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Fecha de Nacimiento",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Celular",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )
                        ]
                    ),
                    child: Container(
                      height: 60,
                      width: size.width*0.8,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: color4)),
                          color: color4
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirmacion de Password",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                          color: color1
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (conext)=>DriverRegisterAddress()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: color1
                      ),
                      child: Center(child: Text("Siguiente  ➜",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
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
}
