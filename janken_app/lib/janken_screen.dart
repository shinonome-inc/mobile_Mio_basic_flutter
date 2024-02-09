import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'hand.dart';

class JankenScreen extends StatefulWidget {
  const JankenScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<JankenScreen> createState() => _JankenScreenState();
}

class _JankenScreenState extends State<JankenScreen> {
  Hand? _myHand;
  Hand? _computerHand;
  String _result = '';

  void _playJanken([Hand? myHand]) {
    setState(() {
      if (myHand != null) {
        _myHand = myHand;
        _computerHand = _getComputerHand();
        _result = _getResult(_myHand!, _computerHand!);
        Timer(const Duration(seconds: 3), () => _playJanken());
      } else {
        _myHand = null;
        _computerHand = null;
        _result = '';
      }
    });
  }

  Hand _getComputerHand() {
    final random = Random();
    final computerHandIndex = random.nextInt(3);
    return Hand.values[computerHandIndex];
  }

  String _getResult(Hand playerHand, Hand computerHand) {
    if (playerHand == computerHand) {
      return '引き分けや、もう一度勝負しよ!';
    } else if ((playerHand == Hand.rock && computerHand == Hand.scissors) ||
        (playerHand == Hand.paper && computerHand == Hand.rock) ||
        (playerHand == Hand.scissors && computerHand == Hand.paper)) {
      return '俺の負けや。強いな';
    } else {
      return 'YOU LOSE 俺の勝ち。\n 何で負けたか、明日まで考えといてください';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_myHand != null && _computerHand != null)
              Column(
                children: [
                  Text('君: ${_handToString(_myHand!)}'),
                  Text('俺: ${_handToString(_computerHand!)}'),
                  Text(
                    _result,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var hand in Hand.values)
                  GestureDetector(
                    onTap: () => _playJanken(hand),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: _getColor(hand),
                        borderRadius: BorderRadius.circular(20), // 角丸の半径を設定
                      ),
                      child: Center(
                        child: Text(
                          _handToString(hand),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _handToString(Hand hand) {
    switch (hand) {
      case Hand.rock:
        return 'グー';
      case Hand.scissors:
        return 'チョキ';
      case Hand.paper:
        return 'パー';
    }
  }

  Color _getColor(Hand hand) {
    switch (hand) {
      case Hand.rock:
        return Colors.red;
      case Hand.scissors:
        return Colors.green;
      case Hand.paper:
        return Colors.blue;
    }
  }
}
