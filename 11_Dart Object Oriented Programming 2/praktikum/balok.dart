import 'bangun_ruang.dart';

class Balok extends BangunRuang{
  @override
  double volume() {
    double vBalok = panjang*lebar*tinggi;
    return vBalok;
  }
}

void main(List<String> args) {
  var bangun = Balok();
  print(bangun.volume());
}
