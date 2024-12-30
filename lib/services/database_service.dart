import 'package:hive/hive.dart';

class DatabaseServices {
  var box = Hive.box('myBox');

  String cropDatabase = "crops";
  String cropDiseaseDatabase = "cropDiseases";
  String seasonDatabase = "seasons";
  String chatDatabase = "messages";
}
