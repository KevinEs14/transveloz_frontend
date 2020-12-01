import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../bloc.navigation_bloc/navigation_bloc.dart';
import '../../color.dart';
import 'dart:math' as math;

class ProfilePageDesign extends StatefulWidget with NavigationStates {
  @override
  _ProfilePageDesignState createState() => _ProfilePageDesignState();
}

class _ProfilePageDesignState extends State<ProfilePageDesign>{

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
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
            Text("6953432", style: TextStyle(
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
            Text("Jorge Luis ", style: TextStyle(
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
            Text("Alejo", style: TextStyle(
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
            Text("57392303", style: TextStyle(
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
            Text("Calle 12", style: TextStyle(
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
            Text("16 de Julio", style: TextStyle(
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
            Text("La Paz", style: TextStyle(
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
            Text("Bolivia", style: TextStyle(
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
    );
  }
}

final String imperfil = "https://cdnmd.lavoz.com.ar/sites/default/files/styles/width_1072/public/nota_periodistica/messi-gol_1606660614.jpg";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size(double.infinity, 275);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
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
                    Text("Gorge Luis Alejo Gutierrez", style: TextStyle(
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
                    Text("jorge@gmail.com", style: TextStyle(
                      color: color2,
                      fontSize: 17,
                    ),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(width: 100.0),
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
                    Text("01", style: TextStyle(
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
                    Text("01", style: TextStyle(
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
                    Text("2020", style: TextStyle(
                      color: color2,
                      fontSize: 28,
                    ),),
                  ],
                ),
                SizedBox(width: 28.0),
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
                                         height: 48,
                                         child: TextField(
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
                                     ],
                                   ),
                                 ),
                              ),
                              actions: [
                                FlatButton(
                                  child: Text("Aceptar", style: TextStyle(color: color1),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("Cancelar"),
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
    );
  }
}
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