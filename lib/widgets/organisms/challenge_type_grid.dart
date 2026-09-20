import 'package:flutter/material.dart';

import '../../design_system/app_assets.dart';
import '../molecules/challenge_card.dart';

class ChallengeTypeGrid extends StatelessWidget {
  const ChallengeTypeGrid({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328,
      height: 296,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: ChallengeCard(
              title: 'Caminar',
              subtitle: '20 pasos',
              iconAsset: AppAssets.challengeWalk,
              selected: selectedIndex == 0,
              onTap: () => onSelected(0),
            ),
          ),
          Positioned(
            left: 172,
            top: 0,
            child: ChallengeCard(
              title: 'Escanear QR',
              subtitle: 'Código impreso',
              iconAsset: AppAssets.challengeQr,
              selected: selectedIndex == 1,
              onTap: () => onSelected(1),
            ),
          ),
          Positioned(
            left: 0,
            top: 156,
            child: ChallengeCard(
              title: 'Hablar',
              subtitle: 'Trabalenguas',
              iconAsset: AppAssets.challengeVoice,
              selected: selectedIndex == 2,
              onTap: () => onSelected(2),
            ),
          ),
        ],
      ),
    );
  }
}
