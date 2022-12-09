import 'package:coffee_shop_app/components/dropdown_categories.dart';
import 'package:coffee_shop_app/components/list_of_categories.dart';
import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminItemList extends StatelessWidget {
  final List<Item> items;
  const AdminItemList({Key? key, required this.items}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemCard(context: context, item: items[index], index: index);
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
    String description = item.description;
    double price = item.price;
    DropdownCategories dropdownCategories = DropdownCategories(defaultValue: item.category,);

    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text('Editando item com id: ${item.itemId}'),
          backgroundColor: const Color.fromARGB(255, 202, 184, 151),
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
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Text('Categoria:',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                dropdownCategories,
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: const Text('Cancelar', style: TextStyle(color: Colors.red), textScaleFactor: 1.3)
                  ),
                  TextButton(
                    onPressed: () {
                      editItem(Item(name: name, description: description, category: dropdownCategories.getDropdownValue(), price: price), item.itemId);
                      Navigator.pop(context);
                    }, 
                    child: const Text('Editar', style: TextStyle(color: Color.fromARGB(255, 33, 117, 36)), textScaleFactor: 1.3)
                  ),
                ],
              ),
            )
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
          backgroundColor: const Color.fromARGB(255, 202, 184, 151),
          content: Text('Tem certeza que deseja deletar este item [${item.name}]?'),
          actions: [

            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: const Text('Cancelar', style: TextStyle(color: Color.fromARGB(255, 78, 78, 78)), textScaleFactor: 1.3)
                  ),
                  TextButton(
                    onPressed: () {
                      deleteItem(item.itemId);
                      Navigator.pop(context);
                    }, 
                    child: const Text('Excluir', style: TextStyle(color: Colors.red), textScaleFactor: 1.3)
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

}