import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transveloz_frontend/models/Driver.dart';
import 'package:transveloz_frontend/repository/driver_repository.dart';
import 'package:transveloz_frontend/sidebar/usersidebar.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../color.dart';
import '../sidebar/menu_item.dart';

class DriverSideBar extends StatefulWidget {
  @override
  _DriverSideBarState createState() => _DriverSideBarState();
}

class _DriverSideBarState extends State<DriverSideBar> with SingleTickerProviderStateMixin<DriverSideBar> {
  int driverId;
  Driver driver1 = Driver();
  DriverRepository driverRepository = DriverRepository();
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  ObtenerNombre()async{
    setState(() {
      driver1.driverId=driverId;
    });
  }
  SharedPreferences driver;
  _initSharedPreferences() async{
    driver = await SharedPreferences.getInstance();
    driverId = driver.getInt("id");
    driver1 = await driverRepository.obtener_datos_conductor(driver1, driverId);
    print("Sidebar");
    print(driver.getInt("id").toString());
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    _initSharedPreferences();
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }
  Size size;
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    screenWidth= MediaQuery.of(context).size.width;
    size=MediaQuery.of(context).size;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        size=MediaQuery.of(context).size;
        return Stack(
          children: [
            Align(
              child: Container(
                width: isSideBarOpenedAsync.data ?size.width:0,
                color: isSideBarOpenedAsync.data ?color5.withOpacity(0.5):Colors.transparent,
                child:  GestureDetector(
                  onTap: (){
                    onIconPressed();

                  },

                ),
              ),
            ),
            AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? 0 : -screenWidth+90,
              // left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
              // right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: size.width-90,

                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0),
                          width: screenWidth - 90,
                          height: size.height,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.08),
                                child: ListTile(
                                  title: Text(
                                    "${driver1.firstname}",
                                    style: TextStyle(color: Color(0xFF225957), fontSize: 20, fontWeight: FontWeight.w800),
                                  ),
                                  subtitle: Text(
                                    "${driver1.email}",
                                    style: TextStyle(
                                      height: 2,
                                      color: color1.withOpacity(0.8),
                                      fontSize: 15,
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: driver1.picture==null?(AssetImage("assets/images/fotoperfil.png")):(NetworkImage(driver1.picture.toString())),
                                    backgroundColor: color1,
                                    radius: size.width*0.07,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: color1,
                                      borderRadius: BorderRadius.only(
                                        topLeft:Radius.circular(40),
                                        topRight:Radius.circular(40),
                                      ),
                                    ),
                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 30,
                                          ),
                                          MenuItem(
                                            icon: Icons.home,
                                            title: "Inicio",
                                            onTap: () {
                                              onIconPressed();
                                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SearchVehiclesEvent);
                                            },
                                          ),
                                          MenuItem(
                                            icon: Icons.person,
                                            title: "Perfil",
                                            onTap: () {
                                              onIconPressed();
                                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfileDriverClickedEvent);
                                            },
                                          ),
                                          MenuItem(
                                            icon: Icons.add,
                                            title: "Añadir Vehiculo",
                                            onTap: () {
                                              onIconPressed();
                                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.VehicleRegisterClickedEvent);
                                            },
                                          ),

                                          Divider(
                                            height: 50,
                                            thickness: 0.5,
                                            //color: Colors.white.withOpacity(0.3),
                                            color: Colors.white,
                                            indent: 32,
                                            endIndent: 32,
                                          ),
                                          /*MenuItem(
                                                icon: Icons.settings,
                                                title: "Settings",
                                              ),*/
                                          MenuItem(
                                            icon: Icons.exit_to_app,
                                            title: "Cerrar Sesión",
                                            onTap: (){
                                              onIconPressed();
                                              // BlocProvider.of<LoginBloc>(context).add(CerrarLogin());
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.7),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: color1,
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: color2,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = color1;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}
