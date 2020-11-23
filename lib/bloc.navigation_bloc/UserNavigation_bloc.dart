import 'package:bloc/bloc.dart';
import 'package:transveloz_frontend/pages/profilePage.dart';
import 'package:transveloz_frontend/pages/requestServicePage.dart';
import 'package:transveloz_frontend/pages/userHistoryPage.dart';
import 'package:transveloz_frontend/pages/userHomePage.dart';
import '../pages/accountspage.dart';
import '../pages/myorderspage.dart';

import '../pages/homepage.dart';
import '../pages/userRegister.dart';
/*
enum UserNavigationEvents {
  UserHomePageClickedEvent,
  ProfileClickedEvent,
  RequestServiceClickedEvent,
  UserHistoryClickedEvent,
}

abstract class UserNavigationStates {}

class UserNavigationBloc extends Bloc<UserNavigationEvents, UserNavigationStates> {
  @override
  UserNavigationStates get initialState => ProfilePage();

  @override
  Stream<UserNavigationStates> mapEventToState(UserNavigationEvents event) async* {
    switch (event) {
      case UserNavigationEvents.UserHomePageClickedEvent:
        yield UserHomeePage();
        break;
      case UserNavigationEvents.ProfileClickedEvent:
        yield ProfileePage();
        break;
      case UserNavigationEvents.RequestServiceClickedEvent:
        yield RequestServiceePage();
        break;
      case UserNavigationEvents.UserHistoryClickedEvent:
        yield UserHistoryyPage();
        break;
    }
  }
}

 */