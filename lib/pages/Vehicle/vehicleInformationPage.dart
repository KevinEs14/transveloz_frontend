import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color.dart';
class VehicleInformationPage extends StatefulWidget {
  @override
  _VehicleInformationPageState createState() => _VehicleInformationPageState();
}

class _VehicleInformationPageState extends State<VehicleInformationPage> {
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
                  height: size.height*0.3,
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
                          Text("Pedro",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Capacidad: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("10",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          Text(" toneladas",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Tipo de vehículo: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("Camión",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Marca: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("Toyota",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Modelo del vehículo: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("Corolla",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                          // Text(" Perez",style: TextStyle(color: color3,fontSize: size.height*0.025),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Precio: ",style: TextStyle(color: color1,fontSize: size.height*0.025),),
                          Text("250.89",style: TextStyle(color: color3,fontSize: size.height*0.025),),
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
                        Navigator.pop(context);
                      },
                      color: Color(0xff6FB98E),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
