import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TicketDetailView extends GetView {
  const TicketDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TicketDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
