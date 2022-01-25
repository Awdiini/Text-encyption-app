import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController encodeController = TextEditingController();
  TextEditingController decodeController = TextEditingController();
  List<String> alphate = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  String encode = "";
  String decode = "";
  int key = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: const Text("CIPHER TEXT APP"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 90.0,
                    // backgroundImage: AssetImage('images/c.png'),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: encodeController,
                  onChanged: (value) {
                    encode = value.toUpperCase();
                  },
                  decoration: const InputDecoration(
                      hintText: "Encoding Text",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder()),
                ),

          //       DropdownButton<String>(
          //   items: <String>['2', '3', '4', '5'].map((String value) {
          //    return DropdownMenuItem<String>(
          //     value: value,
          //     child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (_) {},
          // ),


                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      String result = "";
                      String s1 = encode.toUpperCase();
                      String s2 = "";
                      for (int i = 0; i < s1.length; i++) {
                        var ind1 = alphate.indexOf(s1[i]);
                        var ind2 = (ind1 + 2) % alphate.length;
                        result += alphate[ind2];
                      }
                      decodeController.text = result;
                    },
                    child: const Text("Encode"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: decodeController,
                  onChanged: (value) {
                    decode = value.toUpperCase();
                  },
                  decoration: const InputDecoration(
                      hintText: "Decoding Text",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      String result = "";
                      String s1 = decode.toUpperCase();
                      String s2 = "";
                      for (int i = 0; i < s1.length; i++) {
                        var ind1 = alphate.indexOf(s1[i]);
                        var ind2 = (ind1 - 2);
                        result += alphate[ind2];
                      }
                      encodeController.text = result;
                    },
                    child: const Text("Decode"),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
