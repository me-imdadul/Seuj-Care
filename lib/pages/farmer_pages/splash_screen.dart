import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seujcare/models/splash_model.dart';
import 'package:seujcare/pages/admin_pages/admin_main_screen.dart';

import 'package:seujcare/pages/farmer_pages/login_signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              itemCount: splashtitles.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                        top: -70,
                        left: 0,
                        right: 0,
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 300),
                          child: Image.asset(
                            splashtitles[index].image,
                            fit: BoxFit.contain,
                            height: 600,
                            width: 600,
                          ),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 2.3,
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    splashtitles[index].text1,
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Gap(15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      splashtitles[index].text2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
            Positioned(
                bottom: 210,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      ...List.generate(
                        splashtitles.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 5,
                          width: 50,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Colors.grey.shade300),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
                child: Text(
                  'Login Now',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                height: 70,
                minWidth: MediaQuery.of(context).size.width - 100,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
