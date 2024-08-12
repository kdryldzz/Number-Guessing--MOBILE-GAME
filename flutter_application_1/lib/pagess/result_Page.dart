import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final bool sonuc;

  const ResultPage({super.key, required this.sonuc});
  @override
  State<ResultPage> createState() => _SonucekraniState();
}

class _SonucekraniState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_2.jpg'), fit: BoxFit.cover)),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ekranYuksekligi / 10,
              ),
              Container(
                  height: ekranYuksekligi / 3,
                  width: ekranGenisligi / 1.25,
                  child: widget.sonuc
                      ? Image.asset("images/happy.png")
                      : Image.asset("images/sad.png")),
              Text(
                widget.sonuc ? 'YOU WON' : 'YOU LOSE',
                style: TextStyle(
                    fontSize: ekranGenisligi / 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: ekranYuksekligi / 8,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'TRY AGAIN',
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
    ));
  }
}
