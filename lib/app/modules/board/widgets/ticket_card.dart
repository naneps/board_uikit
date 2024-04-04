import 'package:board_uikit/app/commons/ui/common_avatar.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCard extends StatelessWidget {
  final BoardTicketModel ticket;
  const TicketCard({
    required this.ticket,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ticket.id!,
      key: ValueKey(ticket.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 100,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  ticket.title!,
                  style: Get.textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        // dots
                        const Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Tag $index',
                          style: Get.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: Stack(
                children: [
                  // list avatar stacked
                  ...List.generate(3, (index) {
                    return Positioned(
                      left: index * 17.0,
                      child: CommonAvatar(
                        radius: 10,
                        imageUrl: 'https://i.pravatar.cc/300?img=$index',
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
