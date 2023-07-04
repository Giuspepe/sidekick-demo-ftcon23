import 'package:sidekick_core/sidekick_core.dart';

class FooCommand extends Command {
  @override
  final String description = 'TODO: Add description';

  @override
  final String name = 'foo';
  
  FooCommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      help: '', // TODO add help
    );
    argParser.addFlag(
      'force',
      abbr: 'f',
      help: '', // TODO add help
    );
  }
  
  @override
  Future<void> run() async {
    final String? nameArg = argResults!['name'] as String?;
    final bool force = argResults!['force'] as bool;
    final String? path = argResults!.rest.firstOrNull;
    
    final apiPackage = SidekickContext.projectRoot
     .directory('packages/sd_api');
    
    print(green('$name finished successfully 🎉'));
    // TODO implement your logic
  }
}
