import 'package:sidekick_core/sidekick_core.dart';

class FooCommand extends Command {
  @override
  final String description = 'Returns length (in lines (default) or characters) of all Dart files\n'
      'Counts all Dart files in given path, including nested ones\n'
      'Defaults to project root if no path is given\n'
      'Returns non-zero exit code if no Dart files are found';

  @override
  final String name = 'foo';

  @override
  String get invocation => 'foo [--mode] [path]';

  FooCommand() {
    argParser.addOption(
      'mode',
      abbr: 'm',
      help: 'Whether to count lines or characters',
      allowed: ['lines', 'chars'],
      defaultsTo: 'lines',
    );
  }

  @override
  Future<void> run() async {
    final String mode = argResults!['mode'] as String;
    final String? path = argResults!.rest.firstOrNull;

    final baseDirectory = path != null ? Directory(path) : SidekickContext.projectRoot;
    final allFiles = baseDirectory
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));

    if (allFiles.isEmpty) {
      print(red('There are no Dart files in ${baseDirectory.path} :('));
      exitCode = 13;
      return;
    }

    final int count = switch (mode) {
      'lines' => allFiles.map((file) => file.readAsLinesSync().length).sum(),
      'chars' => allFiles.map((file) => file.readAsStringSync().length).sum(),
      _ => throw StateError("Unknown mode: '$mode'"), // unreachable
    };

    print('${allFiles.length} Dart files with $count $mode in ${baseDirectory.path}');
  }
}
