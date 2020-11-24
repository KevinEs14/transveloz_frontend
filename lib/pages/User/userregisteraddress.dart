
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/models/User.dart';
import 'package:transveloz_frontend/repository/user_repository.dart';
import 'package:transveloz_frontend/sidebar/sidebar_layout.dart';

class UserRegisterAddress extends StatefulWidget with NavigationStates{
  UserRegisterAddress(this.user);
  User user;
  @override
  _UserRegisterAddressState createState() => _UserRegisterAddressState(user);
}
class _UserRegisterAddressState extends State<UserRegisterAddress> {
  _UserRegisterAddressState(this.user);

  User user;
  UserRepository userRepository = UserRepository();

  TextEditingController number = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fondoRegistro.jpg'),
                  fit: BoxFit.fill
              )
          ),
          child: Column(
            children: [
              Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: size.height*0.08),
                    child: Center(
                      child: Text("Dirección de domicilio",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                    ),
                  )
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
                    hintText: "Número de casa",
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
                  controller: number,
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
                    hintText: "Calle",
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
                  controller: street,
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
                    hintText: "Zona",
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
                  controller: zone,
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
                    hintText: "Ciudad",
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
                  controller: city,
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
                    hintText: "País",
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
                  controller: country,
                ),
              ),
              SizedBox(height: size.height*0.018,),
              GestureDetector(
                onTap: (){
                  bool check = Submit();
                  if(check){
                    userRepository.createUser(user);
                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>SideBarLayout()));
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFF0F4C5C),
                  ),
                  child: Center(child: Text("Registrar",style: TextStyle(fontSize:size.width*0.058,color: Colors.white,fontWeight: FontWeight.bold),)),
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
    if(number.text.isNotEmpty && street.text.isNotEmpty && zone.text.isNotEmpty && city.text.isNotEmpty && country.text.isNotEmpty){
      aux = true;
      user.number = number.text;
      user.street = street.text;
      user.zone = zone.text;
      user.city = city.text;
      user.country = country.text;
    }else{
      aux = false;
    }
    return aux;
  }
}
