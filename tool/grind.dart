import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:sass/sass_package_resolver.dart';

main(args) => grind(args);

@DefaultTask('Build Scss Files')
sass() async {
  var css = await render('web/style.scss');
  new File('web/style.css').writeAsStringSync(css);
}