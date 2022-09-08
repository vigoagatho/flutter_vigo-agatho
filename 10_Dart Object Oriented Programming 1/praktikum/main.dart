import 'Hewan.dart';
import 'Mobil.dart';
void main() {
  var h1 = Hewan(10);
  var h2 = Hewan(10);
  var h3 = Hewan(5);

  var mobil = Mobil(100);
  mobil.tambahMuatan(h1);
  mobil.tambahMuatan(h2);
  mobil.tambahMuatan(h3);

}