import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';

// enum:特定の値のみが列挙型で定義された値の中から選択できる
enum Hand { rock, scissors, paper }

void playRockPaperScissors(Hand myHand) {
  final random = Random();
  final computerHandIndex = random.nextInt(3);
  final computerHand = Hand.values[computerHandIndex];

  debugPrint('Player choose: $myHand');
  debugPrint('Computer choose: $computerHand');

  final bool isDraw = myHand == computerHand;
  final bool isWin = (myHand == Hand.rock && computerHand == Hand.scissors) ||
      (myHand == Hand.paper && computerHand == Hand.rock) ||
      (myHand == Hand.scissors && computerHand == Hand.paper);
  if (isDraw) {
    debugPrint('引き分けや、もう一度勝負しよ');
  } else if (isWin) {
    debugPrint('ワイの負けや。強いな');
  } else {
    debugPrint('YOU LOSE 俺の勝ち。何で負けたか、明日まで考えといてください');
  }
}

void main() {
  // プレイヤーの手を入力
  debugPrint('じゃんけんしようや (0 for Rock, 1 for Scissors, 2 for Paper):');
  final input = int.parse(stdin.readLineSync() ?? '');

  // 入力を Hand 列挙体に変換して関数に渡す
  if (input == 0 || input == 1 || input == 2) {
    final myHand = Hand.values[input];
    playRockPaperScissors(myHand);
  } else {
    debugPrint('Invalid choice. Please choose between 0, 1, or 2.');
  }
}
