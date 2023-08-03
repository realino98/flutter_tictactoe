import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  // List<String> board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"];
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  bool isPlayerOne = true;
  bool isPlaying = true;
  String curCursor = "O";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe Game"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: board.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return boardButton(index);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              !isPlaying
                  ? "Congratulation, player ${curCursor} wins!"
                  // Inverting Player who is currently playing
                  : isPlayerOne
                      ? "Player O turn"
                      : "Player X turn",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  boardButton(int id) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            if (board[id] == "" && isPlaying) {
              isPlayerOne = !isPlayerOne;
              curCursor = isPlayerOne ? "X" : "O";
              // if (isPlayerOne) {
              //   curCursor = "O";
              // } else {
              //   curCursor = "X";
              // }
              board[id] = curCursor;
              isPlaying = gameCheck(board, curCursor, isPlaying);
            }
          },
        );
      },
      child: Container(
        color: isPlaying ? Colors.black26 : Colors.green[300],
        child: Center(
          child: Text(
            board[id],
            style: TextStyle(fontSize: 150),
          ),
        ),
      ),
    );
  }
}

gameCheck(board, curCursor, isPlaying) {
  //gamecheck
  //horizontal
  if ((board[0] == curCursor) &&
      (board[0] == board[1]) &&
      (board[0] == board[2])) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  } else if ((board[3] == curCursor) &&
      board[3] == board[4] &&
      board[4] == board[5]) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  } else if ((board[6] == curCursor) &&
      board[6] == board[7] &&
      board[7] == board[8]) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  }
  //vertical
  if ((board[0] == curCursor) &&
      (board[0] == board[3]) &&
      (board[3] == board[6])) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  } else if ((board[1] == curCursor) &&
      board[1] == board[4] &&
      board[4] == board[7]) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  } else if ((board[2] == curCursor) &&
      board[2] == board[5] &&
      board[5] == board[8]) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  }
  //cross
  if ((board[0] == curCursor) &&
      (board[0] == board[4]) &&
      (board[4] == board[8])) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  } else if ((board[2] == curCursor) &&
      board[2] == board[4] &&
      board[4] == board[6]) {
    print("Player ${curCursor} Wins");
    isPlaying = !isPlaying;
  }
  return isPlaying;
}
