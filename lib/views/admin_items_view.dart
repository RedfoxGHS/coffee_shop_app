import 'package:coffee_shop_app/components/admin_item_list.dart';
import 'package:coffee_shop_app/components/items_list.dart';
import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminItemsView extends StatefulWidget {
  const AdminItemsView({Key? key}) : super(key: key);
  
  @override
  _AdminItemsViewState createState() => _AdminItemsViewState();
}

class _AdminItemsViewState extends State<AdminItemsView> {

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
            return AdminItemList(items: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}