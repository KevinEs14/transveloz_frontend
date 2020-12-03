import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transveloz_frontend/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:transveloz_frontend/color.dart';
import 'package:transveloz_frontend/models/CompanyRequest.dart';
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
  Driver driver2 = Driver();
  List<CompanyRequest> companies = List();
  CompanyRequest _value = CompanyRequest();
  TextEditingController Eci = TextEditingController();
  TextEditingController EfirstName = TextEditingController();
  TextEditingController EfirstSurname = TextEditingController();
  TextEditingController EsecondSurname = TextEditingController();
  TextEditingController EbirthDate = TextEditingController();
  TextEditingController Ephone = TextEditingController();
  TextEditingController Eemail = TextEditingController();
  TextEditingController Enumber = TextEditingController();
  TextEditingController Estreet = TextEditingController();
  TextEditingController Ezone = TextEditingController();
  TextEditingController Ecity = TextEditingController();
  TextEditingController Ecountry = TextEditingController();
  TextEditingController Epassword = TextEditingController();

  _loadCompanies() async{
    var compAux=await driverRepository.getCompanies();
    setState(() {
      companies = compAux;
    });
    print('Companies');
    print(companies);
  }

  var ci="";var firstName="";var firstSurname="";var secondSurname=""; var birthDate=""; var phone=""; var email="";var number="";var street="";
  var zone=""; var city=""; var country="";
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _loadList();
    _loadCompanies();
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
                                  onPressed: () async{
                                    driver = await driverRepository.getDriver(data[index].driverId);
                                    Eci.text=driver.ci;
                                    EfirstName.text=driver.firstname;
                                    EfirstSurname.text=driver.firstsurname;
                                    EsecondSurname.text=driver.secondsurname;
                                    EbirthDate.text="";
                                    for(int i=0;i<10;i++){
                                      EbirthDate.text += driver.birthdate[i];
                                    }
                                    Ephone.text=driver.phone;
                                    Eemail.text=driver.email;
                                    Epassword.text="";
                                    Enumber.text=driver.number;
                                    Estreet.text=driver.street;
                                    Ezone.text=driver.zone;
                                    Ecity.text=driver.city;
                                    Ecountry.text=driver.country;
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
                                                        controller: Eci,
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
                                                        controller: EfirstName,
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
                                                            controller: EfirstSurname,
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
                                                            controller: EsecondSurname,
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
                                                        controller: EbirthDate,
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
                                                        controller: Ephone,
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
                                                        value: _value.companyId,
                                                        iconEnabledColor: color1,

                                                        hint: Text("Seleccione un opción", style: TextStyle(color: color1),),
                                                        onChanged: (newValue){
                                                          setState(() {
                                                            _value = companies.firstWhere((element) {
                                                              if(element.companyId==newValue){
                                                                return true;
                                                              }
                                                              else{
                                                                return false;
                                                              }
                                                            });

                                                          });
                                                          print(_value.companyId);
                                                        },
                                                        items: companies.map((newValue){
                                                          return DropdownMenuItem(
                                                            value: newValue.companyId,

                                                            child: Text(newValue.name, style: TextStyle(color: color1)),);
                                                        }).toList(),
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
                                                        controller: Enumber,
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
                                                        controller: Estreet,
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
                                                        controller: Ezone,
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
                                                        controller: Ecity,
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
                                                        controller: Ecountry,
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
                                                        controller: Eemail,
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
                                                        controller: Epassword,
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
                                                onPressed: ()async{
                                                  bool check = Check();
                                                  if(check){
                                                    driver2.driverId=data[index].driverId;
                                                    bool aux = await driverRepository.updateDriver(driver2);
                                                    if(aux){
                                                      print("Actualización");
                                                      data.clear();
                                                      _loadList();
                                                      Navigator.of(context).pop();
                                                    }
                                                    //userRepository.updateUser(user);
                                                    //Navigator.of(context).pop();
                                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=> UserSideBarLayout()));

                                                  }else{
                                                    print("No entro al if ");
                                                  }

                                                },
                                                //onTap: (){
                                                //},
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
                                                        msg: "Conductor Eliminado",
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

  bool Check(){
    bool x = false;
    if(Epassword.text.length>7){
      if(Eci.text.isNotEmpty && EfirstName.text.isNotEmpty && EfirstSurname.text.isNotEmpty && EsecondSurname.text.isNotEmpty && EbirthDate.text.isNotEmpty && Ephone.text.isNotEmpty && Enumber.text.isNotEmpty &&
          Estreet.text.isNotEmpty && Ezone.text.isNotEmpty && Ecity.text.isNotEmpty && Ecountry.text.isNotEmpty && Eemail.text.isNotEmpty && Epassword.text.isNotEmpty){
        driver2.ci=Eci.text;
        driver2.firstname=EfirstName.text;
        driver2.firstsurname=EfirstSurname.text;
        driver2.secondsurname=EsecondSurname.text;
        driver2.birthdate=EbirthDate.text;
        driver2.phone=Ephone.text;
        driver2.email=Epassword.text;
        driver2.password=Epassword.text;
        driver2.number=Enumber.text;
        driver2.street=Estreet.text;
        driver2.zone=Ezone.text;
        driver2.city=Ecity.text;
        driver2.country=Ecountry.text;
        driver2.companyId=_value.companyId;
        x =true;
      }else{
        Fluttertoast.showToast(
            msg: "Llenen todos los campos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: color3,
            textColor: color1,
            fontSize: 16.0
        );
      }
    }else{
      Fluttertoast.showToast(
          msg: "Debe tener minimo 8 caracteres en su contraseña",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: color3,
          textColor: color1,
          fontSize: 16.0
      );
    }
    return x;
  }

}