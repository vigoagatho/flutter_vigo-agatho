void main() {
  List data = [['absen', 'ada'], [19, 'detik'], ['ilham', 'kurniawan'], ['kci', 30]];

  var listed = {
    'data1': data[0],
    'data2': data[1],
    'data3': data[2],
    'data4': data[3]
  };

  for (var key in listed.keys){
    print(listed[key]);
  }
}