import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_git/git.dart';
import 'package:dart_git/git_hash.dart';

class CatFileCommand extends Command {
  @override
  final name = 'cat-file';

  @override
  final description =
      'Provide content or type and size information for repository objects';

  @override
  Future run() async {
    var repo = GitRepository(Directory.current.path);

    var objectSha1 = argResults.arguments[1];
    var obj = await repo.readObjectFromHash(GitHash(objectSha1));
    if (obj is GitBlob) {
      var s = utf8.decode(obj.blobData);
      print(s);
    }
  }
}
