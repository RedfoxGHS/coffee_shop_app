import 'package:coffee_shop_app/components/itemsList.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 92, 62, 33),
      ),
      body: const Center(
        child: ItemsList(),
      ),
    );
  }

 
}