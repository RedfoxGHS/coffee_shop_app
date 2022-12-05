import 'package:flutter/material.dart';

String login = '';
String password = '';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 25),
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(200, 153, 130, 109),
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                color:  Color.fromARGB(255, 75, 57, 37),
                width: 3,
              ),
            ),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(
              color: Color.fromARGB(255, 75, 57, 37),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            labelText: 'Usuário',
          ),
          onChanged: (value) {
            login = value;
          },
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(200, 153, 130, 109),
            border: OutlineInputBorder(),
            labelText: 'Senha',
          ),
          onChanged: (value) {
            password = value;
          },
        ),
        const SizedBox(height: 80),
        ElevatedButton(
          onPressed: () {
            if (login == 'admin' && password == 'admin') {
              Navigator.pushNamed(context, '/menu');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Senha ou usuário inválidos'),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            backgroundColor: const Color.fromARGB(255, 83, 60, 39),
          ),
          child: const Text('Entrar'),
        ),
      ],
    );
  }


}