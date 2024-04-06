import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:board_uikit/app/modules/board/widgets/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableTicket extends StatelessWidget {
  BoardTicketModel ticket;
  DraggableTicket({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: ticket,
      key: ValueKey(ticket.id),
      feedback: SizedBox(
        width: Get.width * 0.5,
        height: 110,
        child: TicketCard(
          ticket: ticket,
          key: ValueKey(
            ticket.id,
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.2,
        child: TicketCard(
          ticket: ticket,
          key: ValueKey(
            ticket.id,
          ),
        ),
      ),
      child: TicketCard(
        ticket: ticket,
        key: ValueKey(
          ticket.id,
        ),
      ),
    );
  }
}
