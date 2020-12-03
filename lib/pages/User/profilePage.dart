import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/models/User.dart';
import 'package:transveloz_frontend/repository/user_repository.dart';
import 'package:transveloz_frontend/sidebar/usersidebar_layout.dart';

import '../../bloc.navigation_bloc/navigation_bloc.dart';
import '../../color.dart';
import 'dart:math' as math;

class ProfilePageDesign extends StatefulWidget with NavigationStates {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign>{

  int userId;
  DateTime fechaNacimiento;
  List fechaList = [2020,01,01];
  User user = User();
  TextEditingController ci = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController firstSurname = TextEditingController();
  TextEditingController secondSurname = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  UserRepository userRepository = UserRepository();
  Size size;
  MostrarDatosUsuario()async{
    setState(() {
      user.userId=userId;
      print("Se Muestra el Id: "+user.userId.toString());
      fechaNacimiento = DateTime.parse(user.birthdate.toString());
      var formatter = new DateFormat("yyyy-MM-dd");
      String formattedDate = formatter.format(fechaNacimiento);
      ci.text = user.ci.toString();
      firstName.text = user.firstname.toString();
      firstSurname.text = user.firstsurname.toString();
      secondSurname.text = user.secondsurname.toString();
      birthDate.text = formattedDate;
      phone.text = user.phone.toString();
      email.text = user.email.toString();
      password.text = user.password.toString();
      number.text = user.number.toString();
      street.text = user.street.toString();
      zone.text = user.zone.toString();
      city.text = user.city.toString();
      country.text = user.country.toString();
      fechaList = formattedDate.split("-");
    });
  }

  SharedPreferences userProfile;
  _initSharedPreferences() async{
    userProfile = await SharedPreferences.getInstance();
    userId = userProfile.getInt("id");
    user = await userRepository.obtener_datos_usuario(user, userId);
    MostrarDatosUsuario();
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
    print("Sidebar");

  }

