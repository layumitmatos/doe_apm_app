import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

// ↓↓↓ CLASSE STATE SEPARADA ↓↓↓
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 217, 253),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/imagens/logo.png',
                height: 200,
              ),
              Container(
                width: 400,
                height: 450, 
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                child: Column( 
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    Image.asset(
                      'assets/imagens/img2.png',
                      height: 100,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Faça o login para continuar',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,  
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Digite seu e-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ), 
                        filled: true, 
                        fillColor: const Color.fromARGB(51, 161, 196, 215),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Digite sua senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ), 
                        filled: true, 
                        fillColor: const Color.fromARGB(51, 161, 196, 215),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 35),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(253, 83, 177, 249),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Continuar', 
                          style: TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}