import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminItemList extends StatelessWidget {
  const AdminItemList({Key? key}) : super(key: key);

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
        title: Text('id: ${item.itemId}\nnome: ${item.name}'),
        subtitle: Text('Categoria: ${item.category}\n' + 
                      'Descrição: ${item.description}\n' + 
                      'Preço: ${item.price.toString()}'),
        trailing: Container(
          width: 100,
          // centraliza na vertical

          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  print('Editar item');
                }, 
                alignment: Alignment.center,

                icon: const Icon(
                  Icons.edit,
                  color: Colors.yellow,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 1
                    )
                  ],
                  )
              ),
              IconButton(
                onPressed: () {
                  print('Deletar item');
                }, 
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 1
                    )
                  ], 
                )
              ),
            ],
          ),
        ),
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