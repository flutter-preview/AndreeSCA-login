import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'register.dart';
import 'forget_password.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwoordController = TextEditingController();

  void _loginUser(BuildContext context) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwoordController.text
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage()
        ),
      );
    }catch (e){
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
              ),
            ),
            TextField(
              controller: passwoordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: ()=> _loginUser(context),
              child: const Text('Login')
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage()
                  ),
                );
              },
              child: const Text('No tengo una cuenta y deseo registrarme'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordPage()
                  ),
                );
              },
              child: const Text('Olvidé mi contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}