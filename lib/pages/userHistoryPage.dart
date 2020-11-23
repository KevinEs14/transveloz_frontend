import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'file:///D:/trabajos%20flutter/transveloz/transveloz_frontend/lib/pages/User/userregister.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../color.dart';

class UserHistoryPage extends StatefulWidget with NavigationStates {
  @override
  _UserHistoryPageState createState() => _UserHistoryPageState();
}
class _UserHistoryPageState extends State<UserHistoryPage> {
  Size size;
  List nam = ["Jorge","Juan Carlos","Antonio","Kebin","Joel","Jorge","Juan Carlos","Antonio","Kebin","Joel"];
  List des = ["Programador","Administrador","Programador","Analista","Registrador","Programador","Administrador","Programador","Analista","Registrador"];
  List pres = ["123.53","2343.22","212.543","212.21","423.23","434.56","645.53","323.34","323.98","321.33"];
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
                itemCount: nam.length,
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
                                  backgroundImage: NetworkImage('assets/images/fondoRegistro.jpg'),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3.0),
                                  Row(
                                    children: [
                                      Text("Conductor:  ", style: TextStyle(color: color1,
                                          fontSize: 18.0, fontWeight: FontWeight.bold),),
                                      Text(nam[index], style: TextStyle(color: color5,
                                          fontSize: 17.0, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Tipo:   ", style: TextStyle(color: color1,
                                          fontSize: 16.0, fontWeight: FontWeight.bold),),
                                      Text(des[index], style: TextStyle(color: color5,
                                          fontSize: 16.0),),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      Text("Precio:   ", style: TextStyle(color: color1,
                                          fontSize: 16.0, fontWeight: FontWeight.bold),),
                                      Text(pres[index]+" Bs.", style: TextStyle(color: color5,
                                          fontSize: 16.0),),
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
                              onPressed: () {},
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