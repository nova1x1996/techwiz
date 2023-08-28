import 'package:flutter/material.dart';
import 'package:mobile_app/screens/Help/HelpChild/CartInstruction.dart';
import 'package:mobile_app/screens/Help/HelpChild/Favorite%20Instruction.dart';
import 'package:mobile_app/screens/Help/HelpChild/LoginInstruction.dart';
import 'package:mobile_app/screens/Help/HelpChild/MenuInstruction.dart';

class HelpMain extends StatefulWidget {
  const HelpMain({super.key});

  @override
  State<HelpMain> createState() => _HelpMainState();
}

class _HelpMainState extends State<HelpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Page"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        color: Colors.white, // Set background color to white
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginInstruction()),
              );
            },
            child: Text('Login Instruction'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50), // Chỉnh chiều rộng và chiều cao tùy ý
            ),
          ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartInstruction()),
                  );
                },
                child: Text('Cart Instruction'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50), // Chỉnh chiều rộng và chiều cao tùy ý
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoriteInstruction()),
                  );
                },
                child: Text('Favorite Instruction'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuInstruction()),
                  );
                },
                child: Text('Menu Instruction'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                ),
              ),
        ]),
      )),
    );
  }
}
