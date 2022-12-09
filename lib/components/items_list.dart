import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:http/http.dart' as http;

class ItemsList extends StatelessWidget {
  final List<Item> items;
  const ItemsList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemCard(item: items[index], index: index);
      },
    );
  }

  Widget itemCard({required Item item, int index = 0}) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text('Preço: ${item.price.toString()}'),
        tileColor: setColorCards(index),
      ),
    );
  }

  setColorCards(int index) {

    if (index % 2 == 0) {
      return const Color.fromARGB(255, 138, 117, 92);
    } else {
      return const Color.fromARGB(255, 112, 91, 78);
    }
  }
}