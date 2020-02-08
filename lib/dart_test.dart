import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

List<List<int>> createEmptyBoard() {
  return List.generate(10, (_) => List.generate(10, (_) => 0));
}

void displayBoard(List<List<int>> board) {
  var pen = AnsiPen()..xterm(11);
  var pen1 = AnsiPen()..xterm(9);
  var pen2 = AnsiPen()..xterm(10);
  var pen3 = AnsiPen()..xterm(15);
  for (var i = 0; i < board.length; i++) {
    stdout.write(pen('${9-i}'));
    for (var j = 0; j < board[0].length; j++) {
      if (board[i][j] == 1) {
        stdout.write(pen1('  X'));
      } else if (board[i][j] == 2) {
        stdout.write(pen2('  X'));
      } else {
        stdout.write(pen3('  O'));
      }
    }
    stdout.write('\n');
  }
  stdout.write(' ');
  for (var i = 0; i < board[0].length; i++){
    stdout.write(pen('  $i'));
  }
  stdout.write('\n');
}
