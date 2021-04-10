import 'dart:math';
import 'package:get/get.dart';

//User defined enum for match status
enum PlayerStatus {
  win,
  lost,
  matchContinue,
  matchDraw,
}

enum GameDifficulty {
  Easy,
  Hard,
}

//Controller to be used
class TicTacController extends GetxController {
  var botStreak = 0.obs;
  var difficulty = GameDifficulty.Easy.obs;

  //Tic-Tac-Toe Board
  Map<int, String> btValues = {
    0: '',
    1: '',
    2: '',
    3: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: '',
  }.obs;

  var playerStreak = 0.obs;

  String _bot = 'O';
  String _player = 'X';

  PlayerStatus changePositionalValue(int position) {
    if (!_positionAvailable(position)) return PlayerStatus.matchContinue;
    btValues[position] = _player;
    PlayerStatus currentStatus = _matchStatus();
    if (currentStatus == PlayerStatus.win) {
      return _matchStatus();
    }
    difficulty.value == GameDifficulty.Easy ? _easyBotPlay() : _minimaxBotPlay();
    return _matchStatus();
  }

  //Resetting board to the Original state for NEW GAME
  void resetBoard() {
    for (var i = 0; i < btValues.length; i++) {
      btValues[i] = '';
    }
  }

  //Finding the current match status
  PlayerStatus _matchStatus() {
    var status = _findStatus(0, 1, 2);
    if (status == null) status = _findStatus(3, 4, 5);
    if (status == null) status = _findStatus(6, 7, 8);
    if (status == null) status = _findStatus(0, 3, 6);
    if (status == null) status = _findStatus(1, 4, 7);
    if (status == null) status = _findStatus(2, 5, 8);
    if (status == null) status = _findStatus(0, 4, 8);
    if (status == null) status = _findStatus(2, 4, 6);
    if (_isDraw() && status == null) status = PlayerStatus.matchDraw;
    if (status == null) return PlayerStatus.matchContinue;
    return status;
  }

  //Random play by the _bot
  void _easyBotPlay() {
    bool validPlay = false;
    for (var i = 0; i < btValues.length; i++) {
      if (btValues[i] == '') {
        validPlay = true;
        break;
      }
    }
    if (!validPlay) return;
    var rng = new Random();
    int newPosition;
    do {
      newPosition = rng.nextInt(10);
    } while (btValues[newPosition] != '');
    btValues[newPosition] = _bot;
  }

  //Competitive Hardcore play by the _bot
  void _minimaxBotPlay() {
    int bestScore = -800;
    int bestMove = 0;
    int score;
    for (var i = 0; i < btValues.length; i++) {
      if (btValues[i] == '') {
        btValues[i] = _bot;
        score = _minimax(btValues, false);
        btValues[i] = '';
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    btValues[bestMove] = _bot;
  }

  _minimax(Map<int, String> board, isMaximizing) {
    if (_checkWhichMarkerWon(btValues, _bot)) {
      return 1;
    } else if (_checkWhichMarkerWon(btValues, _player)) {
      return -1;
    } else if (_isDraw()) {
      return 0;
    }
    if (isMaximizing) {
      int bestScore = -800;
      int score;
      for (var key = 0; key < board.length; key++) {
        if (board[key] == '') {
          board[key] = _bot;
          score = _minimax(board, false);
          board[key] = '';
          if (score > bestScore) bestScore = score;
        }
      }
      return bestScore;
    } else {
      int bestScore = 800;
      int score;
      for (var key = 0; key < board.length; key++) {
        if (board[key] == '') {
          board[key] = _player;
          score = _minimax(board, true);
          board[key] = '';
          if (score < bestScore) bestScore = score;
        }
      }
      return bestScore;
    }
  }

  bool _checkWhichMarkerWon(Map<int, String> board, String mark) {
    if (board[0] == board[1] && board[0] == board[2] && board[0] == mark)
      return true;
    else if (board[3] == board[4] && board[3] == board[5] && board[3] == mark)
      return true;
    else if (board[6] == board[7] && board[6] == board[8] && board[6] == mark)
      return true;
    else if (board[0] == board[3] && board[0] == board[6] && board[0] == mark)
      return true;
    else if (board[1] == board[4] && board[1] == board[7] && board[1] == mark)
      return true;
    else if (board[2] == board[5] && board[2] == board[8] && board[2] == mark)
      return true;
    else if (board[0] == board[4] && board[0] == board[8] && board[0] == mark)
      return true;
    else if (board[6] == board[4] && board[6] == board[2] && board[6] == mark)
      return true;
    else
      return false;
  }

  //Finding whether the position is free on the tic tac toe board
  bool _positionAvailable(int ind) {
    if (btValues[ind] == '') return true;
    return false;
  }

  //Finding whether the match is draw
  bool _isDraw() {
    for (var i = 0; i < btValues.length; i++) {
      if (btValues[i] == '') {
        return false;
      }
    }
    return true;
  }

  //Finding whether the player is Won or Lost
  PlayerStatus _findStatus(int ind1, int ind2, int ind3) {
    if (btValues[ind1] != '' &&
        btValues[ind1] == btValues[ind2] &&
        btValues[ind1] == btValues[ind3]) {
      if (btValues[ind1] == _player) {
        return PlayerStatus.win;
      } else {
        return PlayerStatus.lost;
      }
    }
    return null;
  }
}
