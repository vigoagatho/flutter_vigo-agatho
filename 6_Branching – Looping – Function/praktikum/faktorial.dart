//fungsi faktorial
double faktorial(n){
    if(n<=1.0){
      return n;
    }
    else{
      return n * faktorial(n-1.0);
    }
  }

void main() {
  
  var x = 10.0;
  var hasil = faktorial(x);
  print(x);
  print(hasil);
  var y = 20.0;
  var hasil2 = faktorial(y);
  print(y);
  print(hasil2);
  var z = 30.0;
  var hasil3 = faktorial(z);
  print(z);
  print(hasil3);

}