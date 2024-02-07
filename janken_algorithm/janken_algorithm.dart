import 'dart:math';
import 'dart:io';

// enum:特定の値のみが列挙型で定義された値の中から選択できる
enum Hand { rock, paper, scissors }

void playRockPaperScissors(Hand myHand) {
  final random = Random();
  final computerHandIndex = random.nextInt(3);
  final computerHand = Hand.values[computerHandIndex];

  print('Player choose: $myHand');
  print('Computer choose: $computerHand');

  if (myHand == computerHand) {
    print('引き分けや、もう一度勝負しよ');
  } else if ((myHand == Hand.rock && computerHand == Hand.scissors) ||
      (myHand == Hand.paper && computerHand == Hand.rock) ||
      (myHand == Hand.scissors && computerHand == Hand.paper)) {
    print('ワイの負けや。強いな');
  } else {
    print('YOU LOSE 俺の勝ち。何で負けたか、明日まで考えといてください');
  }
}

void main() {
  // プレイヤーの手を入力
  print('じゃんけんしようや (0 for Rock, 1 for Paper, 2 for Scissors):');
  final input = int.parse(stdin.readLineSync() ?? '');

  // 入力を Hand 列挙体に変換して関数に渡す
  if (input == 0 || input == 1 || input == 2) {
    final myHand = Hand.values[input];
    playRockPaperScissors(myHand);
  } else {
    print('Invalid choice. Please choose between 0, 1, or 2.');
  }
}
