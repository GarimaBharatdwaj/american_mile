import 'package:flutter/material.dart';
import '../utils/storage_util.dart';

class DeviceHelper {
  // ****************** Device Id Setup *********************** //
  static const String _onBoard = "on_board";

  static String? getOnBoard() {
    String? onBoard = StorageUtil.read<String>(_onBoard);
    return onBoard;
  }

  static Future<void> saveOnBoard(String onBoard) async {
    await StorageUtil.write(_onBoard, onBoard);
    debugPrint("Device ObBoard $onBoard is saved.");
  }

  // ****************** Device Id Setup *********************** //
  static const String _deviceIdKey = "device_id";

  static String? getId() {
    String? id = StorageUtil.read<String>(_deviceIdKey);
    return id;
  }

  static Future<void> saveId(String id) async {
    await StorageUtil.write(_deviceIdKey, id);
    debugPrint("Device id $id is saved.");
  }

  // ****************** User Token Setup *********************** //
  static const String _userTokenKey = "user_token";

  static String? getUserToken() {
    String? id = StorageUtil.read<String>(_userTokenKey);
    return id;
  }

  static Future<void> removeUserToken() async {
    await StorageUtil.clearKey(_userTokenKey);
  }

  static Future<void> saveUserToken(String token) async {
    await StorageUtil.write(_userTokenKey, token);
    debugPrint("User token $token is saved.");
  }
}
