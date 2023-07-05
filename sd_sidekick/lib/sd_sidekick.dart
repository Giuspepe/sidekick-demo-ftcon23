import 'dart:async';

import 'package:sd_sidekick/src/commands/clean_command.dart';
import 'package:sd_sidekick/src/vault.dart';
import 'package:sidekick_core/sidekick_core.dart';
import 'package:sd_sidekick/src/commands/foo_command.dart';
import 'package:sidekick_vault/sidekick_vault.dart';

Future<void> runSd(List<String> args) async {
  final runner = initializeSidekick(
    dartSdkPath: systemDartSdkPath(),
  );

  runner
    ..addCommand(DartCommand())
    ..addCommand(DepsCommand())
    ..addCommand(CleanCommand())
    ..addCommand(DartAnalyzeCommand())
    ..addCommand(FormatCommand())
    ..addCommand(SidekickCommand())
    ..addCommand(FooCommand())
    ..addCommand(VaultCommand(vault: vault));

  try {
    return await runner.run(args);
  } on UsageException catch (e) {
    print(e);
    exit(64); // usage error
  }
}
