import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart' as Col;
import 'package:flutter/cupertino.dart';
import 'vehicleConstants.dart';
class VehicleList extends StatefulWidget with NavigationStates{
  @override
  _VehicleList createState() => _VehicleList();


}

class _VehicleList extends State<VehicleList>{

  List nam = ["Jorge","Juan Carlos","Antonio","Kebin","Joel","Jorge","Juan Carlos","Antonio","Kebin","Joel"];
  List des = ["Programador","Administrador","Programador","Analista","Registrador","Programador","Administrador","Programador","Analista","Registrador"];
  List pres = ["123.53","2343.22","212.543","212.21","423.23","434.56","645.53","323.34","323.98","321.33"];
  Size size;
  String _nameFilter="SELECCIONAR FILTRO";
  List<String>_filterList=[
    "SELECCIONAR FILTRO",
    "ORDENAR POR MARCA",
    "ORDENAR POR COMPAÑIA",
    "ORDENAR POR TIPO VEHICULO",
    "ORDENAR POR CAPACIDAD"];
  List<Widget> itemsData = [];
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  int sizeList=5;

  //final CategoriesScroller categoriesScroller = CategoriesScroller();



  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: size.height*0.08),
                          child: Center(
                            child: Text("BUSQUEDA DE VEHICULOS",style: TextStyle(color: Colors.white,fontSize: size.height*0.035,fontWeight: FontWeight.bold),),
                          ),
                        )
                    ),
                    SizedBox(
                      height: 20,
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
                    ListView.builder(
                        itemCount: nam.length,
                        itemBuilder: (context, position){
                          return nam[position];
                        }
                    )



                  ],
                ),

              ]
          ),

        ),
      ),
    );
  }
  Widget listItems(){
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
              color: Col.color4,
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
                              Text("Conductor:  ", style: TextStyle(color: Col.color1,
                                  fontSize: 18.0, fontWeight: FontWeight.bold),),
                              Text(nam[index], style: TextStyle(color: Col.color5,
                                  fontSize: 17.0, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text("Tipo:   ", style: TextStyle(color: Col.color1,
                                  fontSize: 16.0, fontWeight: FontWeight.bold),),
                              Text(des[index], style: TextStyle(color: Col.color5,
                                  fontSize: 16.0),),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text("Precio:   ", style: TextStyle(color: Col.color1,
                                  fontSize: 16.0, fontWeight: FontWeight.bold),),
                              Text(pres[index]+" Bs.", style: TextStyle(color: Col.color5,
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
                      color: Col.color1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("   Ver  ➜  ", style: TextStyle(color: Col.color2, fontSize: 20.0),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
