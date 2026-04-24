import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_kullanimi/my_practices/bookShelf/bookShelf_model.dart';

class BookShelfService {
  // istance
  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "https://raw.githubusercontent.com/halillcam/api_practice/refs/heads/main/bookShelf/",
    ),
  );

  /// GET

  // method
  Future<List<BookShelfModel>> getDatas() async {
    // response
    try {
      final response = await dio.get(Path.bookshelf.pathName);

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> datas = response.data;

        return datas.map((e) => BookShelfModel.fromJson(e)).toList();
      }
    } on DioException catch (e) {
      print("error ${e.message}");
      return [];
    }
    return [];
  }

  /// POST

  Future<bool> addData(BookShelfModel newData) async {
    try {
      final response = await dio.post(Path.bookshelf.pathName, data: newData.toJson());

      if (response.statusCode == HttpStatus.created) {
        return true;
      }
    } on DioException catch (e) {
      print("error ${e.message}");

      return false;
    }
    return false;
  }

  /// PUT

  Future<bool> updateData(BookShelfModel model, int id) async {
    try {
      final response = await dio.put("${Path.bookshelf.pathName}/$id", data: model.toJson());

      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } on DioException catch (e) {
      print("Error ${e.message}");
      return false;
    }
    return false;
  }

  // delete

  Future<bool> deleteData(int id) async {
    try {
      final response = await dio.delete("${Path.bookshelf.pathName}/$id");

      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } on DioException catch (e) {
      print("Error ${e.message}");
      return false;
    }
    return false;
  }
}

enum Path { bookshelf }

extension PathExtension on Path {
  String get pathName {
    switch (this) {
      case Path.bookshelf:
        return "bookshelf.json";
    }
  }
}
