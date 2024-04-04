import 'package:board_uikit/app/commons/ui/button/common_icon_button.dart';
import 'package:board_uikit/app/commons/ui/input/common_field.dart';
import 'package:board_uikit/app/modules/board/controllers/board_controller.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class FormCreateBoardColumn extends StatelessWidget {
  const FormCreateBoardColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Create Column',
                style: Get.textTheme.labelLarge,
              ),
              const Spacer(),
              CommonIconButton(
                onPressed: () {},
                icon: Icons.close,
                iconColor: Colors.red,
                tooltip: 'Close',
              ),
              CommonIconButton(
                onPressed: () {
                  Get.find<BoardController>().addColumnToStorage();
                  Get.back();
                },
                icon: FontAwesome.check_solid,
                iconColor: Colors.green,
                tooltip: 'Save',
              ),
            ],
          ),
          CommonTextField(
            labelBehavior: FloatingLabelBehavior.always,
            hintText: 'eg: Todo, In Progress, Done',
            labelText: 'Column Name',
            onChanged: (value) {
              Get.find<BoardController>().newColumn.value.title = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Column name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          //   description
          CommonTextField(
            labelBehavior: FloatingLabelBehavior.always,
            hintText: 'eg: This is a description',
            labelText: 'Description',
            onChanged: (value) {
              Get.find<BoardController>().newColumn.value.description = value;
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ColorPicker(
              title: Text(
                'Pick a color ',
                style: Get.textTheme.bodySmall,
              ),
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(0),
              color: const Color(0xFff12333),
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.primary: true,
                ColorPickerType.accent: true,
                ColorPickerType.bw: false,
                ColorPickerType.custom: true,
                ColorPickerType.wheel: false,
              },
              onColorChanged: (val) {
                // get color value hex
                Get.find<BoardController>().newColumn.value.color =
                    val.value.toRadixString(16);
                // Color color = hexToColor(val.hex);
                // print(color);
              },
            ),
          )
        ],
      ),
    );
  }

  Color hexToColor(String code) {
    if (code.length != 7 || !code.startsWith('#')) {
      throw ArgumentError('Invalid hexadecimal color code: $code');
    }
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
