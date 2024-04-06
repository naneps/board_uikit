import 'package:board_uikit/app/commons/ui/common_avatar.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:board_uikit/app/modules/board/views/ticket_detail_view.dart';
import 'package:board_uikit/app/modules/board/widgets/ticket_badge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

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
      child: Material(
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
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => TicketDetailView(),
                        arguments: ticket.id!,
                      );
                    },
                    child: Text(
                      "Xyz-123",
                      style: Get.textTheme.labelMedium,
                    ),
                  ),
                  Text(
                    " | ",
                    style: Get.textTheme.labelMedium,
                  ),
                  Text(
                    ticket.title!,
                    style: Get.textTheme.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  TicketBadge(
                    badgeColor: Colors.red.withOpacity(0.3),
                    color: Colors.red,
                    icon: Icons.priority_high,
                    text: 'High',
                  ),
                  TicketBadge(
                    // icon: Icons.circle,
                    // severity
                    badgeColor: Colors.orange.withOpacity(0.3),
                    icon: Icons.warning_amber_rounded,
                    color: Colors.orange,
                    text: 'Critical',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 20,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            10,
                            (index) {
                              return TicketBadge(
                                color: Colors.primaries[index],
                                text: 'Tag $index',
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    //   severity , priority
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // list avatar stacked
                          ...List.generate(3, (index) {
                            return Positioned(
                              left: index * 17.0,
                              child: CommonAvatar(
                                radius: 10,
                                imageUrl:
                                    'https://i.pravatar.cc/300?img=$index',
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  // icon count comment
                  const Icon(
                    FontAwesome.comment_dots,
                    size: 20,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '12',
                    style: Get.textTheme.labelSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
