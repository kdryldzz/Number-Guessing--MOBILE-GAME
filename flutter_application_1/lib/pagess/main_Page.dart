import 'package:flutter/material.dart';
import 'package:flutter_application_1/pagess/guess_Page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: ekranYuksekligi / 7,
              ),
              Text(
                'NUMBER GUESSING GAME',
                style: TextStyle(
                    fontSize: ekranGenisligi / 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ekranYuksekligi / 30,
              ),
              Container(
                  height: ekranYuksekligi / 3,
                  width: ekranGenisligi / 1.25,
                  child: Image.asset("images/file.png")),
              SizedBox(
                height: ekranYuksekligi / 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GuessPage()));
                  },
                  child: Text(
                    'START',
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
