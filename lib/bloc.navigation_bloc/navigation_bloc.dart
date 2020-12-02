import 'package:bloc/bloc.dart';
import 'package:transveloz_frontend/pages/User/profilePage.dart';
import 'package:transveloz_frontend/pages/User/requestServicePage.dart';
import 'package:transveloz_frontend/pages/User/userHistoryPage.dart';
import 'package:transveloz_frontend/pages/User/userHomePage.dart';
import 'package:transveloz_frontend/pages/Vehicle/vehicleList.dart';
import 'package:transveloz_frontend/pages/driver/driver_list.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/pages/loginPage.dart';
import '../pages/accountspage.dart';
import '../pages/myorderspage.dart';

import '../pages/homepage.dart';
import '../pages/User/userregister.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  MyOrdersClickedEvent,
  DriverRegisterClickedEvent,
  SearchVehicles,
  UserRegisterClickedEvent,
  UserHomePageClickedEvent,
  ProfileClickedEvent,
  RequestServiceClickedEvent,
  UserHistoryClickedEvent,
  DriverListClickedEvent

}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => VehicleList();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.AccountClickedEvent:
        yield AccountsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
      case NavigationEvents.DriverRegisterClickedEvent:
        yield DriverRegister();
        break;
      case NavigationEvents.SearchVehicles:
        yield VehicleList();
        break;
      case NavigationEvents.UserRegisterClickedEvent:
        yield UserRegister();
        break;
      case NavigationEvents.UserHomePageClickedEvent:
        yield UserHomePage();
        break;
      case NavigationEvents.ProfileClickedEvent:
        yield ProfilePageDesign();
        break;
      case NavigationEvents.RequestServiceClickedEvent:
        yield RequestServicePage();
        break;
      case NavigationEvents.UserHistoryClickedEvent:
        yield UserHistoryPage();
        break;
      case NavigationEvents.DriverListClickedEvent:
        yield DriverList();
        break;
    }
  }
}
