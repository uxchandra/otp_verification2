import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int randomNumber = 10000;

  @override
  void initState() {
    random();
    super.initState();
  }

  void random() {
    setState(() {
      Random random = Random();
      randomNumber = random.nextInt(100000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi OTP'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Aplikasi OTP'),
            const SizedBox(
              height: 40,
            ),
            Text('$randomNumber'),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Colors.red,        
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                if (int.parse(verificationCode) == randomNumber) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text("Berhasil"),
                          content: Text('Kode dimasukkan benar'),
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text("Gagal"),
                          content: Text('Kode dimasukkan salah'),
                        );
                      });
                }
              }, // end onSubmit
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: random,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
