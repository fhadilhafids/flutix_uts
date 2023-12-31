part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = const Color(0xFF503E9D);
Color accentColor1 = const Color(0xFF2C1F63);
Color accentColor2 = const Color(0xFFF8D460);
Color accentColor3 = const Color(0xFFADADAD);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);
TextStyle blueTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.blue, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont = GoogleFonts.openSans()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle yellowNumberFont = GoogleFonts.openSans()
    .copyWith(color: accentColor2, fontWeight: FontWeight.w500);
