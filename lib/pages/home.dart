import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studyin/models/content.dart';

class HomePage extends StatefulWidget {
  final Content content;
  const HomePage({required this.content, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.content.favorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.content;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: isFavorite
                    ? const Icon(Icons.favorite, color: Colors.red, size: 35)
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 35,
                      ),
              ))
        ],
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${content.title}, ",
                style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: content.subject,
                style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w300)),
          ]),
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(left: 16, top: 20),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              "Introdução",
              style: GoogleFonts.robotoCondensed(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content.introduction,
              style: GoogleFonts.roboto(fontSize: 15),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Onde posso estudar?",
              style: GoogleFonts.robotoCondensed(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 125,
              width: double.infinity,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: content.tips
                      .map((dica) => Column(
                            children: [
                              Container(
                                width: 125,
                                height: 75,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(dica["image"])),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              const SizedBox(height: 10),
                              Text(dica["title"])
                            ],
                          ))
                      .toList()),
            ),
            Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                      overlayColor: MaterialStateProperty.all(Colors.red[100]),
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.red,
                      )),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Estou pronto para fazer o QUIZ!",
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )))
          ])
        ],
      )),
    );
  }
}
