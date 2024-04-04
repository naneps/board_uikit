import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BoardDesktopView extends GetView {
  const BoardDesktopView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoardDesktopView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BoardDesktopView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
