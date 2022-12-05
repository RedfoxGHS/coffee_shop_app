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
                context: context,
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

  Widget itemCard({required BuildContext context, required Item item, int index = 0}) {
    return Card(
      child: ListTile(
        title: Text('id: ${item.itemId}\nnome: ${item.name}'),
        subtitle: Text('Categoria: ${item.category}\n' 'Descrição: ${item.description}\n'  'Preço: ${item.price.toString()}'),
        trailing: SizedBox(
          width: 100,

          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(context: context, builder:(context) => editItemDialog(item));
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
                  showDialog(context: context, builder: (context) => deleteItemDialog(item));
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

  Builder editItemDialog(Item item) {
    String name = item.name;
    String category = item.category;
    String description = item.description;
    double price = item.price;

    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text('Editando item com id: ${item.itemId}'),
          content: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              children: [
                TextField(
                  decoration:  InputDecoration(
                    labelText: 'Nome',
                    hintText: item.name,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    hintText: item.category,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    category = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    hintText: item.description,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Preço',
                    hintText: item.price.toString(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    price = double.parse(value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                editItem(Item(itemId: item.itemId, name: name, description: description, category: category, price: price));
                Navigator.pop(context);
              }, 
              child: const Text('Salvar')
            ),
          ],
        );
      },
    );
  }

  Builder deleteItemDialog(Item item) {
    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text('Deletando item com id: ${item.itemId}'),
          content: Text('Tem certeza que deseja deletar este item [${item.name}]?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text('Cancelar')
            ),
            TextButton(
              onPressed: () {
                deleteItem(item.itemId);
                Navigator.pop(context);
              }, 
              child: const Text('Deletar')
            ),
          ],
        );
      },
    );
  }

}