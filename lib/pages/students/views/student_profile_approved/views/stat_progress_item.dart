import 'package:flutter/material.dart';
import 'package:korbil_mobile/components/custom_screen_padding.dart';
import 'package:korbil_mobile/theme/theme.dart';

class StatProgressItem extends StatelessWidget {
  const StatProgressItem({
    super.key,
    required this.s,
    required this.progress,
    required this.title,
  });

  final Size s;
  final String title;
  final int progress;

  @override
  Widget build(BuildContext context) {
    return CustomScreenPadding(
      child: Row(
        children: [
          SizedBox(
            width: s.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 17,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$progress.0',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                _ProgressIndicator(progress: progress),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    super.key,
    required this.progress,
  });

  final int progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        color: KorbilTheme.of(context).alternate1,
        height: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SingleProgressBar(progress: progress, index: 1),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 2),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 3),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 4),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 5),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 6),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 7),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 8),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 9),
            const SizedBox(
              width: 2,
            ),
            _SingleProgressBar(progress: progress, index: 10),
          ],
        ),
      ),
    );
  }
}

class _SingleProgressBar extends StatelessWidget {
  const _SingleProgressBar({
    super.key,
    required this.progress,
    required this.index,
  });

  final int progress;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: progress >= index
            ? KorbilTheme.of(context).primaryColor
            : KorbilTheme.of(context).alternate1,
      ),
    );
  }
}
