import 'package:hive/hive.dart';
import 'package:seujcare/models/article_model.dart';
import 'package:seujcare/models/crop_model.dart';

class ArticleRepository {
  final Box box = Hive.box('myBox');

  Future<String?> addArticle(ArticleModel article) async {
    try {
      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(box.get('articles'));
      list.add(article.toMap());
      await box.put('articles', list);
      return null;
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  Future<List<CropModel>> getArticles() async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('articles', defaultValue: []));

      return list.map((crop) => CropModel.fromMap(crop)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<String?> updateArticle(int index, ArticleModel article) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('articles', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list[index] = article.toMap();
        await box.put('articles', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Something went wrong. $e";
    }
  }

  Future<String?> deleteArticle(int index) async {
    try {
      List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          box.get('articles', defaultValue: []));

      if (index >= 0 && index < list.length) {
        list.removeAt(index);
        await box.put('articles', list);
        return null;
      } else {
        return "Invalid index";
      }
    } catch (e) {
      return "Something went wrong. $e";
    }
  }
}
