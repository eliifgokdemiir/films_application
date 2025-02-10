import 'package:films_application/data/entity/filmler.dart';
import 'package:films_application/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Filmler>> filmleriYukle() async {
    var filmlerListesi = <Filmler>[];
    var f1 = Filmler(id: 1, ad: "Gora", resim: "gora.jpg", fiyat: 10);
    var f2 = Filmler(id: 2, ad: "Madmax", resim: "madmax.jpg", fiyat: 20);
    var f3 = Filmler(id: 3, ad: "Matrix", resim: "matrix.webp", fiyat: 30);
    var f4 =
        Filmler(id: 4, ad: "Şimşek Mcqueen", resim: "mcqueen.jpg", fiyat: 40);
    var f5 =
        Filmler(id: 5, ad: "Oppenheimer", resim: "oppenheimer.jpg", fiyat: 50);
    var f6 =
        Filmler(id: 6, ad: "Alacakaranlık", resim: "yeniay.jpg", fiyat: 60);
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, index) {
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfa(film: film)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 200,
                          child: Image.asset(
                            "resimler/${film.resim}",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${film.fiyat} ₺",
                              style: TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print("${film.ad} sepete eklendi");
                                },
                                child: Text("Sepete Ekle"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
