import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> loadFamily(String family, List<String> files) async {
    final FontLoader loader = FontLoader(family);
    for (final String file in files) {
      loader.addFont(rootBundle.load(file));
    }
    await loader.load();
  }

  await loadFamily('Archivo', <String>[
    'assets/fonts/Archivo-Regular.ttf',
    'assets/fonts/Archivo-SemiBold.ttf',
    'assets/fonts/Archivo-Bold.ttf',
    'assets/fonts/Archivo-ExtraBold.ttf',
    'assets/fonts/Archivo-Black.ttf',
  ]);
  await loadFamily('Manrope', <String>[
    'assets/fonts/Manrope-Regular.ttf',
    'assets/fonts/Manrope-Medium.ttf',
    'assets/fonts/Manrope-SemiBold.ttf',
    'assets/fonts/Manrope-Bold.ttf',
  ]);

  final String? flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final File icons = File(
      '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
    );
    if (icons.existsSync()) {
      final FontLoader iconLoader = FontLoader('MaterialIcons')
        ..addFont(
          Future<ByteData>.value(ByteData.view(icons.readAsBytesSync().buffer)),
        );
      await iconLoader.load();
    }
  }

  await testMain();
}
