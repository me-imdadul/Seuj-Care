import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:seujcare/pages/farmer_pages/login_signup_screen.dart';
import 'package:seujcare/pages/farmer_pages/splash_screen.dart';
import 'package:seujcare/services/auth_service.dart';
import 'package:seujcare/utils/lang.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> session =
        Map<String, dynamic>.from(box.get('session', defaultValue: {}));
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green.shade800,
        title: const Text("Profile & Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(session['profilePic'] ??
                          ''), // Replace with user's image.
                    ),
                    const SizedBox(height: 10),
                    Text(
                      session['name'] ?? 'error',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      session['email'] ?? 'error',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.green.shade800),
                title: const Text("Edit Profile"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {}, // Add navigation or actions
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.green.shade800),
                title: const Text("Change Password"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.green.shade800),
                title: const Text("Language Preferences"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showLangChangeDialog(context);
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                "App Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading:
                    Icon(Icons.notifications, color: Colors.green.shade800),
                title: const Text("Notification Preferences"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              // ListTile(
              //   leading: Icon(Icons.dark_mode, color: Colors.green.shade800),
              //   title: Text("Dark Mode"),
              //   trailing: Switch(value: false, onChanged: (val) {}),
              // ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.green.shade800),
                title: const Text("About Us"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await AuthenticationServices().logOut();

                    if (response == null) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(response),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  }, // Add logout logic
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showLangChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        int? selectedLanguage = box.get('lan',
            defaultValue: 0); // Get the initially selected language.

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Select Your Language'),
              scrollable: true,
              contentPadding: const EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              content: Column(
                children: List.generate(
                  availableLanguages.length,
                  (index) => ListTile(
                    onTap: () {
                      setState(() {
                        selectedLanguage = availableLanguages[index]['id'];
                      });
                      box.put('lan', selectedLanguage);
                      Navigator.of(context).pop();
                    },
                    trailing: Radio<int>(
                      value: availableLanguages[index]['id']!,
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value;
                        });
                        box.put('lan', selectedLanguage);
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(availableLanguages[index]['lan'] ?? 'error'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
