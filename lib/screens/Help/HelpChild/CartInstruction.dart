import 'package:flutter/material.dart';

class CartInstruction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartIntructionState();
}

class _CartIntructionState extends State<CartInstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Instruction',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF8ECAE6),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Bo tròn góc trên
          ),
          child: Column(
            children: [
              Text(
                'Get Started with PlantPal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF32948F),
                  fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Here is a step-by-step guide on how to use our app:',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              _buildInstructionStep(
                title: 'Step 1: Login',
                description: 'This is our login page. Enter your credentials to log in.',
                imagePath: 'assets/images/Help/Login.jpg',
              ),
              _buildInstructionStep(
                title: 'Step 2: Register',
                description: 'If you are not registered yet, you need to sign up first.',
                imagePath: 'assets/images/Help/Register.jpg',
              ),
              _buildInstructionStep(
                title: 'Step 3: Main Page',
                description: 'After successfully logging in, you will be directed to our main page.',
                imagePath: 'assets/images/Help/mainAfterLogin.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInstructionStep({required String title, required String description, required String imagePath}) {
    return Column(
      children: [
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15), // Bo tròn góc
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF32948F)),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(imagePath, width: 350, height: 350),
            ],
          ),
        ),
      ],
    );
  }
}
