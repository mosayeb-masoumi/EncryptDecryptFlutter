import 'package:encryption_decryption_flutter/encrypt_aes/encrypt_page.dart';
import 'package:encryption_decryption_flutter/encrypt_secure_storage/home_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }, child: Text("Encrypt by  flutter_secure_storage library")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EncryptPage()),
              );
            }, child: Text("Encrypt by  encrypt library")),
          ],
        ),
      ),
    );
  }
}
