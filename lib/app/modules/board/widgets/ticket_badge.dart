import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketBadge extends StatelessWidget {
  Color color;
  String text;
  IconData icon;
  Color badgeColor;
  Color fontColor = Colors.black;
  bool isOutline;
  TicketBadge({
    super.key,
    this.fontColor = Colors.black,
    this.icon = Icons.circle,
    this.color = Colors.grey,
    this.badgeColor = Colors.white,
    this.text = 'Tag',
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: isOutline ? Colors.transparent : badgeColor,
        border: isOutline
            ? Border.all(
                color: badgeColor,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // dots
          Icon(
            icon,
            size: 10,
            color: color,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: Get.textTheme.labelSmall!.copyWith(
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}
