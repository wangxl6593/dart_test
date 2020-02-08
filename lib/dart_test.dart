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
      if (board[j][i] == 1) {
        stdout.write(pen1('  X'));
      } else if (board[j][i] == 2) {
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

int winner(List<List<int>> board){
  int i=0,j=0;
//line1
  for (var x=0; x<board.length; x++) {
    for (var y=0; y<board.length; y++){
      if (board[x][y] == 1) {
        i +=1;
        if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[x][y] == 2){
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
//line2
  for (var y=0; y<board.length; y++) {
    for (var x=0; x<board.length; x++){
      if (board[x][y] == 1) {
        i +=1;
        if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[x][y] == 2){
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
//left top triangle 
  for (var x=4; x<board.length; x++) {
    for (var y=0; y<=x; y++){
      if (board[x-y][y] == 1) {
        i +=1;
        if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[x-y][y] == 2){
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
//right bottom triangle 
  for (var x=board.length-5; x>0; x--) {
    for (var y=board.length -1 ; y>=x; y--){
      if (board[board.length -1 -y +x][y] == 1) {
         i +=1;
         if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[board.length -1 -y +x][y] == 2) {
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
//left bottom triangle 
 for (var y=0; y<=board.length-5; y++) {
    for (var x=0 ; x<=board.length -1 -y; x++){
      if (board[x][x+y] == 1) {
        i +=1;
        if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[x][x+y] == 2){
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
//right top triangle
  for (var x=1; x<=board.length-5; x++) {
    for (var y=0 ; y<=board.length -1 - x ; y++){
      if (board[x+y][y] == 1) {
        i +=1;
        if (i == 5) {
          return 1;
          }
      }else{i=0;}
      if (board[x+y][y] == 2){
        j +=1;
        if (j ==5){
          return 2;
        }
      }else{j=0;}
    }
    i =0;
    j =0;
  }
  return 0;
}



