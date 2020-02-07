import 'package:dart_test/dart_test.dart' as dart_test;
 
void main(List<String> arguments) {
  var board = dart_test.createEmptyBoard();
  board[0][1] = 1;
  board[2][2] = 2;
  dart_test.displayBoard(board);
}
