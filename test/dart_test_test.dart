import 'package:dart_test/dart_test.dart';
import 'package:dart_test/judge.dart';
import 'package:test/test.dart';

void main() {
  test('empty board', () {
    var board = createEmptyBoard();
    expect(winner(board), equals(0));
  });
  test('in a row', () {
    var board = createEmptyBoard();
    for (var i = 3; i < 8; i++) {
      board[5][i] = 1;
    }
    expect(winner(board), equals(1));
  });
  test('in a column', () {
    var board = createEmptyBoard();
    for (var i = 1; i < 6; i++) {
      board[i][4] = 2;
    }
    expect(winner(board), equals(2));
  });
  test('left up to right down', () {
    var board = createEmptyBoard();
    for (var i = 0; i < 5; i++) {
      board[2+i][4+i] = 1;
    }
    expect(winner(board), equals(1));
  });
  test('right up to left down', () {
    var board = createEmptyBoard();
    for (var i = 0; i < 5; i++) {
      board[2+i][9-i] = 2;
    }
    expect(winner(board), equals(2));
  });
  test('broken', () {
    var board = createEmptyBoard();
    for (var i = 0; i < 4; i++) {
      board[3][i] = 2;
    }
    board[3][5] = 2;
    expect(winner(board), equals(0));
  });
}
