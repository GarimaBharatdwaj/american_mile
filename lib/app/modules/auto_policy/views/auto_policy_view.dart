import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auto_policy_controller.dart';

class AutoPolicyView extends GetView<AutoPolicyController> {
  const AutoPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoPolicyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AutoPolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
