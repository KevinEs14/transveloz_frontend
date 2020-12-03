import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/models/CardCollection.dart';
import 'package:transveloz_frontend/models/SingleDriver.dart';
import 'package:transveloz_frontend/repository/card_collection_repository.dart';
import 'package:transveloz_frontend/repository/singledriver_repository.dart';

import '../../color.dart';
class VehicleInformationPage extends StatefulWidget {

  int vehicleId;
  VehicleInformationPage(this.vehicleId);
  @override
  _VehicleInformationPageState createState() => _VehicleInformationPageState(vehicleId);
}

class _VehicleInformationPageState extends State<VehicleInformationPage> {
  int vehicleId;

  _VehicleInformationPageState(this.vehicleId);

  // TextEditingController idVehicle=new TextEditingController();
  SingleDriver singleDriver=SingleDriver();
  SingleDriver singleDriver2=SingleDriver();
  SingleDriver singleDriver3=SingleDriver();
  CardCollection cardCollection=CardCollection();
  CardCollection _value=CardCollection();
  List<CardCollection> cardCollection2=List<CardCollection>();
  List<CardCollection> listaCard=List<CardCollection>();
  var estado="";var nombre="";var apellido="";var capacidad=""; var tipo=""; var marca=""; var modelo="";var precio="";
  SingleDriverRepository vehiclerepository=SingleDriverRepository();
  CardCollectionRepository cardCollectionRepository=CardCollectionRepository();
  Size size;
  var userId="";
  // singleDriver.vehicleId=vehicleId;
  ObtenerDatos()async{
    singleDriver.vehicleId=vehicleId;
    singleDriver3=await vehiclerepository.obtainVehicle(singleDriver);
    cardCollection.userId=int.parse(userId);
    cardCollection2=await cardCollectionRepository.obtainListCard(cardCollection);
    // print(cardCollection2[0].accountNumber);
    // print(cardCollection2[1].accountNumber);
    setState(()  {

      singleDriver2=singleDriver3;
      nombre=singleDriver2.personFirstName.toString();
      apellido=singleDriver2.personFirstSurname.toString();
      capacidad=singleDriver2.vehicleCapacity.toString();
      tipo=singleDriver2.vehicleType.toString();
      marca=singleDriver2.vehicleBrand.toString();
      modelo=singleDriver2.vehicleModel.toString();
      estado=singleDriver2.vehicleStatus.toString();
      precio=singleDriver2.vehiclePrice.toString();
      // userId=user.getInt("id").toString();
    });
  }
  SharedPreferences user;
  _initSharedPreferences() async{
    user = await SharedPreferences.getInstance();
    userId=user.getInt("id").toString();
    // print("Sidebar");
    // print(user.getInt("id").toString());
  }
 @override
 void initState() {
   ObtenerDatos();
   _initSharedPreferences();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat("yyyy-MM-dd");
    String formattedDate = formatter.format(now);
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
                SizedBox(height: size.height*0.1,),
                Center(
                  child: Container(
                    height: size.height*0.3,
                    child: Icon(Icons.person_pin, size: size.height*0.2,color: color2,),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  // color: color4,
                  height: size.height*0.35,
                  width: size.width*0.85,
                  decoration: BoxDecoration(
                      color: color4,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          blurRadius: 20,
                          offset: Offset(0,10),
                        )
                      ]
                  ),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Text("Nombre: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$nombre",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text(" ",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text("$apellido",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Capacidad: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$capacidad",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text(" ton",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Tipo de vehículo: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$tipo",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Marca: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$marca",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Modelo del vehículo: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$modelo",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Estado: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$estado",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Precio: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("$precio",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text(" Bs",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:size.height*0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: size.width*0.2,),
                    RaisedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      color: color1,
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        // side: BorderSide(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_rounded, color: color2,),
                          Text("Volver",style: TextStyle(color: color2,fontSize: size.height*0.03),),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width*0.15,),
                    RaisedButton(
                      onPressed: (){
                        if(cardCollection2.isEmpty){
                          showDialog(context: context,barrierDismissible: false,builder: (context){
                            return AlertDialog(
                              content: SingleChildScrollView(
                                  child:ListBody(
                                    children: [
                                      Text('Necesitas registrar una tarjeta '),
                                      TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFEEEBD3),
                                          filled: true,
                                          prefixText: "    ",
                                          border: InputBorder.none,
                                          hintText: "Numero de cuenta",
                                          hintStyle: TextStyle(color: color1.withOpacity(0.7)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              borderSide: BorderSide(
                                                  color: color2,
                                                  width: 5
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFEEEBD3),
                                          filled: true,
                                          prefixText: "    ",
                                          border: InputBorder.none,
                                          hintText: "Pin",
                                          hintStyle: TextStyle(color: color1.withOpacity(0.7)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              borderSide: BorderSide(
                                                  color: color2,
                                                  width: 5
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFEEEBD3),
                                          filled: true,
                                          prefixText: "    ",
                                          border: InputBorder.none,
                                          hintText: "Banco",
                                          hintStyle: TextStyle(color: color1.withOpacity(0.7)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              borderSide: BorderSide(
                                                  color: color2,
                                                  width: 5
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFEEEBD3),
                                          filled: true,
                                          prefixText: "    ",
                                          border: InputBorder.none,
                                          hintText: "Tipo de cuenta",
                                          hintStyle: TextStyle(color: color1.withOpacity(0.7)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              borderSide: BorderSide(
                                                  color: color2,
                                                  width: 5
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xFFEEEBD3),
                                          filled: true,
                                          prefixText: "    ",
                                          border: InputBorder.none,
                                          hintText: "Codigo CVV",
                                          hintStyle: TextStyle(color: color1.withOpacity(0.7)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(24)),
                                              borderSide: BorderSide(
                                                  color: color2,
                                                  width: 5
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                              ),
                              actions: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                                          height: size.height*0.05,
                                          width: size.width*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff121212),color6,
                                                  Color(0xff121212)]
                                            ),
                                          ),
                                          child: Center(child: Text("Agregar",style: TextStyle(fontSize:size.width*0.04,color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                      SizedBox(width: size.width*0.04,),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                                          height: size.height*0.05,
                                          width: size.width*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff121212),color1,
                                                  Color(0xff121212)]
                                            ),
                                          ),
                                          child: Center(child: Text("Volver",style: TextStyle(fontSize:size.width*0.04,color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }
                          );
                        }else{
                          showDialog(context: context,barrierDismissible: false,builder: (context){
                            return AlertDialog(
                              content: SingleChildScrollView(
                                  child:ListBody(
                                    children: [
                                      Text("¿Está seguro de realizar el pago por $precio bs?"),
                                      Container(
                                        padding: EdgeInsets.only(left:16,right: 16),
                                        decoration: BoxDecoration(
                                          color: color4,
                                          border: Border.all(color: color4, width: 2.0),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: DropdownButton(

                                          dropdownColor: color4,
                                          elevation: 5,
                                          value: _value.accountNumber,
                                          iconEnabledColor: color1,

                                          hint: Text("Seleccione un opción", style: TextStyle(color: color1),),
                                          onChanged: (newValue){
                                            setState(() {
                                              _value = cardCollection2.firstWhere((element) {
                                                if(element.accountNumber==newValue){
                                                  return true;
                                                }
                                                else{
                                                  return false;
                                                }
                                              });

                                            });
                                            print(_value.accountNumber);
                                          },
                                          items: cardCollection2.map((newValue){
                                            return DropdownMenuItem(
                                              value: newValue.accountNumber,

                                              child: Text(newValue.accountNumber, style: TextStyle(color: color1)),);
                                          }).toList(),
                                        ),
                                      ),

                                    ],
                                  )
                              ),
                              actions: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                                          height: size.height*0.05,
                                          width: size.width*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff121212),color6,
                                                  Color(0xff121212)]
                                            ),
                                          ),
                                          child: Center(child: Text("Pagar",style: TextStyle(fontSize:size.width*0.04,color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                      SizedBox(width: size.width*0.04,),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.only(left: size.width*0.2,right: size.width*0.2),
                                          height: size.height*0.05,
                                          width: size.width*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff121212),color1,
                                                  Color(0xff121212)]
                                            ),
                                          ),
                                          child: Center(child: Text("Volver",style: TextStyle(fontSize:size.width*0.04,color: Colors.white,fontWeight: FontWeight.bold),)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }
                          );
                        }
                        // Navigator.pop(context);
                      },
                      color: color6,
                      padding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        // side: BorderSide(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money_rounded, color: color2,),
                          Text("Pagar",style: TextStyle(color: color2,fontSize: size.height*0.03),),
                        ],
                      ),
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 60,
                //       width: size.width*0.2,
                //       padding: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           color: color4,
                //           borderRadius: BorderRadius.circular(20),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.6),
                //               blurRadius: 20,
                //               offset: Offset(0,10),
                //             )
                //           ]
                //       ),
                //       child: TextField(
                //         decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "IdVehicle",
                //           hintStyle: TextStyle(color: color1),
                //         ),
                //         style: TextStyle(
                //             color: color1
                //         ),
                //         controller: idVehicle,
                //       ),
                //     ),
                //     SizedBox(width: 20,),
                //     RaisedButton(
                //         onPressed: ()async{
                //           if(idVehicle.text.isNotEmpty){
                //             singleDriver.vehicleId=int.parse(idVehicle.text);
                //             SingleDriver singleDriver2= await vehiclerepository.obtainVehicle(singleDriver) ;
                //             if(singleDriver2!=null){
                //               print(singleDriver2);
                //               setState(() {
                //                 nombre=singleDriver2.personFirstName.toString();
                //                 apellido=singleDriver2.personFirstSurname.toString();
                //                 capacidad=singleDriver2.vehicleCapacity.toString();
                //                 tipo=singleDriver2.vehicleType.toString();
                //                 marca=singleDriver2.vehicleBrand.toString();
                //                 modelo=singleDriver2.vehicleModel.toString();
                //                 estado=singleDriver2.vehicleStatus.toString();
                //                 precio=singleDriver2.vehiclePrice.toString();
                //               });
                //             }else{
                //               setState(() {
                //                 nombre="";
                //                 apellido="";
                //                 capacidad="";
                //                 tipo="";
                //                 marca="";
                //                 modelo="";
                //                 estado="";
                //                 precio="";
                //               });
                //             }
                //           }
                //         },
                //         child: Text("obtener"),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class AlertPago extends StatefulWidget {
  @override
  _AlertPagoState createState() => _AlertPagoState();
}

class _AlertPagoState extends State<AlertPago> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

