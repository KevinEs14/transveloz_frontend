import 'package:bloc/bloc.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/pages/loginPage.dart';
import '../pages/accountspage.dart';
import '../pages/myorderspage.dart';

import '../pages/homepage.dart';
import '../pages/userRegister.dart';
import 'package:transveloz_frontend/pages/profilePage.dart';
import 'package:transveloz_frontend/pages/requestServicePage.dart';
import 'package:transveloz_frontend/pages/userHistoryPage.dart';
import 'package:transveloz_frontend/pages/userHomePage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  MyOrdersClickedEvent,
  UserRegisterClickedEvent,
  UserHomePageClickedEvent,
  ProfileClickedEvent,
  RequestServiceClickedEvent,
  UserHistoryClickedEvent,
  DriverRegisterClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => AccountsPage();

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
      case NavigationEvents.UserRegisterClickedEvent:
        yield UserRegisterPage();
        break;
      case NavigationEvents.UserHomePageClickedEvent:
        yield UserHomePage();
        break;
      case NavigationEvents.ProfileClickedEvent:
        yield ProfilePage();
        break;
      case NavigationEvents.RequestServiceClickedEvent:
        yield RequestServicePage();
        break;
      case NavigationEvents.UserHistoryClickedEvent:
        yield UserHistoryPage();

    }
  }
}
