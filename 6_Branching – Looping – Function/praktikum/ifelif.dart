import 'dart:math';

void main() {
  int value = Random() .nextInt(100);
  print(value);
  if (value > 70){
    print('A');
  }
  else if(value > 40 ){
    print('B');
  }
  else if(value > 0){
    print('C');
  }
  else {
    print(' ');
  }
}