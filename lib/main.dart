import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/pages/admin_pages/admin_main_screen.dart';
import 'package:seujcare/pages/farmer_pages/home_screen.dart';

import 'package:seujcare/pages/farmer_pages/splash_screen.dart';
import 'package:seujcare/providers/admin_provider.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> session =
        Map<String, dynamic>.from(box.get('session', defaultValue: {}));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        ),
      ],
      child: MaterialApp(
          title: 'Seuj Care',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
            useMaterial3: true,
          ),
          // home: Builder(builder: (context) {
          //   if (session.isEmpty) {
          //     return const SplashScreen();
          //   }
          //   return const HomeScreen();
          // }),
          home: AdminMainScreen()),
    );
  }
}
