int winner(List<List<int>> board) {
  var players = [1, 2];
  var num_of_rows = board.length;
  var num_of_columns = board[0].length;
  var start_points = [];
  for (var i = 0; i < num_of_columns; i++) {
    start_points.add([0, i]);
  }
  for (var i = 0; i < num_of_rows; i++) {
    start_points.add([i, 0]);
    start_points.add([i, num_of_rows - 1]);
  }
  var directions = [
    [1, 0],
    [0, 1],
    [1, 1],
    [1, -1]
  ];
  for (var i in players) {
    for (var j in directions) {
      for (var k in start_points) {
        var cnt = 0;
        if (board[k[0]][k[1]] == i) {
          cnt = 1;
        }
        for (var l = 1;
            k[0] + l * j[0] >= 0 &&
                k[0] + l * j[0] < num_of_rows &&
                k[1] + l * j[1] >= 0 &&
                k[1] + l * j[1] < num_of_columns;
            l++) {
          if (board[k[0] + l * j[0]][k[1] + l * j[1]] == i) {
            cnt += 1;
          } else {
            cnt = 0;
          }
          if (cnt == 5) {
            return i;
          }
        }
      }
    }
  }
  return 0;
}
