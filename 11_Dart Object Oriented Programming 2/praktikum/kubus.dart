import 'bangun_ruang.dart';

class Kubus extends BangunRuang{
  late double sisi;
  Kubus(this.sisi);

  @override
  set panjang(double? _panjang) {
    _panjang= sisi;  
  }
  
  @override
  set lebar(double? _lebar) {
    _lebar = sisi;
  }

  @override
  set tinggi(double? _tinggi) {
    _tinggi = sisi;
  }

  @override
  double volume() {
    double vKubus = sisi*sisi*sisi;
    return vKubus;
  }
}

void main(List<String> args) {
  var bangun = Kubus(2.0);
  print(bangun.volume());
}