import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/DriverContact.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/repository/url.dart';

class DriverList extends StatefulWidget with NavigationStates {
  @override
  _DriverList createState() => _DriverList();
}
class _DriverList extends State<DriverList> {

  List<DriverContact> data = List<DriverContact>();
  DriverRepository driverRepository = DriverRepository();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
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
                    child: Text("USUARIOS",
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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