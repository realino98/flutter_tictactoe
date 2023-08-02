import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> board = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];
  bool isPlayerOne = true;
  bool isPlaying = true;
  String curCursor = "X";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe Game"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  BoardButton(0, board[0]),
                  BoardButton(1, board[1]),
                  BoardButton(2, board[2]),
                ],
              ),
              Row(
                children: [
                  BoardButton(3, board[3]),
                  BoardButton(4, board[4]),
                  BoardButton(5, board[5]),
                ],
              ),
              Row(
                children: [
                  BoardButton(6, board[6]),
                  BoardButton(7, board[7]),
                  BoardButton(8, board[8]),
                ],
              ),
              Text(isPlaying ? "Game is Still Playing" : "Game Stopped"),
            ],
          ),
        ),
      ),
    );
  }

  Card BoardButton(int id, String val) {
    return Card(
      elevation: 1,
      child: FloatingActionButton(
        onPressed: () {
          print("Board ${id} X");
          setState(
            () {
              if (board[id] == "" && isPlaying) {
                if (isPlayerOne) {
                  curCursor = "O";
                } else {
                  curCursor = "X";
                }
                isPlayerOne = !isPlayerOne;
                board[id] = curCursor;
              }
            },
          );

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
        },
        child: Container(
          child: Center(
            child: Text(board[id]),
          ),
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
