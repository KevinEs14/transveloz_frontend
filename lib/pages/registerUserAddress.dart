
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/pages/registerUser.dart';

class RegisterUserAddress extends StatefulWidget{
  @override
  _RegisterUserAddressState createState() => _RegisterUserAddressState();
}
class _RegisterUserAddressState extends State<RegisterUserAddress> with NavigationStates {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        /*
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondoRegistro.jpg'),
                  fit: BoxFit.fill
              )
          ),

         */
          child: Column(
            children: [
              SizedBox(height: size.height*0.08,),
              Text("Dirección de Domicilio",
                  style: TextStyle(color: Color(0xFF0F4C5C),fontSize: size.height*0.025,fontWeight: FontWeight.normal),
              ),
              SizedBox(height: size.height*0.02,),
              Container(
                width: size.width*0.82,
                padding: EdgeInsets.all(1),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFEEEBD3),
                    filled: true,
                    prefixText: "    ",
                    border: InputBorder.none,
                    hintText: "Numero de Casa",
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
                    hintText: "Pais",
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
                ),
              ),
              SizedBox(height: size.height*0.018,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (conext)=>RegisterUser()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF0F4C5C),
                  ),
                  child: Center(child: Text("Registrarse",style: TextStyle(fontSize:size.width*0.058,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
