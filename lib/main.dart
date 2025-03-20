import 'package:flutter/material.dart';
import 'package:matchingsport/utils/routes/routes.dart';
import 'package:matchingsport/utils/routes/routes_names.dart';
import 'package:matchingsport/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RouteNames.home,
          onGenerateRoute: Routes.generateRoutes,
        ),
      ),
    );
  }
}
