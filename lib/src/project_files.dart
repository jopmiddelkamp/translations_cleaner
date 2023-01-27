import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

/// Get a list of all `.dart` files in the project
List<FileSystemEntity> getDartFiles() {
  final path = Directory.current.path;
  final dartFile = Glob("$path/lib/**.dart", recursive: true);
  final dartFiles = <FileSystemEntity>[];

  final entities = dartFile.listSync(followLinks: false);
  for (var entity in entities) {
    dartFiles.add(entity);
  }

  return dartFiles;
}
