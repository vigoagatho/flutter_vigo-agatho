//fungsi faktorial
int faktorial(n){
    if(n<=1){
      return n;
    }
    else{
      return n * faktorial(n-1);
    }
  }

void main() {
  
  var x = 10;
  var hasil = faktorial(x);
  print(x);
  print(hasil);
  var y = 20;
  var hasil2 = faktorial(y);
  print(y);
  print(hasil2);
  var z = 30;
  var hasil3 = faktorial(z);
  print(z);
  print('Hasil minus karena angka terlalu besar');
  print(hasil3);
  //interger tidak mampu menampung angka terlalu besar

}