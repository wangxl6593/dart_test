import 'package:dart_test/dart_test.dart' as dart_test;
import 'dart:io'; 

int flag = 1;

void main(){
  var board = dart_test.createEmptyBoard();
  String step;
  int x, y;

  do  {
   dart_test.displayBoard(board);
   if (dart_test.winner(board) == 1){
      print('1 is winner!');
      break;
    }else if(dart_test.winner(board) == 2){
      print('2 is winner!');
      break;
    }
   stdout.write("$flag turn : ");
   step = stdin.readLineSync();
   if (step.isEmpty) {
     print('game is canced!');
     break;
   }
 try {
     x = int.parse(step.substring(0,step.indexOf(',')).trim());
     y = int.parse(step.substring(step.indexOf(',') + 1,step.length).trim());
  if (step.contains(',') && step.indexOf(',') == step.lastIndexOf(',') && x < board.length && y <board.length ) {
    if (board[x][board.length-1-y] != 0) {
      print('In  valid,$flag try again!');
      continue;
      }
    if (flag == 1) {
      board[x][board.length-1-y] = flag;
      flag = 2;
    } else {
      board[x][board.length-1-y] = flag;
      flag = 1;  
    }
   }
   } catch(FormatException){
   print('Invalid,$flag try again!');
   }
  } 
  while (true);

}
