import 'dart:math';

import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/help_topic_repo/models/help_topic.dart';
import 'package:korbil_mobile/theme/theme.dart';

class FaqCard extends StatefulWidget {
  const FaqCard({
    required this.helpTopic,
    super.key,
  });
  final HelpTopic helpTopic;

  @override
  State<FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: KorbilTheme.of(context).alternate1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.helpTopic.question ?? '',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: KorbilTheme.of(context).secondaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (_isExpanded)
                  Transform.rotate(
                    angle: pi / 180.0 * 90,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: KorbilTheme.of(context).primaryColor,
                    ),
                  )
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: KorbilTheme.of(context).primaryColor,
                  ),
              ],
            ),
            if (_isExpanded)
              const SizedBox(
                height: 7,
              )
            else
              Container(),
            if (_isExpanded)
              Text(widget.helpTopic.answer ?? '',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: KorbilTheme.of(context).secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
