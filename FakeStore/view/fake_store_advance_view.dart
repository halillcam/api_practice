import 'package:flutter/material.dart';
import 'package:service_kullanimi/service/FakeStore/FakeStore_service/fakeStore_service.dart';
import 'package:service_kullanimi/service/FakeStore/fake_store_model.dart';

class FakeStoreAdvanceView extends StatefulWidget {
  const FakeStoreAdvanceView({super.key});

  @override
  State<FakeStoreAdvanceView> createState() => _FakeStoreAdvanceViewState();
}

class _FakeStoreAdvanceViewState extends State<FakeStoreAdvanceView> {
  List<FakeStoreModel>? _items;
  bool _isLoading = false;
  // instance
  late final FakeStoreService _service;

  @override
  void initState() {
    super.initState();
    _service = FakeStoreService();
    _getItems();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading; // tersini yap demektir yani true at
    });
  }
  // get

  Future<void> _getItems() async {
    changeLoading();
    // Veriyi servisten çekiyoruz
    _items = await _service.getItemsToService();

    // Flutter'a haber veriyoruz: "Dolap doldu, ekranı güncelle!"
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items?.length ?? 0,
        itemBuilder: (contex, index) {
          return Card(
            child: ListTile(
              title: Text(_items?[index].title ?? ""),
              subtitle: Text(_items?[index].description ?? ""),
              trailing: Text("${_items?[index].price}"),
            ),
          );
        },
      ),
    );
  }
}
