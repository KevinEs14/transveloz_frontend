import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/LogIn.dart';
import 'package:transveloz_frontend/pages/homepage.dart';
import 'package:transveloz_frontend/repository/administrator_repository.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/repository/user_repository.dart';
import 'package:transveloz_frontend/sidebar/driversidebar_layout.dart';
import 'package:transveloz_frontend/sidebar/usersidebar_layout.dart';
import 'package:transveloz_frontend/sidebar/sidebar_layout.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with NavigationStates {
  Size size;

  SharedPreferences user;

  _initSharedPreferences() async{
    user = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List<LogIn> list = List();

  AdministratorRepository administratorRepository = AdministratorRepository();
  DriverRepository driverRepository = DriverRepository();
  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height*0.4,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fondoRegistro.jpg'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Container(
                        width: 80,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/light-1.png'),
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      top: 0,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png'),
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      child: Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/clock.png'),
                            )
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: size.height*0.28),
                          child: Center(
                            child: Text("TransVeloz",style: TextStyle(color: Colors.white,fontSize: size.height*0.08,fontWeight: FontWeight.bold),),
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height*0.1,),
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
                    // border: Border(bottom: BorderSide(color: Colors.grey))
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                    controller: email,
                  ),
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
                  width: size.width*0.8,
                  // height: 60,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    // border: Border(bottom: BorderSide(color: Colors.grey))
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                    controller: password,
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: () async{
                  list = await administratorRepository.getAdmiLogList();
                  //Navigator.push(context, MaterialPageRoute(builder: (conext)=>SideBarLayout()));
                  bool flag = await Confirm();
                  if(flag){
                    Fluttertoast.showToast(
                        msg: "Bienvenido",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                    print("Logueado con "+user.getInt('id').toString());
                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>SideBarLayout()));
                  }else{
                    Fluttertoast.showToast(
                        msg: "No encontrado",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff121212),Color(0xff99091A),
                          Color(0xff121212)]
                    ),
                  ),
                  child: Center(child: Text("Administrator",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              GestureDetector(
                onTap: ()async{
                  list = await userRepository.getUserLogList();
                  bool flag = await Confirm();
                  if(flag){
                    Fluttertoast.showToast(
                        msg: "Bienvenido",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                    print("Logueado con "+user.getInt('id').toString());
                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>UserSideBarLayout()));
                  }else{
                    Fluttertoast.showToast(
                        msg: "No encontrado",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff121212),Color(0xff99091A),
                          Color(0xff121212)]
                    ),
                  ),
                  child: Center(child: Text("User",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              GestureDetector(
                onTap: () async{

                  list = await driverRepository.getDriverLogList();
                  bool flag = await Confirm();
                  if(flag){
                    Fluttertoast.showToast(
                        msg: "Bienvenido",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                    print("Logueado con "+user.getInt('id').toString());
                    Navigator.push(context, MaterialPageRoute(builder: (conext)=>DriverSideBarLayout()));
                  }else{
                    Fluttertoast.showToast(
                        msg: "No encontrado",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: color3,
                        textColor: color1,
                        fontSize: 16.0
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff121212),Color(0xff99091A),
                          Color(0xff121212)]
                    ),
                  ),
                  child: Center(child: Text("Driver",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> Confirm() async{
    int length = list.length;
    print(length);
    bool compare = false;
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      for(int i=0;i<length;i++){
        if(list[i].email==email.text && list[i].password==password.text){
          print(list[i]);
          user.setInt('id', list[i].id);
          compare = true;
          break;
        }
      }
    }else{
      Fluttertoast.showToast(
          msg: "Llene todos los campos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: color3,
          textColor: color1,
          fontSize: 16.0
      );
    }
    return compare;
  }
}