  @override
  Widget build(BuildContext context) {
  print("EL Id user es correcot: "+user.userId.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 276,
                decoration: BoxDecoration(
                    color: color1,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.teal,
                          blurRadius: 20,
                          offset: Offset(0, 0)
                      )
                    ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 35.0),
                    Row(
                      children: [
                        SizedBox(width: 28.0),
                        Container(
                          width: 65,
                          height: 68,
                          child: CircleAvatar(
                            backgroundColor: color5,
                            foregroundColor: color5,
                            backgroundImage: user.picture==null?(AssetImage("assets/images/fotoperfil.png")):(NetworkImage(user.picture.toString())),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${user.firstname} ${user.firstsurname} ${user.secondsurname}", style: TextStyle(
                                color: color2,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: color5,
                                    offset: Offset(3,4),
                                    blurRadius: 4,
                                  ),
                                ]
                            ),),
                            SizedBox(height: 2.0),
                            Text("${user.email}", style: TextStyle(
                              color: color2,
                              fontSize: 17,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 30.0),
                        Container(
                          width: 60.0,
                          height: 25.0,
                          //color: color5,
                          child: FlatButton(
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: color2,
                              ),
                            highlightColor: color1,
                          ),
                          decoration: BoxDecoration(
                            color: color9,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        SizedBox(width: 28.0),
                        Text("Fecha de Nacimiento:", style: TextStyle(
                            color: color2,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            shadows: [
                              Shadow(
                                color: color5,
                                offset: Offset(3,4),
                                blurRadius: 4,
                              ),
                            ]
                        ),),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 95.0),
                        Column(
                          children: [
                            Text("Dia", style: TextStyle(
                                color: color2,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    color: color5,
                                    offset: Offset(3,4),
                                    blurRadius: 4,
                                  ),
                                ]
                            ),),
                            Text(fechaList[2].toString(), style: TextStyle(
                              color: color2,
                              fontSize: 28,
                            ),),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: [
                            Text("Mes", style: TextStyle(
                                color: color2,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    color: color5,
                                    offset: Offset(3,4),
                                    blurRadius: 4,
                                  ),
                                ]
                            ),),
                            Text(fechaList[1].toString(), style: TextStyle(
                              color: color2,
                              fontSize: 28,
                            ),),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: [
                            Text("Año", style: TextStyle(
                                color: color2,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    color: color5,
                                    offset: Offset(3,4),
                                    blurRadius: 4,
                                  ),
                                ]
                            ),),
                            Text(fechaList[0].toString(), style: TextStyle(
                              color: color2,
                              fontSize: 28,
                            ),),
                          ],
                        ),
                        SizedBox(width: 58.0),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          angle: (math.pi*0.045),
                          child: FlatButton(
                            color: color2,
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Center(
                                        child: Text("Actualizar Perfil"),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          width: 300,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: ci,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "CI",
                                                    labelText: "CI",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: firstName,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Nombre",
                                                    labelText: "Nombre",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6.0),
                                              Container(
                                                child: Text("Apellidos:", style: TextStyle(fontStyle: FontStyle.italic,),),
                                              ),
                                              SizedBox(height: 6.0),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 130,
                                                    height: 48,
                                                    child: TextField(
                                                      controller: firstSurname,
                                                      cursorColor: color1,
                                                      decoration: InputDecoration(
                                                        hintText: "Ap. Paterno",
                                                        labelText: "Ap. Paterno",
                                                        labelStyle: TextStyle(color: color1, fontSize: 16),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                                            borderSide: BorderSide(
                                                                color: color1,
                                                                width: 2
                                                            )
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.0),
                                                  Container(
                                                    width: 130,
                                                    height: 48,
                                                    child: TextField(
                                                      controller: secondSurname,
                                                      cursorColor: color1,
                                                      decoration: InputDecoration(
                                                        hintText: "Ap. Materno",
                                                        labelText: "Ap. Materno",
                                                        labelStyle: TextStyle(color: color1, fontSize: 16),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                                            borderSide: BorderSide(
                                                                color: color1,
                                                                width: 2
                                                            )
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                //height: 48,
                                                child: TextField(
                                                  controller: birthDate,
                                                  cursorColor: color1,
                                                  keyboardType: TextInputType.datetime,
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(Icons.date_range_sharp, color: color5,),
                                                    hintText: "yyyy-mm-dd",
                                                    labelText: "Fecha de Nacimiento",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: phone,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Celular",
                                                    labelText: "Celular",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Direccion",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                                ],
                                              ),
                                              SizedBox(height: 5.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: number,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Nro Puerta",
                                                    labelText: "Nro Puerta",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: street,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Calle",
                                                    labelText: "Calle",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: zone,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Zona",
                                                    labelText: "Zona",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: city,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Ciudad",
                                                    labelText: "Ciudad",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: country,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Pais",
                                                    labelText: "Pais",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("Datos de Ingreso",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                                                ],
                                              ),
                                              SizedBox(height: 5.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: email,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Email",
                                                    labelText: "Email",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 9.0),
                                              Container(
                                                width: 290,
                                                height: 48,
                                                child: TextField(
                                                  controller: password,
                                                  cursorColor: color1,
                                                  decoration: InputDecoration(
                                                    hintText: "Password",
                                                    labelText: "Password",
                                                    labelStyle: TextStyle(color: color1, fontSize: 16),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(7)),
                                                        borderSide: BorderSide(
                                                            color: color1,
                                                            width: 2
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: Text("Aceptar", style: TextStyle(color: color1, fontSize: 18),),
                                          onPressed: (){
                                            bool check = Submit();
                                            if(check){
                                              userRepository.updateUser(user);
                                              //Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserSideBarLayout()));
                                              print("Se Guardo los datos ");
                                            }else{
                                              print("No Se Guardo los datos ");
                                            }
                                          },
                                        ),
                                        FlatButton(
                                          child: Text("Cancelar", style: TextStyle(color: Colors.red, fontSize: 18),),
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Editar Perfil", style: TextStyle(
                              color: color5,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CI", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.ci.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Nombre", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.firstname.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Apellido", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.firstsurname.toString()+" "+user.secondsurname.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Celular", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.phone.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 20.0),
                  Text("Direccion", style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.7,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  Container(
                    width: 80,
                    height: 1,
                    color: color5,
                  ),
                  SizedBox(height: 10.0),
                  Text("Calle", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.street.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Zona", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.zone.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Ciudad", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.city.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                  SizedBox(height: 10.0),
                  Text("Pais", style: TextStyle(
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.3,0.5),
                          blurRadius: 1,
                        ),
                      ]
                  ),),
                  SizedBox(height: 3.0),
                  Text(user.country.toString(), style: TextStyle(
                      color: color5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                          color: color5,
                          offset: Offset(0.5,0.5),
                          blurRadius: 0,
                        ),
                      ]
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
  bool Submit(){
    bool aux = false;
    if(ci.text.isNotEmpty && firstName.text.isNotEmpty && firstSurname.text.isNotEmpty && secondSurname.text.isNotEmpty && birthDate.text.isNotEmpty && email.text.isNotEmpty && phone.text.isNotEmpty && street.text.isNotEmpty && zone.text.isNotEmpty && city.text.isNotEmpty && country.text.isNotEmpty){
    //if(firstName.text.isNotEmpty){
      aux = true;
      user.userId;
      user.ci=ci.text;
      user.firstname=firstName.text;
      user.firstsurname=firstSurname.text;
      user.birthdate=birthDate.text;
      user.phone=phone.text;
      user.email=email.text;
      user.password=password.text;
      user.number=number.text;
      user.street=street.text;
      user.zone=zone.text;
      user.city=city.text;
      user.country=country.text;
    }else{
      aux = false;
    }
    return aux;
  }
}

final String imperfil = "https://cdnmd.lavoz.com.ar/sites/default/files/styles/width_1072/public/nota_periodistica/messi-gol_1606660614.jpg";

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-60);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
