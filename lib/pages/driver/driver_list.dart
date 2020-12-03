import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/repository/url.dart';
import 'package:transveloz_frontend/sidebar/sidebar.dart';

class DriverList extends StatefulWidget with NavigationStates {
  @override
  _DriverList createState() => _DriverList();
}
class _DriverList extends State<DriverList> {

  List<DriverContact> data = List<DriverContact>();
  DriverRepository driverRepository = DriverRepository();
  Driver driver = Driver();

  // TextEditingController ci = TextEditingController();
  // TextEditingController firstName = TextEditingController();
  // TextEditingController firstSurname = TextEditingController();
  // TextEditingController secondSurname = TextEditingController();
  // TextEditingController birthDate = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController number = TextEditingController();
  // TextEditingController street = TextEditingController();
  // TextEditingController zone = TextEditingController();
  // TextEditingController city = TextEditingController();
  // TextEditingController country = TextEditingController();

  var ci="";var firstName="";var firstSurname="";var secondSurname=""; var birthDate=""; var phone=""; var email="";var number="";var street="";
  var zone=""; var city=""; var country="";
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _loadList();
  }

  _loadList() async{
    driverRepository.getDriverList().then((value){
      setState(() {
        data.addAll(value);
      });
    });
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: size.height*0.26,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fondoRegistro.jpg'),
                      fit: BoxFit.fill
                  )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.08,),
                  Center(
                    child: Text("CONDUCTORES",
                      style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: size.height*0.04,),
                  Row(
                    children: [
                      Container(
                        width: size.width*0.1
                      ),
                      Container(
                        width: size.width*0.6,
                        padding: EdgeInsets.all(1),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: color3,
                            filled: true,
                            prefixText: "    ",
                            border: InputBorder.none,
                            hintText: "Search hint",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                              borderSide: BorderSide(
                                  color: color3,
                                  width: 3
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(24)),
                            ),
                            prefixIcon: Icon(Icons.search, color: Colors.white, size: 34, ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width*0.05,
                      ),
                      Container(
                        width: size.width*0.2,
                        padding: EdgeInsets.all(1),
                        //alignment: Alignment.bottomRight,
                        //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (conext)=>DriverRegister()));
                          },
                          color: color3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)
                    ),
                    child: Container(
                      color: color4,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 76.0,
                                height: 76.0,
                                child: /*Image(
                                  //image: AssetImage("assets/images/fotoperfil.png"),
                                  image: data[index].pathImage=="nulo"?(AssetImage("assets/images/fotoperfil.png")):/*(NetworkImage(directionUrl+"driver/image/"+data[index].pathImage))*/(AssetImage("assets/images/fondoRegistro.jpg")),
                                  fit: BoxFit.fill,
                                )*/CircleAvatar(
                                  //backgroundColor: Colors.green,
                                  //foregroundColor: Colors.green,
                                  backgroundImage: data[index].pathImage=="nulo"?(AssetImage("assets/images/fotoperfil.png")):(NetworkImage(directionUrl+"v1/driver/image/"+data[index].pathImage)),
                                  //backgroundImage: AssetImage("assets/images/fotoperfil.png"),
                                  //backgroundImage: NetworkImage(directionUrl+"driver/image/"+data[index].pathImage),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3.0),
                                  Row(
                                    children: [
                                      Text("CI: ", style: TextStyle(color: color1,
                                          fontSize: 18.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].ci, style: TextStyle(color: color5,
                                          fontSize: 17.0, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Nombre: ", style: TextStyle(color: color1,
                                          fontSize: 15.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].firstName + " " + data[index].firstSurname, style: TextStyle(color: color5,
                                          fontSize: 15.0),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Compañía:  ", style: TextStyle(color: color1,
                                          fontSize: 16.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].companyName, style: TextStyle(color: color5,
                                          fontSize: 16.0),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width*0.1,
                              ),
                              Container(
                                // alignment: Alignment.bottomRight,
                                //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                                width: size.width*0.2,
                                child: FlatButton(
                                  onPressed: () async{
                                    driver = await driverRepository.getDriver(data[index].driverId);
                                    setState(() {
                                      firstName=driver.firstname;
                                      firstSurname=driver.firstsurname;
                                      secondSurname=driver.secondsurname;
                                      ci=driver.ci;
                                      birthDate="";
                                      for(int i=0;i<10;i++){
                                        birthDate+=driver.birthdate[i];
                                      }
                                      phone=driver.phone;
                                      email=driver.email;
                                      number=driver.number;
                                      street= driver.street;
                                      zone=driver.zone;
                                      city=driver.city;
                                      country=driver.country;
                                    });
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                            title: Center(
                                              child: Text("Información", style: TextStyle(color: color1),),
                                            ),
                                            backgroundColor: color4,
                                            content: SingleChildScrollView(
                                              child: Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: color4
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Nombre: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$firstName"+" "+"$firstSurname"+" "+"$secondSurname",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Ci: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$ci",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Nacimiento: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$birthDate",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Telefono: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$phone",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Email: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$email",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Center(
                                                      child: Text("Dirección ",style: TextStyle(color: color1,fontSize: size.height*0.022),),
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Numero de Casa: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$number",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Calle: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$street",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Zona: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$zone",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Ciudad: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$city",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: size.height*0.01,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("País: ",style: TextStyle(color: color1,fontSize: size.height*0.02),),
                                                        Text("$country",style: TextStyle(color: color3,fontSize: size.height*0.018),),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              FlatButton(
                                                child: Text("Aceptar", style: TextStyle(color: Colors.green, fontSize: 18),),
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                    );
                                  },
                                  color: color1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width*0.05,
                              ),
                              Container(
                                // alignment: Alignment.bottomRight,
                                //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                                width: size.width*0.2,
                                child: FlatButton(
                                  onPressed: () {

                                  },
                                  color: color6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.create,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width*0.05,
                              ),
                              Container(
                                // alignment: Alignment.bottomRight,
                                //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                                width: size.width*0.2,
                                child: FlatButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                            title: Center(
                                              child: Text("Confirmar eliminación", style: TextStyle(color: color1),),
                                            ),
                                            backgroundColor: color4,
                                            actions: [
                                              FlatButton(
                                                child: Text("Aceptar", style: TextStyle(color: color6, fontSize: 18),),
                                                onPressed: ()async{
                                                  bool flag = await driverRepository.deleteDriver(data[index].driverId);
                                                  if(flag){
                                                    print("Eliminado");
                                                    data.clear();
                                                    _loadList();
                                                    Fluttertoast.showToast(
                                                        msg: "Conductor Eliminaddo",
                                                        toastLength: Toast.LENGTH_SHORT,
                                                        gravity: ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: color3,
                                                        textColor: color1,
                                                        fontSize: 16.0
                                                    );
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                              ),
                                              FlatButton(
                                                child: Text("Cancelar", style: TextStyle(color: color7, fontSize: 18),),
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                    );
                                  },
                                  color: color7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //HistoryList(),
          ],
        ),
      ),
    );
  }
}