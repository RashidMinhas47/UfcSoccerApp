import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playersListProvider =
    ChangeNotifierProvider((ref) => PlayersListProvider());

class PlayersListProvider extends ChangeNotifier {
  List<String> teamAPlayers = ["Team A"];
  List<String> teamBPlayers = ["Team B"];

  void fetchPlayers() {
    // Simulate fetching players' lists from an API or database
    teamAPlayers.insertAll(1, [
      'Player 1',
      'Player 2',
      'Player 3',
      'Player 4',
      'Player 4+1',
      'Player 4+2',
      'Player 7',
      'Player 8',
      'Player 9',
      'Player 0',
      'Player 11'
    ]);
    teamBPlayers.insertAll(1, [
      'Player A',
      'Player B',
      'Player C',
      'Player D',
      'Player E',
      'Player F',
      'Player G',
      'Player H',
      'Player I',
      'Player J',
      'Player K'
    ]);
    notifyListeners();
  }
}
