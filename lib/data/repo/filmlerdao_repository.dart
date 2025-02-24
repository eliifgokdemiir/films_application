import 'package:films_application/data/entity/filmler.dart';

class FilmlerDaoRepository {
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
}
