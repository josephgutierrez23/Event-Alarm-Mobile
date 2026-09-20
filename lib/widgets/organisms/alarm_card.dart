import 'package:flutter/material.dart';

import '../../design_system/colors.dart';
import '../../design_system/dimensions.dart';
import '../../design_system/radii.dart';
import '../../design_system/typography.dart';
import '../atoms/app_icon.dart';
import '../atoms/app_text.dart';
import '../molecules/app_switch.dart';
import '../atoms/section_overline.dart';
import '../molecules/time_display.dart';

class AlarmCardData {
  const AlarmCardData({
    required this.title,
    this.subtitle,
    this.time,
    this.period,
    this.isEvent = false,
    this.enabled = true,
    this.dots = const <String>[],
  });

  final String title;
  final String? subtitle;
  final String? time;
  final String? period;
  final bool isEvent;
  final bool enabled;
  final List<String> dots;

  AlarmCardData copyWith({
    String? title,
    String? subtitle,
    String? time,
    String? period,
    bool? isEvent,
    bool? enabled,
    List<String>? dots,
  }) {
    return AlarmCardData(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      time: time ?? this.time,
      period: period ?? this.period,
      isEvent: isEvent ?? this.isEvent,
      enabled: enabled ?? this.enabled,
      dots: dots ?? this.dots,
    );
  }
}

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key, required this.data, this.onTap, this.onToggle});

  final AlarmCardData data;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onToggle;

  @override
  Widget build(BuildContext context) {
    final Widget card = Container(
      width: AppDimensions.controlWidth,
      height: AppDimensions.alarmCardHeight,
      decoration: BoxDecoration(
        color: AppColors.noche800,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.noche600),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (data.isEvent)
            const Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: ColoredBox(
                color: AppColors.live,
                child: SizedBox(width: AppDimensions.eventAccentWidth),
              ),
            ),
          Positioned(
            left: data.isEvent ? 16 : 16,
            top: 14,
            right: 72,
            child: data.isEvent
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionOverline(
                        'POR EVENTO',
                        color: AppColors.live,
                      ),
                      const SizedBox(height: 2),
                      AppText(data.title, style: AppTypography.highlighted),
                      AppText(
                        data.subtitle ?? '',
                        style: AppTypography.eventOptionSubtitle,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TimeDisplay(time: data.time ?? '', period: data.period),
                      const SizedBox(height: 2),
                      AppText(
                        data.title,
                        style: AppTypography.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
          Positioned(
            right: 12,
            top: 16,
            child: AppSwitch(value: data.enabled, onChanged: onToggle),
          ),
          Positioned(left: 16, bottom: 14, child: _Dots(assets: data.dots)),
        ],
      ),
    );

    final Widget tappable = GestureDetector(onTap: onTap, child: card);
    if (data.enabled) return tappable;
    return Opacity(opacity: 0.42, child: tappable);
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.assets});

  final List<String> assets;

  @override
  Widget build(BuildContext context) {
    if (assets.isEmpty) return const SizedBox.shrink();
    return Row(
      children: [
        for (int i = 0; i < assets.length; i++) ...[
          if (i > 0 &&
              ((assets.length >= 4 && i == 2) || (assets.length < 4 && i == 1)))
            Container(
              width: 1,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.noche600,
            ),
          AppIcon(assets[i], size: 6),
          if (i != assets.length - 1 &&
              !((assets.length >= 4 && i == 1) ||
                  (assets.length < 4 && i == 0)))
            const SizedBox(width: 6),
        ],
      ],
    );
  }
}
