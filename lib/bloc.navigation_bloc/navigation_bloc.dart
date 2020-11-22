import 'package:bloc/bloc.dart';
import 'package:transveloz_frontend/pages/driver/driverregister.dart';
import 'package:transveloz_frontend/pages/loginPage.dart';
import '../pages/accountspage.dart';
import '../pages/myorderspage.dart';

import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AccountClickedEvent,
  MyOrdersClickedEvent,
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
    }
  }
}
