import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../model/notification_card.dart';

/// [LastNotificationCard] is the topmost card on the stack

class LastNotificationCard extends StatelessWidget {
  final AnimationController controller;
  final Widget notification;
  final int totalCount;
  final double cornerRadius;
  final Color color;
  final double height;
  final String notificationCardTitle;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;
  final double padding;

  const LastNotificationCard({
    Key? key,
    required this.controller,
    required this.notification,
    required this.totalCount,
    required this.color,
    required this.cornerRadius,
    required this.height,
    required this.notificationCardTitle,
    required this.subtitleTextStyle,
    required this.titleTextStyle,
    required this.boxShadow,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: totalCount > 1 && controller.value <= 0.4,
      child: GestureDetector(
        key: ValueKey('onTapExpand'),
        onTap: () {
          Slidable.of(context)?.close();
          controller.forward();
        },
        child: Container(
          key: ValueKey('LastNotificationCard'),
          margin: EdgeInsets.symmetric(horizontal: padding),
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(cornerRadius),
            boxShadow: boxShadow,
          ),
          child: Stack(
            children: [
              Transform.translate(
                offset: Tween<Offset>(
                  begin: Offset(0, 15),
                  end: Offset(0, 10),
                )
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: Interval(0.0, 0.2),
                      ),
                    )
                    .value,
                child: Visibility(
                    visible: controller.value <= 0.2, child: notification),
              ),
              Transform.translate(
                offset: Tween<Offset>(
                  begin: Offset(0, 10),
                  end: Offset(0, 50),
                )
                    .animate(
                      CurvedAnimation(
                        parent: controller,
                        curve: Interval(0.2, 0.4),
                      ),
                    )
                    .value,
                child: Visibility(
                    visible: controller.value >= 0.2, child: notification),
              ),
              Positioned(
                bottom: 16,
                child: Opacity(
                  opacity: Tween(begin: 1.0, end: 0.0)
                      .animate(
                        CurvedAnimation(
                          parent: controller,
                          curve: Interval(0.0, 0.2),
                        ),
                      )
                      .value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      '${totalCount - 1} more notification',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
