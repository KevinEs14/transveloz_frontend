import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/sidebar/driversidebar_layout.dart';


import '../../bloc.navigation_bloc/navigation_bloc.dart';
import '../../color.dart';
import 'dart:math' as math;

class ProfileDriverPageDesign extends StatefulWidget with NavigationStates {
  @override
  _ProfileDriverPageDesignState createState() => _ProfileDriverPageDesignState();
}

class _ProfileDriverPageDesignState extends State<ProfileDriverPageDesign>{
  int driverId;
  DateTime fNacimiento;
  List ListFecha = [1999,01,01];
  Driver driver = Driver();
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
  DriverRepository driverRepository = DriverRepository();
  Size size;
  MostrarDatosDriver()async{
    setState(() {
      driver.driverId=driverId;
      print("Se Muestra el Id: "+driver.driverId.toString());
      fNacimiento = DateTime.parse(driver.birthdate.toString());
      var formatter = new DateFormat("yyyy-MM-dd");
      String formattedDate = formatter.format(fNacimiento);
      ci.text = driver.ci.toString();
      firstName.text = driver.firstname.toString();
      firstSurname.text = driver.firstsurname.toString();
      secondSurname.text = driver.secondsurname.toString();
      birthDate.text = formattedDate;
      phone.text = driver.phone.toString();
      email.text = driver.email.toString();
      password.text = driver.password.toString();
      number.text = driver.number.toString();
      street.text = driver.street.toString();
      zone.text = driver.zone.toString();
      city.text = driver.city.toString();
      country.text = driver.country.toString();
      ListFecha = formattedDate.split("-");
    });
  }
  SharedPreferences driverProfile;
  _initSharedPreferences() async{
    driverProfile = await SharedPreferences.getInstance();
    driverId = driverProfile.getInt("id");
    driver = await driverRepository.obtener_datos_conductor(driver, driverId);
    MostrarDatosDriver();
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
    print("driverId es correcto: "+driver.driverId.toString());
    //var now = new DateTime.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 272,
                decoration: BoxDecoration(
                    color: color9,
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
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        SizedBox(width: 26.0),
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(imperfil)
                              )
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${driver.firstname} ${driver.firstsurname} ${driver.secondsurname}", style: TextStyle(
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
                            Text("${driver.email}", style: TextStyle(
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
                            highlightColor: color9,
                          ),
                          decoration: BoxDecoration(
                            color: color5,
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
                            Text(ListFecha[2].toString(), style: TextStyle(
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
                            Text(ListFecha[1].toString(), style: TextStyle(
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
                            Text(ListFecha[0].toString(), style: TextStyle(
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
                                              driverRepository.updateDriver(driver);
                                              //Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DriverSideBarLayout()));
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
                  Text(driver.ci.toString(), style: TextStyle(
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
                  Text(driver.firstname.toString(), style: TextStyle(
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
                  Text(driver.firstsurname.toString()+" "+driver.secondsurname.toString(), style: TextStyle(
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
                  Text(driver.phone.toString(), style: TextStyle(
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
                  Text(driver.street.toString(), style: TextStyle(
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
                  Text(driver.zone.toString(), style: TextStyle(
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
                  Text(driver.city.toString(), style: TextStyle(
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
                  Text(driver.country.toString(), style: TextStyle(
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
      driver.driverId;
      driver.ci=ci.text;
      driver.firstname=firstName.text;
      driver.firstsurname=firstSurname.text;
      driver.birthdate=birthDate.text;
      driver.phone=phone.text;
      driver.email=email.text;
      driver.password=password.text;
      driver.number=number.text;
      driver.street=street.text;
      driver.zone=zone.text;
      driver.city=city.text;
      driver.country=country.text;
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
