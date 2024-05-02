import 'package:flutter/material.dart';
import 'package:hangman_app/game_controller/game_logic.dart';
import 'package:hangman_app/widgets/hidden_word.dart';
import 'package:hangman_app/widgets/keyboardkeys_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:
            const Text('Hangman Game', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GameController.playerAttempts <= 2
              ? Center(
                  child: Text('Dica : ${GameController.tipWord}',
                      style: const TextStyle(color: Colors.white)),
                )
              : const Center(
                  child: Text('A hint will appear when 2 attempts remain',
                      style: TextStyle(color: Colors.white)),
                ),
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 5, top: 5),
            child: Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(
                    'assets/hangman_body_states/hangman_${GameController.playerAttempts}.png'),
              ),
            ),
          ),
          Center(
              child: switch (GameController.gameStatus) {
            GameStatus.playing => const Text(''),
            GameStatus.win => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('You Win',
                      style: TextStyle(color: Colors.green, fontSize: 20)),
                  Container(
                    color: Colors.black,
                    child: TextButton(
                        onPressed: () {
                          GameController.startNewGame();
                          setState(() {});
                        },
                        child: const Text('Start New Game',
                            style: TextStyle(color: Colors.white))),
                  )
                ],
              ),
            GameStatus.loser => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('You Lose',
                      style: TextStyle(color: Colors.red, fontSize: 20)),
                  Container(
                    color: Colors.black,
                    child: TextButton(
                        onPressed: () {
                          GameController.startNewGame();
                          setState(() {});
                        },
                        child: const Text('Start New Game',
                            style: TextStyle(color: Colors.white))),
                  )
                ],
              )
          }),
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: GameController.randomSelectWord.map((letter) {
              return HiddenWord(
                  letter: letter,
                  hidden: !GameController.playerSelected.contains(letter));
            }).toList(),
          ),
          Center(
            child: Text('Attempts : ${GameController.playerAttempts} ',
                style: const TextStyle(color: Colors.white)),
          ),
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: GameController.alphabet.map((letter) {
              return GestureDetector(
                  onTap: () {
                    GameController.checkLetter(letter);
                    GameController.gameStatus = GameController.checkWin();
                    setState(() {});
                  },
                  child: Keyboard(
                    keyboardKey: letter,
                    letterStatus: GameController.letterStatus(letter),
                  ));
            }).toList(),
          ),
          const SizedBox(
            height: 20,
            child: Center(
                child: Text(
              'Aluno : Gustavo Brandao Tavares',
              style: TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
