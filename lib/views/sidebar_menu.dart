import 'package:coffee_shop_app/views/admin_home_view.dart';
import 'package:coffee_shop_app/views/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 133, 93, 56),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
          const ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Menu'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Carrinho'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Administrador'),
            onTap: () => buttomLoginAction(context),
          ),
        ],
      ),
    );
  }
  
  Future<bool> isLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogged') ?? false;
  }

  buttomLoginAction(BuildContext context) async {
    bool? logged = await isLogged();

    if(!mounted) return;

    if(logged == true){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomeView()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }
}