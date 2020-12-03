import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/models/UserHistoryPayment.dart';
import 'package:transveloz_frontend/repository/user_repository.dart';
import 'package:transveloz_frontend/repository/userhistory_repository.dart';
import '../../color.dart';

class UserHistoryPage extends StatefulWidget with NavigationStates {
  @override
  _UserHistoryPageState createState() => _UserHistoryPageState();
}
class _UserHistoryPageState extends State<UserHistoryPage> {
  int user_id;
  SharedPreferences user;
  List<UserHistoryPayment> data = List<UserHistoryPayment>();
  UserRepository userRepository = UserRepository();

  _initSharedPreferences() async{
    user = await SharedPreferences.getInstance();
    print("Sidebar");
    print(user.getInt("id").toString());
    user_id = user.getInt("id");
    userRepository.tomar_datos(user_id).then((value){
      setState(() {
        data.addAll(value);
      });
    });
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
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
                    child: Text("HISTORIAL DEL USUARIO",
                      style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: size.height*0.04,),
                  Container(
                    width: size.width*0.78,
                    padding: EdgeInsets.all(1),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: color3,
                        filled: true,
                        prefixText: "    ",
                        border: InputBorder.none,
                        hintText: "Search hint",
                        hintStyle: TextStyle(color: color5),
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
                        prefixIcon: Icon(Icons.search, color: Colors.white, size: 34,),
                      ),
                    ),
                  ),
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
                                child: CircleAvatar(
                                  //backgroundColor: Colors.green,
                                  //foregroundColor: Colors.green,
                                  backgroundImage: data[index].driverPicture==null?(AssetImage("assets/images/fotoperfil.png")):(NetworkImage(data[index].driverPicture)),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3.0),
                                  Row(
                                    children: [
                                      Text("Conductor: ", style: TextStyle(color: color1,
                                          fontSize: 17.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].driverFirstName, style: TextStyle(color: color5,
                                          fontSize: 15.0, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Estado:  ", style: TextStyle(color: color1,
                                          fontSize: 16.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].paymentStatus, style: TextStyle(color: color5,
                                          fontSize: 16.0,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Pago de Monto: ", style: TextStyle(color: color1,
                                          fontSize: 15.0, fontWeight: FontWeight.bold),),
                                      Text(data[index].amount.toString()+" Bs.", style: TextStyle(color: color5,
                                          fontSize: 15.0,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                            child: FlatButton(
                              onPressed: () {
                                print("Los Datos de es "+data[index].datePayment);
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Center(
                                        child: Text("Resumen de Datos"),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 1.0),
                                              Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: color1,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15.0),
                                                    bottomLeft: Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("  Conductor",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: color2),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 8.0,top: 6.0,bottom: 2.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: color1,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 55.0,
                                                      height: 55.0,
                                                      child: CircleAvatar(
                                                        //backgroundColor: Colors.green,
                                                        //foregroundColor: Colors.green,
                                                        backgroundImage: data[index].driverPicture==null?(AssetImage("assets/images/fotoperfil.png")):(NetworkImage(data[index].driverPicture)),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.0),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 3.0),
                                                        Row(
                                                          children: [
                                                            Text(data[index].driverFirstName, style: TextStyle(color: color5,
                                                                fontSize: 18.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                          ],
                                                        ),
                                                        SizedBox(height: 8.0),
                                                        Row(
                                                          children: [
                                                            Text(data[index].driverFirstSurname+" "+data[index].driverSecondSurname, style: TextStyle(color: color5,
                                                                fontSize: 16.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                          ],
                                                        ),
                                                        SizedBox(height: 8.0),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Container(
                                                width: 155,
                                                decoration: BoxDecoration(
                                                  color: color1,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15.0),
                                                    bottomLeft: Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("  Dirección de Envío",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: color2),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 15.0,top: 6.0,bottom: 2.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: color1,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Calle:    ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].startStreet, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Zona:    ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].startZone, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Ciudad: ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].startCity, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Pais:     ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].startCountry, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.0),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Container(
                                                width: 168,
                                                decoration: BoxDecoration(
                                                  color: color1,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15.0),
                                                    bottomLeft: Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("  Dirección de Entrega",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: color2),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 15.0,top: 6.0,bottom: 2.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: color1,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Calle:    ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].deliveryStreet, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Zona:    ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].deliveryZone, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Ciudad: ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].deliveryCity, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Pais:     ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].deliveryCountry, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.0),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Container(
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  color: color1,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15.0),
                                                    bottomLeft: Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("  Datos del Pago",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: color2),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 15.0,top: 6.0,bottom: 2.0),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: color1,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Monto:    ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].amount.toString()+" Bs.", style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 3.0),
                                                    Row(
                                                      children: [
                                                        Text("Fecha de Pago: ", style: TextStyle(color: color1,
                                                            fontSize: 16.0, fontWeight: FontWeight.bold),),
                                                        Text(data[index].datePayment, style: TextStyle(color: color5,
                                                            fontSize: 15.0, fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.0),
                                                  ],
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
                              child: Text("   Ver  ➜  ", style: TextStyle(color: color2, fontSize: 20.0),),
                            ),
                          ),
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

class HistoryList extends StatefulWidget {
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {

  List nam = ["Jorge","Juan Carlos","Antonio","Kebin","Joel"];
  List des = ["Programador","Administrador","Programador","Analista","Registrador"];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 55.0,
                          height: 55.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.green,
                            backgroundImage: NetworkImage('assets/images/clock.png'),
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nam[index], style: TextStyle(color: Colors.black,
                                fontSize: 18.0, fontWeight: FontWeight.bold),),
                            SizedBox(height: 5.0),
                            Text(des[index], style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.red[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("Ver  ➜", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}