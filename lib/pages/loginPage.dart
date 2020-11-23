import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/pages/homepage.dart';
//import 'file:///D:/trabajos%20flutter/transveloz/transveloz_frontend/lib/pages/User/userregister.dart';
import 'package:transveloz_frontend/sidebar/usersidebar_layout.dart';
import 'package:transveloz_frontend/sidebar/sidebar_layout.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with NavigationStates {
  Size size;
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
                        hintText: "Nombre de usuario",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
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
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (conext)=>SideBarLayout()));
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
                  child: Center(child: Text("Login",style: TextStyle(fontSize:size.width*0.05,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: size.height*0.01,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (conext)=>UserSideBarLayout()));
                  //Navigator.push(context, MaterialPageRoute(builder: (conext)=>RegisterUser()));

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
            ],
          ),
        ),
      ),
    );
  }
}
