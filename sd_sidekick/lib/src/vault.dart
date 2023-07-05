import 'package:sidekick_core/sidekick_core.dart';
import 'package:sidekick_vault/sidekick_vault.dart';

final SidekickVault vault = SidekickVault(
  location: SidekickContext.projectRoot.directory('vault'),
  environmentVariableName: 'SD_VAULT_PASSPHRASE',
);
