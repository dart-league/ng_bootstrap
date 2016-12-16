import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:sass/sass.dart';

main(args) => grind(args);

@DefaultTask('Build Scss Files')
sass() async {
  var css = await render('lib/all.scss');
  new File('lib/all.css').writeAsStringSync(css);
}
