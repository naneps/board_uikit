import 'package:board_uikit/app/commons/ui/button/common_button.dart';
import 'package:board_uikit/app/modules/board/controllers/board_controller.dart';
import 'package:board_uikit/app/modules/board/widgets/board_column_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class BoardMobileView extends GetView<BoardController> {
  const BoardMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //   controller.addColumnToStorage();
          controller.storage.erase();
        },
        child: const Icon(BoxIcons.bx_plus),
      ),
      body: SafeArea(child: Obx(() {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      style: Get.textTheme.titleMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(0),
                        ),
                        iconColor: MaterialStateProperty.all<Color>(
                          Get.theme.primaryColor,
                        ),
                        iconSize: MaterialStateProperty.all<double>(26),
                      ),
                      icon: const Icon(
                        BoxIcons.bx_filter,
                      ),
                      onPressed: () {},
                    ),
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
                children: [
                  ...List.generate(
                    controller.columns.length,
                    (index) {
                      final column = controller.columns[index];
                      return BoardColumnCard(
                        key: ValueKey(column.id),
                        column: column,
                      );
                    },
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                foregroundColor: Get.theme.primaryColor,
                onPressed: () {
                  controller.addColumnToStorage();
                },
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Add Column',
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      })),
    );
  }
}
