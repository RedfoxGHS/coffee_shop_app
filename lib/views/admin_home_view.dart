import 'package:coffee_shop_app/components/dropdown_categories.dart';
import 'package:coffee_shop_app/components/list_of_categories.dart';
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
    DropdownCategories dropdownCategories = DropdownCategories();
    String name = '';
    String description = '';
    double price = 0;

    return Builder(
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionando novo item'),
          backgroundColor: const Color.fromARGB(255, 202, 184, 151),
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
                      createItem(Item(name: name, description: description, category: dropdownCategories.getDropdownValue() , price: price));
                      Navigator.pop(context);
                    }, 
                    child: const Text('Adicionar', style: TextStyle(color: Color.fromARGB(255, 33, 117, 36)), textScaleFactor: 1.3)
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