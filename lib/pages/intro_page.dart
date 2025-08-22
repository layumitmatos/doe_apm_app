import 'package:flutter/material.dart'; 
import 'login_page.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 184, 217, 253),
     body: SingleChildScrollView(
      child: Center(
        child: Column(
      children:[
        //logo 
       Image.asset('assets/imagens/logo.png',
        height:240, ),
        //image
         Image.asset('assets/imagens/img1.png',
         ),
        //title
        const Text('Bem vindo(a) ao Doe APM!',
        style: TextStyle(
          //fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 20, 
      )
        ),

    
        //subtitle
        const Text('Gerencie suas doações de forma fácil e rápida',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Color.fromARGB(255, 52, 51, 51))),
        //espaçamento extra 
        SizedBox(height: 25),
        //button 
GestureDetector(
  onTap: () => Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => LoginPage())) ,
  
  child: Container(
    
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 35, 147, 239),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(20),
    child: const Text('Entrar com minha conta', style: TextStyle(color: Colors.white)),
  ),

),
const SizedBox(height:10),



GestureDetector(
  onTap: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  ),
  child: Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(77, 50, 54, 57),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(20),
    child: const Text('Entrar sem me identificar', style: TextStyle(color: Colors.white)),
  ),
),
      ]))));
  }
}