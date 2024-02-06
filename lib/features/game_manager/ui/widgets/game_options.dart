import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/common/utils/constants.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_button.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameLevels.map((level) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GameButton(
            onPressed: () => context.goNamed(
              AppRoute.game.name,
              pathParameters: {'gameLevel': level['level'].toString()},
            ),
            title: level['title'],
            color: level['color']![700]!,
            width: 250,
          ),
        );
      }).toList(),
    );
  }
}
