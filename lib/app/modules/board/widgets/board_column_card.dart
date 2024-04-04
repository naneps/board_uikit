import 'package:board_uikit/app/commons/ui/button/common_button.dart';
import 'package:board_uikit/app/models/board_column_model.dart';
import 'package:board_uikit/app/modules/board/controllers/board_column_controller.dart';
import 'package:board_uikit/app/modules/board/controllers/board_controller.dart';
import 'package:board_uikit/app/modules/board/widgets/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BoardColumnCard extends GetView<BoardColumnController> {
  final BoardColumnModel column;

  const BoardColumnCard({
    super.key,
    required this.column,
  });

  @override
  get controller => Get.put(
        BoardColumnController(
          column: column,
        ),
        tag: column.id,
      );
  @override
  get tag => column.id;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      key: ValueKey(column.id),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          top: BorderSide(
            color: Color(column.colorHex),
            width: 2,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Obx(
        () {
          return ExpansionTile(
            controller: controller.expansionTileController,
            clipBehavior: Clip.antiAlias,
            tilePadding: EdgeInsets.zero,
            initiallyExpanded: column.isExpanded.value,
            key: ValueKey(column.id),
            leading: Icon(
              BoxIcons.bx_circle,
              color: Color(column.colorHex),
            ),
            trailing: DropdownButton<dynamic>(
              icon: Icon(
                FontAwesome.ellipsis_vertical_solid,
                color: Get.theme.primaryColor,
              ),
              underline: Container(),
              borderRadius: BorderRadius.circular(5),
              padding: EdgeInsets.zero,
              items: [
                DropdownMenuItem<dynamic>(
                  alignment: Alignment.center,
                  value: 'Edit',
                  child: Text(
                    'Edit',
                    style: Get.textTheme.labelMedium,
                  ),
                ),
                DropdownMenuItem<dynamic>(
                  alignment: Alignment.center,
                  value: 'Delete',
                  onTap: () {
                    // controller.deleteColumnFromStorage(column);
                    Get.find<BoardController>().removeColumn(column.id!);
                  },
                  child: Text(
                    'Delete',
                    style: Get.textTheme.labelMedium,
                  ),
                ),
              ],
              style: Get.textTheme.labelMedium,
              onChanged: (Object? value) {},
            ),
            subtitle: Text(
              '${column.description} | ${column.tickets!.length} Tickets',
              style: Get.textTheme.bodySmall,
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
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                constraints: BoxConstraints(
                  maxHeight: Get.height * 0.5,
                ),
                child: ReorderableListView(
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    controller.reorderTickets(oldIndex, newIndex);
                  },
                  children: [
                    ...column.tickets!.map((ticket) {
                      return Draggable(
                        hitTestBehavior: HitTestBehavior.translucent,
                        data: ticket,
                        onDragStarted: () {
                          print('onDragStarted');
                          //   controller.onDragStarted(ticket);
                        },
                        onDragEnd: (details) {
                          print('onDragEnd');
                          //   controller.onDragEnd(ticket);
                        },
                        onDragCompleted: () {
                          print('onDragCompleted');
                          //   controller.onDragCompleted(ticket);
                        },
                        onDraggableCanceled: (velocity, offset) {
                          print('onDraggableCanceled');
                          //   controller.onDraggableCanceled(ticket);
                        },
                        onDragUpdate: (details) {
                          print('onDragUpdate');
                          //   controller.onDragUpdate(ticket);
                        },
                        rootOverlay: true,
                        key: ValueKey(ticket.id),
                        feedback: SizedBox(
                          width: Get.width * 0.9,
                          height: 120,
                          child: Center(
                            child: TicketCard(
                              ticket: ticket,
                              key: ValueKey(
                                ticket.id,
                              ),
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
                      )
                          .animate(
                              key: ValueKey(
                            ticket.id,
                          ))
                          .fadeIn();
                    }).toList()
                  ],
                ),
              ),
              CustomButton(
                fixedSize: Size(Get.width, 20),
                contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.grey[100],
                borderRadius: 2,
                onPressed: () {
                  Get.find<BoardController>().addTicket(column.id!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      BoxIcons.bx_plus,
                      size: 15,
                      color: Colors.black38,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Add Ticket',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
//
}
