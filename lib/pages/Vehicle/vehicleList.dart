import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart' as Col;
import 'package:flutter/cupertino.dart';
import 'package:transveloz_frontend/pages/driver/driverregisteraddress.dart';
import 'vehicleConstants.dart';
class VehicleList extends StatefulWidget with NavigationStates{
  @override
  _VehicleList createState() => _VehicleList();


}

class _VehicleList extends State<VehicleList>{
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  Size size;
  String _nameFilter="SELECCIONAR FILTRO";
  List<String>_filterList=[
    "SELECCIONAR FILTRO",
    "ORDENAR POR MARCA",
    "ORDENAR POR COMPAÑIA",
    "ORDENAR POR TIPO VEHICULO",
    "ORDENAR POR CAPACIDAD"];
  List<Widget> itemsData = [];

  int sizeList=5;

  void getPostsData() {
    List<dynamic> responseList = VEHICLE_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Col.color4, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "\ ${post["vehicleType"]} - ${post["vehicleBrand"]} ${post["vehicleModel"]}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]
                ),

                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/${post["images"]}",
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "\ Conductor: ${post["personFirstName"]} ${post["personFirstSurname"]}",
                          style: const TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        Text(
                          "\ PLACA: ${post["vehicleLicensePlate"]}",
                          style: const TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        Text(
                          "\ PRECIO: \$ ${post["vehiclePrice"]}",
                          style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (conext)=>DriverRegisterAddress()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 1,right: 1),
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Col.color1
                            ),
                            child: Center(
                                child: Text("VER MAS",style: TextStyle(fontSize:15,color: Colors.white,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),

          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Container(
          height: size.height,
          child: ListView(
            children:[
          Container(
          height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fondoRegistro.jpg'),
                    fit: BoxFit.fill
                )
            ),
            child: Column(
                children: <Widget>[
                  Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: size.height*0.04),
                        child: Center(
                          child: Text("BUSQUEDA DE VEHICULOS",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.only(left:16,right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(

                        dropdownColor: Col.color4,
                        elevation: 5,
                        iconEnabledColor: Colors.white,
                        hint: Text(_nameFilter, style: TextStyle(color: Colors.white),),
                        onChanged: (newValue){
                          setState(() {
                            _nameFilter = newValue;
                          });
                        },
                        items: _filterList.map((newValue){
                          return DropdownMenuItem(
                            value: newValue,
                            child: Text(newValue, style: TextStyle(color: Col.color1)),);
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Expanded(
                      child: ListView.builder(
                          controller: controller,
                          itemCount: itemsData.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            double scale = 1.0;
                            if (topContainer > 0.5) {
                              scale = index + 0.5 - topContainer;
                              if (scale < 0) {
                                scale = 0;
                              } else if (scale > 1) {
                                scale = 1;
                              }
                            }
                            return Opacity(
                              opacity: scale,
                              child: Transform(
                                transform:  Matrix4.identity()..scale(scale,scale),
                                alignment: Alignment.bottomCenter,
                                child: Align(
                                    heightFactor: 0.7,
                                    alignment: Alignment.topCenter,
                                    child: itemsData[index]),
                              ),
                            );
                          })),
                ]

            ),
          ),


            ],
          ),
        ),
      ),
    );
  }
}
class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
