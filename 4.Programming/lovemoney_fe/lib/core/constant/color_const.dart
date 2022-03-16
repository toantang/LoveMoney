import 'dart:ui';

class PrimaryColorConst {
  final Color _greenShade400 = const Color(0xff66BB6A);
  final Color _tealShade100 = const Color(0xffB2DFBD);
  final Color _blueShade200 = const Color(0xff90CAF9);

  Color get greenShade400 => _greenShade400;

  Color get tealShade100 => _tealShade100;

  Color get blueShade200 => _blueShade200;
}

class SecondaryColorConst {
  final Color _redShade400 = const Color(0xffE57373);
  final Color _lightBlueShade800 = const Color(0xff0277BD);

  Color get redShade400 => _redShade400;

  Color get lightBlueShade800 => _lightBlueShade800;
}

class MedialColorConst {
  final Color _white = const Color(0xffffffff);
  final Color _black = const Color(0xff000000);

  Color get white => _white;

  Color get black => _black;
}
class ColorConst {
  static final PrimaryColorConst primaryColorConst = PrimaryColorConst();
  static final SecondaryColorConst secondaryColorConst = SecondaryColorConst();
  static final MedialColorConst medialColorConst = MedialColorConst();

  /*PrimaryColorConst get primaryColorConst => _primaryColorConst;

  SecondaryColorConst get secondaryColorConst => _secondaryColorConst;

  MedialColorConst get medialColorConst => _medialColorConst;*/
}