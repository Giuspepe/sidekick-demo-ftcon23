import 'package:sidekick_core/sidekick_core.dart';

class BazCommand extends Command {
  @override
  final String description = 'Sample command';

  @override
  final String name = 'baz';

  BazCommand() {
    // add parameters here with argParser.addOption
  }

  @override
  Future<void> run() async {
    // please implement me
    print('Greetings from PHNTM!');
  }
}
