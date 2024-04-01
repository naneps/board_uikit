import 'package:board_uikit/app/commons/theme.dart';
import 'package:board_uikit/app/commons/ui/button/common_button.dart';
import 'package:board_uikit/app/models/board_column_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BoardColumnCard extends StatelessWidget {
  final BoardColumnModel column;

  const BoardColumnCard({
    super.key,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      key: ValueKey(column.id),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // only top
        border: Border(
          top: BorderSide(
            color: Color(int.parse(column.color!)),
            width: 3,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Obx(() {
        return ExpansionTile(
          clipBehavior: Clip.antiAlias,
          tilePadding: EdgeInsets.zero,
          key: ValueKey(column.id),
          leading: Icon(
            BoxIcons.bx_circle,
            color: Color(int.parse(column.color!)),
          ),
          trailing: IconButton(
            icon: const Icon(BoxIcons.bx_dots_vertical_rounded),
            onPressed: () {},
          ),
          subtitle: Text(
            '${column.tickets!.length} Tickets | ${column.createdAt}',
            style: Get.textTheme.labelSmall,
          ),
          title: Text(
            key: ValueKey(column.id),
            column.title!,
            style: Get.textTheme.labelMedium,
          ),
          childrenPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          children: [
            ...column.tickets!.map(
              (ticket) => ListTile(
                key: ValueKey(ticket.id),
                title: Text(
                  ticket.title!,
                  style: Get.textTheme.labelMedium,
                ),
              ),
            ),
            CustomButton(
              paddingHorizontal: 5,
              paddingVertical: 10,
              borderRadius: 5,
              foregroundColor: DefaultTheme.successColor,
              fixedSize: Size(Get.width, 20),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    BoxIcons.bx_plus_circle,
                    color: DefaultTheme.successColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Add Ticket',
                    style: Get.textTheme.labelSmall!.copyWith(),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
