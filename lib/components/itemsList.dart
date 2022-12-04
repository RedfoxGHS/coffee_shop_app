import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class ItemsList extends StatelessWidget {

  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: fetchItems(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return itemCard(
                item: snapshot.data![index],
                index: index
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
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
      return Color.fromARGB(255, 138, 117, 92);
    } else {
      return Color.fromARGB(255, 112, 91, 78);
    }
  }
}