import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:seujcare/pages/admin_pages/admin_main_screen.dart';
import 'package:seujcare/pages/expert_pages/expert_main_screen.dart';
import 'package:seujcare/pages/farmer_pages/home_screen.dart';
import 'package:seujcare/utils/lang.dart';
import 'package:seujcare/utils/role.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  int selectedlanguage = 0;
  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> session =
        Map<String, dynamic>.from(box.get('session', defaultValue: {}));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Select Your Preferred Language',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff323232)),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    await box.put('lan', 0);
                    if (session['role'] == role[0]) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ExpertMainScreen(),
                      ));
                    }
                  },
                  child: Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: const Offset(1, 4))
                        ]),
                    child: Center(
                        child: Text(
                      'English',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade500),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await box.put('lan', 1);
                    if (session['role'] == role[0]) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    } else if (session['role'] == role[1]) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AdminMainScreen(),
                      ));
                    }
                  },
                  child: Container(
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: Offset(1, 4))
                        ]),
                    child: Center(
                        child: Text(
                      'অসমীয়া',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade500),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
