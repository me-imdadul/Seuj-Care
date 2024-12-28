// ignore_for_file: public_member_api_docs, sort_constructors_first
class SplashModel {
  final String image;
  final String text1;
  final String text2;
  SplashModel({
    required this.image,
    required this.text1,
    required this.text2,
  });
}

List<SplashModel> splashtitles = [
  SplashModel(
      image: 'assets/splash/bg_1.png',
      text1: 'Welcome to SeujCare',
      text2:
          'Effortlessly scan your plant using our smart camera feature. Receive realtime insights into their helth, detect issues early, and ensure a thriven farm.'),
  SplashModel(
      image: 'assets/splash/bg_2.png',
      text1: 'Personalised tips',
      text2:
          'Effortlessly scan your plant using our smart camera feature. Receive realtime insights into their helth, detect issues early, and ensure a thriven farm.'),
  SplashModel(
      image: 'assets/splash/bg_3.png',
      text1: 'Scan Plant health',
      text2:
          'Effortlessly scan your plant using our smart camera feature. Receive realtime insights into their helth, detect issues early, and ensure a thriven farm.'),
];
