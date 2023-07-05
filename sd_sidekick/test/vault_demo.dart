import 'package:sd_sidekick/src/vault.dart';
import 'package:sidekick_core/sidekick_core.dart';
import 'package:test/test.dart';

void main() {
  test('decrypt throws without password', () {
    expect(
      () => vault.loadText('my_secret.txt.gpg'),
      throwsA(
        'Password in env.SD_VAULT_PASSPHRASE '
        'is not defined and user input was empty',
      ),
    );
  });

  test('decrypt with env var', () {
    envs.addAll({'SD_VAULT_PASSPHRASE': '1234'});
    final decryptedText = vault.loadText('my_secret.txt.gpg');
    expect(
      decryptedText,
      'I like pineapple on pizza\n',
    );
  });

  test('decrypt with vault.unlock', () {
    vault.unlock('1234');
    final decryptedText = vault.loadText('my_secret.txt.gpg');
    expect(
      decryptedText,
      'I like pineapple on pizza\n',
    );
  });
}
