import 'dart:io';

import 'package:dio/dio.dart';
import 'package:service_kullanimi/service/FakeStore/fake_store_model.dart';

class FakeStoreService {
  // instances
  final String _baseUrl = "https://fakestoreapi.com/";
  late final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  // get

  Future<List<FakeStoreModel>?> getItemsToService() async {
    try {
      final response = await _dio.get("products");
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => FakeStoreModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
