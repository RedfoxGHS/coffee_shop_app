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
              border: Border.all(color: Colors.white, width: 1.5),
              color: const Color.fromARGB(255, 61, 177, 121),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0), 
              onTap: () {},
              child: const Icon(Icons.add, size: 40)
            ),
          ),
        ),
      ),
    );
  }
}