import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:sass/sass.dart';
import 'package:sass/src/sync_package_resolver/sync_package_resolver.dart';

main(args) => grind(args);

@DefaultTask('Build Scss Files')
sass() async {
  var css = render('lib/all.scss', packageResolver: await SyncPackageResolver.current);
  new File('lib/all.css').writeAsStringSync(css);
}
