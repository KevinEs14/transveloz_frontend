
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/models/User.dart';
import 'package:transveloz_frontend/pages/User/userregisteraddress.dart';
//import 'file:///D:/trabajos%20flutter/transveloz/transveloz_frontend/lib/pages/User/userregisteraddress.dart';
import 'package:transveloz_frontend/sidebar/sidebar_layout.dart';

import '../../color.dart';

class UserRegister extends StatefulWidget with NavigationStates {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}
class _UserRegisterState extends State<UserRegister> {

  User user = User();

  TextEditingController ci = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController firstsurname = TextEditingController();
  TextEditingController secondsurname = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                SizedBox(height: size.height*0.05,),
                Center(
                  child: Text("REGISTRO DE USUARIO",
                    style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Cedula de Identidad",
                      hintStyle: TextStyle(color: color1),
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
                    controller: ci,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Nombres",
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
                    controller: firstname,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Apellido Paterno",
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
                    controller: firstsurname,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Apellido Materno",
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
                    controller: secondsurname,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Fecha de Nacimiento",
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
                    controller: birthdate,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Telf/Celular",
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
                    controller: phone,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Email",
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
                    controller: email,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Password",
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
                    controller: password,
                  ),
                ),
                SizedBox(height: size.height*0.016,),
                Container(
                  width: size.width*0.82,
                  padding: EdgeInsets.all(1),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFEEEBD3),
                      filled: true,
                      prefixText: "    ",
                      border: InputBorder.none,
                      hintText: "Confirmacion de Password",
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
                    controller: confirmpassword,
                  ),
                ),
                SizedBox(height: size.height*0.018,),
                GestureDetector(
                  onTap: (){
                    user  = Submit();
                    if(user != null){
                      Navigator.push(context, MaterialPageRoute(builder: (conext)=>UserRegisterAddress(user)));
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  User Submit(){
    User user2 = User();
    if(ci.text.isNotEmpty && firstname.text.isNotEmpty && firstsurname.text.isNotEmpty && secondsurname.text.isNotEmpty && birthdate.text.isNotEmpty && phone.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty && confirmpassword.text.isNotEmpty){
      if(password.text == confirmpassword.text){
        user2.ci=ci.text;
        user2.firstname=firstname.text;
        user2.firstsurname=firstsurname.text;
        user2.secondsurname=secondsurname.text;
        user2.birthdate=birthdate.text;
        user2.phone=phone.text;
        user2.email=email.text;
        user2.password=password.text;
        print("Ingreso de datos");
        return user2;
      }else{
        password.clear();
        confirmpassword.clear();
        print("Contraseña no iguales");
        return null;
      }
    }else{
      print("Campos Vacios");
      return null;
    }
  }
}