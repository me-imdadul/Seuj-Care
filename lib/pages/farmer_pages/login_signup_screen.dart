import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:seujcare/models/expert_model.dart';
import 'package:seujcare/models/farmer_model.dart';
import 'package:seujcare/pages/admin_pages/admin_main_screen.dart';
import 'package:seujcare/pages/expert_pages/expert_main_screen.dart';
import 'package:seujcare/pages/farmer_pages/home_screen.dart';
import 'package:seujcare/pages/farmer_pages/language_select_screen.dart';
import 'package:seujcare/services/auth_service.dart';
import 'package:seujcare/utils/commons.dart';
import 'package:seujcare/utils/role.dart';
import 'package:seujcare/utils/validations.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  final services = AuthenticationServices();

  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(100),
            const Center(
              child: Text(
                "Welcome to SeujCare",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Image.network(
              'https://img.freepik.com/free-vector/login-concept-illustration_114360-948.jpg?t=st=1735196801~exp=1735200401~hmac=a9b56a82d51b86de9a67a03248307e8e1c86d3b2f858c48d0e49984051658626&w=740',
              height: 250,
            ),
            const SizedBox(height: 40.0),
            TextField(
              controller: email,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.email, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: password,
              obscureText: true,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.lock, color: Colors.green),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              onLongPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminMainScreen(),
                ));
              },
              onPressed: () async {
                final emailText = email.text.toLowerCase().trim();
                print(emailText);
                final passwordText = password.text;

                if (!isValidInput(emailText, passwordText)) {
                  showSnackBar(context, 'Email or password cannot be empty!');
                  return;
                }

                final response =
                    await services.userLogin(emailText, passwordText);
                Map<String, dynamic> session = Map<String, dynamic>.from(
                    box.get('session', defaultValue: {}));

                if (response == null) {
                  if (session['role'] == 'Farmer') {
                    final nextScreen =
                        (box.get('lan', defaultValue: null) == null)
                            ? const LanguageSelectScreen()
                            : const HomeScreen();
                    replaceToScreen(context, nextScreen);
                  } else if (session['role'] == 'Expert') {
                    final nextScreen =
                        (box.get('lan', defaultValue: null) == null)
                            ? const LanguageSelectScreen()
                            : const ExpertMainScreen();
                    replaceToScreen(context, nextScreen);
                  }
                } else {
                  showSnackBar(context, response);
                }
              },
              minWidth: double.infinity,
              color: Colors.green,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have any account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Gap(5),
                GestureDetector(
                  onTap: () {
                    replaceToScreen(context, const SignupPage());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final auth = AuthenticationServices();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  var box = Hive.box('myBox');

  String selectedRole = 'Farmer';

  FarmerModel createFarmer(
    String name,
    String email,
    String password,
  ) {
    return FarmerModel(
      password: password,
      name: name,
      phone: '9876543210',
      id: DateTime.now().toString(),
      email: email.trim().toLowerCase(),
      profilePic: 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
    );
  }

  ExpertModel createExpert(String name, String email, String password) {
    return ExpertModel(
        email: email,
        password: password,
        specializations: ['Agri'],
        desc: 'lorem',
        qualifications: ['Metric fail'],
        gender: 'Male',
        name: name,
        id: DateTime.now().toString(),
        profileImg: 'https://cdn-icons-png.flaticon.com/512/660/660611.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                "https://img.freepik.com/free-vector/login-concept-illustration_114360-948.jpg?t=st=1735196801~exp=1735200401~hmac=a9b56a82d51b86de9a67a03248307e8e1c86d3b2f858c48d0e49984051658626&w=740",
                height: 250,
              ),
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: const [
                  [Colors.green],
                  [Colors.green]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey.shade300,
                inactiveFgColor: Colors.white,
                initialLabelIndex: selectedRole == role[0] ? 0 : 1,
                totalSwitches: 2,
                labels: role,
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    selectedRole = role[index!];
                  });
                },
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person, color: Colors.green),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.green),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.green),
                ),
              ),
              const SizedBox(height: 30.0),
              MaterialButton(
                onPressed: () async {
                  if (name.text.isEmpty) {
                    return showSnackBar(context, 'Name cannot be empty!');
                  }
                  if (email.text.isEmpty) {
                    return showSnackBar(context, 'Email cannot be empty!');
                  }
                  if (password.text.isEmpty) {
                    return showSnackBar(context, 'Password cannot be empty!');
                  }

                  if (selectedRole == role[0]) {
                    // farmer
                    var farmer = createFarmer(
                        name.text, email.text.toLowerCase(), password.text);

                    var response = await auth.farmerSignup(farmer);

                    if (response == null) {
                      replaceToScreen(context, LoginPage());

                      showSnackBar(context, 'Signup Success!');
                    } else {
                      showSnackBar(context, response);
                    }
                  } else {
                    var expert = createExpert(
                        name.text, email.text.toLowerCase(), password.text);
                    var response = await auth.expertSignup(expert);

                    if (response == null) {
                      replaceToScreen(context, const LoginPage());

                      showSnackBar(context, 'Signup Success!');
                    } else {
                      showSnackBar(context, response);
                    }
                  }
                },
                minWidth: double.infinity,
                color: Colors.green,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Gap(5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
