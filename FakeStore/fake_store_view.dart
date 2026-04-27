import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:service_kullanimi/service/FakeStore/fake_store_model.dart';

class FakeStoreView extends StatefulWidget {
  const FakeStoreView({super.key});

  @override
  State<FakeStoreView> createState() => _FakeStoreViewState();
}

class _FakeStoreViewState extends State<FakeStoreView> {
  List<FakeStoreModel>? _fakeStoreItems;
  bool _isLoading = false;

  // dio istance
  late final Dio _dio;
  final String _baseUrl = "https://fakestoreapi.com/";

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchProductsItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchProductsItems() async {
    _changeLoading();
    final response = await _dio.get("products");
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _fakeStoreItems = _datas.map((e) => FakeStoreModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _fakeStoreItems?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_fakeStoreItems?[index].title ?? ""),
              subtitle: Text(_fakeStoreItems?[index].description ?? ""),
              trailing: Text("${_fakeStoreItems?[index].price} "),
            ),
          );
        },
      ),
    );
  }
}
