import 'package:encryption_decryption_flutter/encrypt_secure_storage/user_secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  List<String> list = [];

  DateTime? birthDay;

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
            // get and set  encrypted String
            ElevatedButton(
                onPressed: () async {
                  await UserSecureStorage.setUserName("mosayeb");
                },
                child: const Text("Encrypt String mosayeb")),
            ElevatedButton(
                onPressed: () async {
                  userName = await UserSecureStorage.getUserName() ?? "";
                  setState(() {});
                },
                child: const Text("Decrypt String mosayeb")),
            Text(userName),

            const SizedBox(
              height: 20,
            ),





            // get and set  encrypted Date
            ElevatedButton(onPressed: () async {
              DateTime birthDay = DateTime.now();
              await UserSecureStorage.setDate(birthDay);
            }, child: const Text("Encrypt Date")),
            ElevatedButton(onPressed: () async {
              birthDay = await UserSecureStorage.getDate();
              setState(() {});
            }, child: const Text("Decrypt Date")),

             Text(birthDay == null ? "" : "${birthDay.toString()}"),

            const SizedBox(
              height: 30,
            ),







            ElevatedButton(
                onPressed: () async {
                  List<String> myList = ["ali", "reza", "mosayeb"];
                  await UserSecureStorage.setList(myList);
                },
                child: const Text("Encrypt ListOfString")),
            ElevatedButton(
                onPressed: () async {
                  list = await UserSecureStorage.getList() ?? [];
                  setState(() {});
                },
                child: const Text("Decrypt ListOfString")),

            if (list.isNotEmpty) Text("${list[0]} , ${list[1]} , ${list[2]}")

          ],
        ),
      ),
    );
  }
}
