import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_match_game/features/game_session/services/game_sessions_api_service.dart';
import 'package:memory_match_game/models/ModelProvider.dart';

final gameSessionsRepositoryProvider = Provider<GameSessionsRepository>((ref) {
  final gameSessionsAPIService = ref.read(gameSessionsAPIServiceProvider);
  return GameSessionsRepository(gameSessionsAPIService);
});

class GameSessionsRepository {
  GameSessionsRepository(this.gameSessionsAPIService);

  final GameSessionsAPIService gameSessionsAPIService;

  Future<List<GameSession>> getGameSessions() {
    return gameSessionsAPIService.getGameSessions();
  }

  Future<void> create(GameSession gameSession) async {
    return gameSessionsAPIService.createGameSession(gameSession);
  }
}

