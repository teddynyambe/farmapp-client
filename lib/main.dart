import 'package:farmapp_mobile/farm/view_model/farmactivitylist_modelview.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/crudfarm_viewmodel.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:farmapp_mobile/start_app.dart';
import 'package:farmapp_mobile/user/view/login_screen.dart';
import 'package:farmapp_mobile/user/view/registration_screen.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import 'package:farmapp_mobile/util/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserRegistrationViewModel()),
    ChangeNotifierProvider(create: (context) => FarmListViewModel()),
    ChangeNotifierProvider(create: (context) => CrudFarmViewModel()),
    ChangeNotifierProvider(create: (context) => SpecieListViewModel()),
    ChangeNotifierProvider(create: (context) => FarmActivityListModelView()),
    ChangeNotifierProvider(create: (context) => ScrollList())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Application - Client [Flutter]',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          buttonColor: Colors.redAccent,
          primarySwatch: Colors.deepPurple,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.deepPurple)),
          accentColor: Color.fromRGBO(219, 200, 255, 1),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.orange,
          ).copyWith(secondary: Colors.purple.shade100),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.purple),
          )),
      home: Scaffold(
        body: Center(
          child: Container(
            child: _ControlEntry(),
          ),
        ),
      ),
      routes: {
        RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
        // FarmScreen.routeName: (ctx) => FarmScreen(),
      },
      //Start(),
    );
  }
}

class _ControlEntry extends StatelessWidget {
  const _ControlEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserRegistrationViewModel>();
    return vm.isLoggedIn
        ? StartScreen(loggedInUser: vm.userViewModel)
        : vm.isBusy
            ? CircularProgressIndicator()
            : LoginScreen();
  }
}
