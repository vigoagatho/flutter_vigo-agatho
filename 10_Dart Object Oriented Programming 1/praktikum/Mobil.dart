import 'Hewan.dart';
class Mobil {
  late int capacity;
  late List<int> muatan=[];
  Mobil(this.capacity);

  void tambahMuatan(Hewan h){
    var h1 = Hewan(10);
    var h2 = Hewan(10);
    var h3 = Hewan(5);
    var totalMuatan = h1.beratHewan+h2.beratHewan+h3.beratHewan;

    if(totalMuatan < capacity){
      muatan.add(h.beratHewan);
      print(muatan);
    }
    else{
      print('overcapacity!');
    }
  }
  

}