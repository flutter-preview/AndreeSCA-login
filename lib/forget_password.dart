import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register.dart';
import 'login.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordPage ({super.key});

  void _resetPassword (BuildContext context) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
    } catch(e){
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Resetear Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()=> _resetPassword(context),
              child: const Text('Resetear Contraseña'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ),
                );
              },
              child: const Text('¿Ya tiene una cuenta? Logeate aqui'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage()
                  ),
                );
              },
              child: const Text('¿No tiene una cuenta?'),
            ),
          ],
        ),
      ),
    );
  }
}