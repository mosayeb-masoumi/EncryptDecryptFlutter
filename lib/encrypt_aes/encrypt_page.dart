import 'package:encryption_decryption_flutter/encrypt_aes/my_encryption.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:encrypt/encrypt.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {


  // source=AES ; https://www.youtube.com/watch?v=lM5JsDlmve4&t=57s
  //source = Fernet ;  https://www.youtube.com/watch?v=2Z59zl3XdS8&t=2s
  //source = Salsa20 ;  https://www.youtube.com/watch?v=NnY-wyrfQ80&t=1s

  TextEditingController controller = TextEditingController();
  var encryptedText, plainText;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "encrypt library",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controller,
              ),
            ),
            const Text(
              "Plain Text",
              style: TextStyle(fontSize: 25),
            ),
            Text(plainText ?? ""),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Encrypted Text",
              style: TextStyle(fontSize: 25),
            ),
            Text(encryptedText == null
                ? ""
                : encryptedText is encrypt.Encrypted
                    ? encryptedText.base64
                    : encryptedText),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  plainText = controller.text;
                  setState(() {
                    // encryptedText = MyEncryptionDecryption.encryptAES(plainText);
                    // encryptedText = MyEncryptionDecryption.encryptFernet(plainText);
                    encryptedText = MyEncryptionDecryption.encryptSalsa20(plainText);
                  });
                }, child: const Text("Encrypt")),

                const SizedBox(width: 10,),

                ElevatedButton(onPressed: (){
                  setState(() {
                    // encryptedText = MyEncryptionDecryption.decryptAES(encryptedText);
                    // encryptedText = MyEncryptionDecryption.decryptFernet(encryptedText);
                    encryptedText = MyEncryptionDecryption.decryptSalsa20(encryptedText);
                  });
                }, child: Text("Decrypt")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
