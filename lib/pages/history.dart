import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studyin/models/content.dart';
import 'package:studyin/pages/home.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final histories = [
    Content(
        banner:
            "https://static.todamateria.com.br/upload/pi/nt/pinturaromanaviladosmisterios-cke.jpg",
        introduction:
            """A arte romana foi produzida pelo povo pertencente à Roma Antiga e perdurou aproximadamente do século VIII a.C. ao século IV d.C.

Foi fortemente influenciada pelos etruscos e gregos, sendo que as manifestações artísticas mais significativas remontam ao estabelecimento da República no ano de 509 a.C.

Apesar disso, conhecemos poucos nomes de seus artistas e arquitetos, posto que era uma arte coletiva ou feita para seus mecenas.

A arte desse período é dividida em arte da Roma Republicana (antes de 27 a.C.) e a da Roma Imperial (do ano 27 a.C. em diante).""",
        title: "Arte Romana",
        subject: "Arte",
        favorite: false,
        tips: [
          {
            "image":
                "https://static.todamateria.com.br/upload/pi/nt/pinturaromanaviladosmisterios-cke.jpg",
            "title": "Parte 1",
          },
          {
            "image":
                "https://static.todamateria.com.br/upload/pi/nt/pinturaromanaviladosmisterios-cke.jpg",
            "title": "Parte 2",
          },
          {
            "image":
                "https://static.todamateria.com.br/upload/pi/nt/pinturaromanaviladosmisterios-cke.jpg",
            "title": "Parte 3",
          }
        ]),
    Content(
        banner:
            "https://i.ytimg.com/vi/8Pzx393okBY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAcTMSUg8IozPK-7G3qGcLIQt6M9A",
        introduction:
            "A Revolução Francesa foi um evento histórico ocorrido na França entre 1789 e 1799, que levou ao fim do Absolutismo no país, e teve importantes consequências para o mundo ocidental. A importância da Revolução Francesa é tamanha que os historiadores a utilizam para marcar o fim da Idade Moderna e o início da Idade Contemporânea. Com importantes transformações políticas, sociais e econômicas, a Revolução Francesa representou também a conquista do poder por parte da classe burguesa que estava se desenvolvendo no continente europeu desde finais da Idade Média.",
        title: "Revolução Francesa",
        subject: "História",
        favorite: false,
        tips: [
          {
            "image":
                "https://i.ytimg.com/vi/8Pzx393okBY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAcTMSUg8IozPK-7G3qGcLIQt6M9A",
            "title": "Parte 1"
          },
          {
            "image":
                "https://i.ytimg.com/vi/8Pzx393okBY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAcTMSUg8IozPK-7G3qGcLIQt6M9A",
            "title": "Parte 2"
          },
          {
            "image":
                "https://i.ytimg.com/vi/8Pzx393okBY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAcTMSUg8IozPK-7G3qGcLIQt6M9A",
            "title": "Parte 3"
          },
          {
            "image":
                "https://i.ytimg.com/vi/8Pzx393okBY/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAcTMSUg8IozPK-7G3qGcLIQt6M9A",
            "title": "Parte 4"
          }
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Histórico de Conteúdos",
          style: GoogleFonts.raleway(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.sort,
              color: Colors.black,
              size: 35,
            ),
          )
        ],
      ),
      body: ListView(
          children: histories.map((content) {
        return _buildTile(content: content);
      }).toList()),
    ));
  }

  Widget _buildTile({required Content content}) {
    return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        content: content,
                      )));
        },
        leading: Container(
          width: 100,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(content.banner),
              )),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: content.favorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
        ),
        title: Text(
          content.title,
          style: GoogleFonts.robotoCondensed(fontSize: 14, color: Colors.black),
        ),
        subtitle: Text(
          content.subject,
          style: GoogleFonts.robotoCondensed(fontSize: 14, color: Colors.black),
        ));
  }
}
