import 'matematika.dart';

class FPB implements Matematika{
  late int x;
  late int y;
  FPB(this.x, this.y);

  @override
  int? hasil() {
    for (int i = x; i > 0; i--) {
      if (x%i==00 && y%i==0) {
        return i;
      }
      break;
    }
    
  }
}

void main(List<String> args) {
  var operation = FPB(3, 5);
  operation.hasil();
  print(operation.hasil());
}