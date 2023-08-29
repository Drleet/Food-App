import 'package:flutter/material.dart';
import 'package:food_app/HomePage.dart';
import 'package:food_app/SwitchePages.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 110),
            Image.asset('assets/food.png'),
            SizedBox(height: 50),
            Text(
              'Find your Best',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              'Food here',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Get your best food and enjoy your',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            Text(
              'daily life with this app',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SwitchPages()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 0, 0),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 150,
                height: 70,
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
