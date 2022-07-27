import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studyin/pages/history.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HistoryPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 100),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "STUDY",
                    style: GoogleFonts.raleway(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
                TextSpan(
                    text: "IN",
                    style: GoogleFonts.raleway(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ]))
            ],
          )),
    );
  }
}
