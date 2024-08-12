import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pagess/result_Page.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  var tfController = TextEditingController();
  int kalanHak = 6;
  String yardim = "";
  int randomSayi = 0;
  bool sonuc = false;

  @override
  void initState() {
    super.initState();
    randomSayi = Random().nextInt(101);
    print("random Number : $randomSayi");
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    final double ekranYuksekligi = ekranBilgisi.size.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background_2.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ekranYuksekligi / 8,
              ),
              Text('REMAINING RIGHTS : $kalanHak',
                  style: TextStyle(
                      fontSize: ekranGenisligi / 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.red)),
              SizedBox(
                height: ekranYuksekligi / 20,
              ),
              Text('Help: $yardim',
                  style: TextStyle(
                      fontSize: ekranGenisligi / 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              SizedBox(
                height: ekranYuksekligi / 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: tfController,
                  decoration: InputDecoration(
                    hintText: 'Guess',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: ekranYuksekligi / 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                  onPressed: () {
                    int tahmin = int.parse(tfController.text);

                    if (tahmin > randomSayi) {
                      yardim = "Decrease";
                    }
                    if (tahmin < randomSayi) {
                      yardim = "Increase";
                    }
                    if (tahmin == randomSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(sonuc: true)));
                    }
                    setState(() {
                      kalanHak = kalanHak - 1;
                    });
                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(sonuc: false)));
                    }

                    tfController.text = "";

                    //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ResultPage()));
                  },
                  child: Text(
                    'GUESS',
                    style: TextStyle(
                        fontSize: ekranGenisligi / 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
