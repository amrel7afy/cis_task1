import 'dart:io';

import 'dart:math';

void main(){
  int N= int.parse(stdin.readLineSync());
  // ignore: deprecated_member_use
  List<int>X= List(N);
  for(int i=0;i<N;i++){
    X[i]=i;
  // int index= X.indexWhere((element) =>);
 //  print(index);
  }
  print(X.reduce(min));



}