import 'package:flutter/material.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 133, 93, 56),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/side_bar.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Menu Lateral',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Menu'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Carrinho'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Administrador'),
          ),
        ],
      ),
    );
  }
  

}