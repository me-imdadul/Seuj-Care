import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seujcare/pages/expert_pages/expert_main_screen.dart';
import 'package:seujcare/pages/farmer_pages/home_screen.dart';
import 'package:seujcare/pages/farmer_pages/splash_screen.dart';
import 'package:seujcare/providers/admin_provider.dart';
import 'package:seujcare/providers/chat_provider.dart';
import 'package:seujcare/providers/crop_provider.dart';
import 'package:seujcare/providers/expert_provider.dart';
import 'package:seujcare/providers/query_provider.dart';

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
          ChangeNotifierProvider(
            create: (context) => CropProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => QueryProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExpertProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChatProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Seuj Care',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
            useMaterial3: true,
          ),
          home: Builder(builder: (context) {
            if (session.isEmpty) {
              return const SplashScreen();
            }
            if (session['role'] == 'Expert') {
              return const ExpertMainScreen();
            }
            return const HomeScreen();
          }),
        )
        // home: AdminMainScreen()),
        );
  }
}
