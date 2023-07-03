import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'forget_password.dart';

class RegisterPage extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwoordController = TextEditingController();
  
  void _registerUser(BuildContext) async {
    try{
      UserCredential userCredential = 
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwoordController.text
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
        title: const Text('Registrar'),
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
            const SizedBox(height: 16.0,),
            ElevatedButton(
              onPressed: () => _registerUser(context),
              child: const Text('Registrar Usuario')
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ),
                );
              },
              child: const Text('Click Aqui si ya tienes registrado tu cuenta'),
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
              child: const Text('Olvidé mi contraeña'),
            ),
          ],
        ),
      ),
    );
  }
}