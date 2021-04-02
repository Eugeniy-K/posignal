import 'dart:io';
import 'package:path_provider/path_provider.dart';

class NumberStorage {

  //локальный путь
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //ссылка на метоположение файла
  Future<File> localFile(String file) async {
    final path = await _localPath;
    return File('$path/$file');
  }
  //создание файла
  Future<File> createFile(String name) async {
    final path = await _localPath;
    return File('$path/$name').create();
  }

  //удаление файла
  Future<int> deleteFile(String name) async {
    try {
      final file = await localFile(name);
      await file.delete();
    } catch (e) {return 0;}
  }

  Future<bool> checkFile(String fileName) async {
    final path = await _localPath;
    var savePath = '$path/$fileName';

    if (await File(savePath).exists()) {
      return true;
    } else return false;
  }
}