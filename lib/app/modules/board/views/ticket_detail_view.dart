import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetailView extends GetView {
  String ticketId = Get.arguments ?? '';
  TicketDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketDetailView'),
        centerTitle: true,
      ),
      body: Hero(
        tag: ticketId,
        child: const Material(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "Xyz-123",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
