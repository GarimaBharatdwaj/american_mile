import 'package:american_mile/app/a_mile_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.init();
  runApp(const AMileApp());
}
