import 'package:flutter/material.dart';
import 'dart:math';

class GameController {
  static GameStatus gameStatus = checkWin();
  static int playerAttempts = 6;
  static String tipWord = '';
  static List<String> playerSelected = [];
  static List<String> lettersRigth = [];
  static List<String> lettersWrong = [];
  static List<String> randomSelectWord = selectRandomWord(listWords);

  static List<String> listWords = [
    'FLAMENGO',
    'FLUTTER',
    'JACK DANIELS',
    'ONE PIECE',
    'NARUTO SHIPPUDEN',
    'CRISTIANO RONALDO',
    'LEBRON JAMES',
    'NIKE',
    'BRASIL',
    'XIAOMI',
    'VALORANT'
  ];
  static List<String> listTips = [
    'É o melhor time do Brasil ',
    'Framework para Mobile',
    'Whisky Popular',
    'Anime de Piratas',
    'Anime de Ninjas',
    'Jogador de futebol',
    'Jogador de Basquete',
    'Marca Famosa',
    'Um Pais',
    'Marca de celular',
    'Jogo de computador'
  ];
  static List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  static startNewGame() {
    playerAttempts = 6;
    playerSelected.clear();
    lettersRigth.clear();
    lettersWrong.clear();
    randomSelectWord = selectRandomWord(listWords);
    gameStatus = checkWin();
  }

  static List<String> selectRandomWord(List<String> words) {
    var randomNum = Random().nextInt(listWords.length);
    GameController.tipWord = listTips[randomNum];
    print(GameController.tipWord);
    var word = words[randomNum].split('');
    for (var character in word) {
      if (character == ' ') {
        playerSelected.add(character);
      }
    }
    return word;
  }

  static void checkLetter(String letter) {
    if (randomSelectWord.contains(letter) &&
        !playerSelected.contains(letter) &&
        GameController.gameStatus == GameStatus.playing) {
      playerSelected.add(letter);
      lettersRigth.add(letter);
    } else if (!playerSelected.contains(letter) &&
        !lettersWrong.contains(letter) &&
        GameController.gameStatus == GameStatus.playing) {
      playerAttempts = playerAttempts - 1;
      lettersWrong.add(letter);
    }
  }

  static GameStatus checkWin() {
    if (playerAttempts >= 0 &&
        playerSelected.length == randomSelectWord.toSet().length) {
      return GameStatus.win;
    } else if (playerAttempts == 0) {
      return GameStatus.loser;
    } else {
      return GameStatus.playing;
    }
  }

  static Color letterStatus(letter) {
    if (lettersRigth.contains(letter)) {
      return const Color.fromARGB(255, 17, 229, 127);
    } else if (lettersWrong.contains(letter)) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }
}

enum GameStatus { win, loser, playing }
