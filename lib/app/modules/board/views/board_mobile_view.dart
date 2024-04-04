import 'package:board_uikit/app/commons/theme.dart';
import 'package:board_uikit/app/commons/ui/button/common_button.dart';
import 'package:board_uikit/app/commons/ui/button/common_icon_button.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:board_uikit/app/modules/board/controllers/board_controller.dart';
import 'package:board_uikit/app/modules/board/widgets/board_column_card.dart';
import 'package:board_uikit/app/modules/board/widgets/form_craete_board_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BoardMobileView extends GetView<BoardController> {
  const BoardMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.3, 0.7, 0.9],
              colors: [
                DefaultTheme.primaryColor,
                DefaultTheme.primaryColor,
                DefaultTheme.primaryColor.withOpacity(0.8),
                DefaultTheme.primaryColor.withOpacity(0.6),
              ],
            ),
          ),
          child: Obx(
            () {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/29754870?v=4',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Board UIKit',
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          CommonIconButton(
                            onPressed: () {
                              controller.toggleAllExpansionTiles();
                            },
                            icon: BoxIcons.bx_filter,
                            tooltip: 'Filter',
                            borderRadius: 100,
                          ),
                          // switch theme
                        ],
                      ),
                    ),
                  ),
                  //  orderrablelist
                  SliverToBoxAdapter(
                    child: ReorderableListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      onReorder: (oldIndex, newIndex) {
                        controller.reorderColumns(oldIndex, newIndex);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      children: [
                        ...List.generate(
                          controller.columns.length,
                          (index) {
                            final column = controller.columns[index];
                            return DragTarget<BoardTicketModel>(
                              key: ValueKey(column.id),
                              onWillAccept: (data) {
                                print('onWillAccept');
                                return true;
                              },
                              onAccept: (data) {
                                print('onAccept');
                                controller.onDragAccept(data, column);
                              },
                              builder: (context, candidateData, rejectedData) =>
                                  BoardColumnCard(
                                key: ValueKey(column.id),
                                column: column,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      foregroundColor: Colors.white,
                      onPressed: () {
                        showFormAddNew();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          Text(
                            ' Add Column',
                            style: Get.textTheme.labelMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  showFormAddNew() {
    Get.bottomSheet(
      const FormCreateBoardColumn(),
      isScrollControlled: true,
    );
  }
}
