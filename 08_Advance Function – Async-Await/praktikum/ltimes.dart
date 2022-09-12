Future<void> ltimes(List values, int times) async{
  await Future.delayed(Duration(seconds: 3), (){
    List<int> dump = [];
    for (int value in values) {
      dump.add(value*times);
    }
    print(dump);
  });
}


void main() {
  var values = [10, 20, 30, 40];
  ltimes(values, 2);

  print(values);
  
}