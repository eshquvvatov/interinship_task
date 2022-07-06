import 'package:flutter/material.dart';
import 'package:interinship_task/pages/intro_page.dart';
import 'package:interinship_task/pages/main_page/provider.dart';
import 'package:interinship_task/pages/my_provider_state_manegement/get_api_page.dart';
import 'package:interinship_task/pages/my_provider_state_manegement/my_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Main_pageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStateManagementProvider(
        model: MyProvider(),
      child: const MyStateManagement(),),
    );
  }
}
