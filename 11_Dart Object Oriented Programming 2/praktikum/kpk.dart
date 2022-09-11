import 'matematika.dart';

class KPK implements Matematika{
  late int x;
  late int y;
  KPK(this.x,this.y);

  @override
  int? hasil() {
    for (int i = x; ; i++) {
      if (i%x==0 && i%y==0) {
        return i;
      }
    }
  }
}

void main(List<String> args) {
  var operation = KPK(6, 9);
  operation.hasil();
  print(operation.hasil());
}