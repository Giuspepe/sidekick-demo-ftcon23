import 'package:sidekick_core/sidekick_core.dart';
import 'package:test/test.dart';

void main() {
  test('test demo', () async {
    // e.g. 1234 Dart files with 56789 lines in sidekick_demo
    final regex = RegExp(r'^(\d+) Dart files with (\d+) lines in (.+)$');
    final progress = Progress.capture();

    // invoke the `sd foo` command
    '${SidekickContext.entryPoint.path} foo lib'.start(progress: progress);

    expect(progress.lines.last, matches(regex));
  });
}
