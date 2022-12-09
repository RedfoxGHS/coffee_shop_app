import 'package:coffee_shop_app/components/items_list.dart';
import 'package:coffee_shop_app/views/items_view.dart';
import 'package:coffee_shop_app/views/sidebar_menu.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu - Coffee Shop'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 93, 56),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const SideBarMenu(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const ItemsView(),
      ),
    );
  }

 
}