import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:sass_builder/phase.dart';
import 'package:dson/phase.dart';

Future main() async {
  await build(new PhaseGroup()..addPhase(sassPhase)..addPhase(
      dsonPhase('ng_bootstrap_gh_page', const ['web/**.dart'])),
      deleteFilesByDefault: true);
}