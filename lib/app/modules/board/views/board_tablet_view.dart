import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BoardTabletView extends GetView {
  const BoardTabletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoardTabletView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BoardTabletView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
