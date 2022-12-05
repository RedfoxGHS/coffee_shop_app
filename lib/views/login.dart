import 'package:coffee_shop_app/components/login_form.dart';
import 'package:flutter/material.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 93, 56),
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 133, 93, 56),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const LoginForm(),
      ),
    );
  }
}