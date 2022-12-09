import 'package:coffee_shop_app/controllers/item_controller.dart';
import 'package:coffee_shop_app/models/item.dart';
import 'package:coffee_shop_app/views/admin_items_view.dart';
import 'package:coffee_shop_app/views/items_view.dart';
import 'package:flutter/material.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 93, 56),
      ),
      
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/admin_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const AdminItemsView(),
      ),

      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0), 
              onTap: () {
                  showDialog(context: context, builder:(context) => addNewItemDialog());
              },
              child: const Icon(Icons.add, size: 40, color: Color.fromARGB(255, 78, 52, 46))
            ),
          ),
        ),
      ),
    );
  }

  Builder addNewItemDialog() {
    String name = '';
    String category = '';
    String description = '';
    double price = 0;

    return Builder(
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionando novo item'),
          content: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome do item',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Categoria',
                    hintText: 'Categoria do item',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    category = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Descrição do item',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Preço',
                    hintText: 'Preço do item',
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
                createItem(Item(name: name, description: description, category: category, price: price));
                Navigator.pop(context);
              }, 
              child: const Text('Adicionar')
            ),
          ],
        );
      },
    );
  }

}