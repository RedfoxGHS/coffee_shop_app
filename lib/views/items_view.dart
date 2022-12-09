import 'package:coffee_shop_app/components/itemsList.dart';
import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemsView extends StatefulWidget {
  const ItemsView({Key? key}) : super(key: key);
  
  @override
  _ItemsViewState createState() => _ItemsViewState();

}

class _ItemsViewState extends State<ItemsView> {

  @override
  void initState() {
    super.initState();
  }

  Future<List<Item>> getItems() {
    return fetchItems(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<List<Item>>(
        future: getItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ItemsList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}