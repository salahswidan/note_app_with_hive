import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper<T> {
  String boxName;
  HiveHelper(this.boxName);
  // CRUD

  // Open box
  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  // Close box
  Future<void> closeBox(Box<T> box) async {
    return await box.close();
  }

  // Add value
  Future<void> addValue({required String key, required T value}) async {
    Box<T> box = await openBox();
    try {
      await box.put(key, value);
    } finally {
      await closeBox(box);
    }
  }

  // update value
  Future<bool> updateValue({required String key, required T value}) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);
      if (founded == true) {
        await box.put(key, value);
      }
    } finally {
      await closeBox(box);
    }
    return founded;
  }

  // delete value
  Future<bool> deleteValue({required String key}) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);
      if (founded == true) {
        await box.delete(key);
      }
    } finally {
      await closeBox(box);
    }
    return founded;
  }

  // read value
  Future<T?> getValue({required String key}) async {
    Box<T> box = await openBox();
    T? data;
    try {   
      data =  await box.get(key);     
    } finally {
      await closeBox(box);
    }
    return data;
  }
  Future<Map<dynamic,T?>> getAllData() async {
    Box<T> box = await openBox();
    Map<dynamic,T>? data;
    try {   
      data =  await box.toMap();     
    } finally {
      await closeBox(box);
    }
    return data;
  }
}
