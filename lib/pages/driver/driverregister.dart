import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/pages/driver/driverregisteraddress.dart';

class DriverRegister extends StatefulWidget with NavigationStates {
  @override
  _DriverRegister createState() => _DriverRegister();
}

class _DriverRegister extends State<DriverRegister>{

  Driver driver = Driver();

  TextEditingController ci = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController firstsurname = TextEditingController();
  TextEditingController secondsurname = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController email = TextEditingController();


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
                height: size.height*1.08,
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
                          child: Text("REGISTRO DE CONDUCTOR",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
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
                        controller: ci,
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
                        controller: firstname,
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
                        controller: firstsurname,
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
                        controller: secondsurname,
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
                          hintText: "Correo electrónico",
                          hintStyle: TextStyle(color: color1),
                        ),
                        style: TextStyle(
                            color: color1
                        ),
                        controller: email,
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
                        controller: birthdate,
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
                        controller: phone,
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
                        controller: password,
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
                        controller: password2,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  GestureDetector(
                    onTap: (){
                      driver = Submit();
                      if(driver != null){
                        Navigator.push(context, MaterialPageRoute(builder: (conext)=>DriverRegisterAddress(driver)));
                      }
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Driver Submit(){
    Driver driver2 = Driver();
    if(ci.text.isNotEmpty && firstname.text.isNotEmpty && firstsurname.text.isNotEmpty && secondsurname.text.isNotEmpty && birthdate.text.isNotEmpty && phone.text.isNotEmpty && password.text.isNotEmpty && password2.text.isNotEmpty && email.text.isNotEmpty){
      if(password.text == password2.text){
        driver2.ci=ci.text;
        driver2.firstname=firstname.text;
        driver2.firstsurname=firstsurname.text;
        driver2.secondsurname=secondsurname.text;
        driver2.birthdate=birthdate.text;
        driver2.phone=phone.text;
        driver2.password=password.text;
        driver2.email=email.text;
        print("Undertaker");
        return driver2;
      }else{
        password.clear();
        password2.clear();
        print("Tiny");
        return null;
      }
    }else{
      print("Mirana");
      return null;
    }
  }

}
