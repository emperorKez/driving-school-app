import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static List<String> languages() => ['en', 'sv'];

  static late SharedPreferences _prefs;

  static Future<void> initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<void> storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);

  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? svText = '',
  }) =>
      [enText, svText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return AppLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MessegesPage
  {
    'xrh9ls7e': {
      'en': 'Messeges',
      'sv': 'Meddelanden',
    },
    'lbkebfx7': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    '855asds0': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    'o6uyor6h': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    'frrs4vcj': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    'igaaa2ym': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    '007jm5e0': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    'xjczlvw4': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    'lnesxqa8': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    'pq1bkgcn': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    'iss64ghe': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    'xh9pcquy': {
      'en': 'Hello World',
      'sv': 'Hej världen',
    },
    '9cn5ifha': {
      'en': 'Hi There , I was Wondering',
      'sv': 'Hej på er, jag undrade',
    },
    '4tq5g144': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // HomePage
  {
    '1ekwtvmg': {
      'en': 'Featured',
      'sv': 'Utvalda',
    },
    'snfangq2': {
      'en': 'My Driving Academy',
      'sv': 'Min körskola',
    },
    'flao115p': {
      'en': '5.0',
      'sv': '5.0',
    },
    'o95bhky0': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': 'Bergmansgatan 20, 431 30 Mölndal',
    },
    'atnjhzok': {
      'en': 'Details',
      'sv': 'Detaljer',
    },
    'gb35yi7n': {
      'en': 'PROMOTED',
      'sv': 'FLYTTAD',
    },
    '1b7qr6xn': {
      'en': 'My Driving Academy',
      'sv': 'Min körskola',
    },
    'hihcilyx': {
      'en': '5.0',
      'sv': '5.0',
    },
    'grjny8ej': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': 'Bergmansgatan 20, 431 30 Mölndal',
    },
    'wlxvid9b': {
      'en': 'Details',
      'sv': 'Detaljer',
    },
    '4ioejxds': {
      'en': 'PROMOTED',
      'sv': 'FLYTTAD',
    },
    'rr1d1b1s': {
      'en': 'Next Up',
      'sv': 'Nästa upp',
    },
  },
  // LessonsPage
  {
    'whg9qc7z': {
      'en': 'Upcoming lessons',
      'sv': '',
    },
    'r2jjpfs9': {
      'en': '90 Min Traffic Light Drive',
      'sv': '',
    },
    '1ah7w6s9': {
      'en': 'Individual',
      'sv': '',
    },
    'mpj2vhg2': {
      'en': 'Completed Lessons : 4/10 Time: 90 Min',
      'sv': '',
    },
    'odpb9qhs': {
      'en': 'Book this Lesson',
      'sv': 'Detaljer',
    },
    '9okjeuc6': {
      'en': '90 Min Traffic Light Drive',
      'sv': '',
    },
    'mde8jmye': {
      'en': 'Individual',
      'sv': '',
    },
    'd3iey04q': {
      'en': 'Completed Lessons : 4/10 Time: 90 Min',
      'sv': '',
    },
    'tnf2419n': {
      'en': 'Book this Lesson',
      'sv': 'Detaljer',
    },
    'lcylgv3n': {
      'en': '90 Min Traffic Light Drive',
      'sv': '',
    },
    'mu4h67s5': {
      'en': 'Individual',
      'sv': '',
    },
    '0jp08b1t': {
      'en': 'Completed Lessons : 4/10 Time: 90 Min',
      'sv': '',
    },
    'aij9xam5': {
      'en': 'Book this Lesson',
      'sv': 'Detaljer',
    },
    '9c0mpdm6': {
      'en': 'Past lessons',
      'sv': '',
    },
    'ycgs9ob5': {
      'en': 'Class Assignment',
      'sv': '',
    },
    'xca4uvll': {
      'en': 'Duration : 90min | 2022/06/26',
      'sv': '',
    },
    'tlxi0i2r': {
      'en': 'Finished',
      'sv': '',
    },
    '10ogfx2e': {
      'en': 'Class Assignment',
      'sv': '',
    },
    'ycei5j10': {
      'en': 'Duration : 90min | 2022/06/26',
      'sv': '',
    },
    '61zok2sw': {
      'en': 'Finished',
      'sv': '',
    },
    '34f5no5g': {
      'en': 'Class Assignment',
      'sv': '',
    },
    'h5alfsn2': {
      'en': 'Duration : 90min | 2022/06/26',
      'sv': '',
    },
    'jefu5pgq': {
      'en': 'Finished',
      'sv': '',
    },
  },
  // BookingsPage
  {
    'jj93k9bo': {
      'en': 'Bookings',
      'sv': 'Bokningar',
    },
  },
  // SurveyPage
  {
    '2hrukwmu': {
      'en': 'Search (Location / Traffic School)',
      'sv': '',
    },
    'dfg36q09': {
      'en': 'My Driving Academy',
      'sv': '',
    },
    '93v0blza': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': '',
    },
    'hfuqjxjn': {
      'en': 'Reviews',
      'sv': '',
    },
    'pezyajws': {
      'en': '(56)',
      'sv': '',
    },
    '2xyheaec': {
      'en': '€ 259.00',
      'sv': '',
    },
    '9yobqued': {
      'en': '*Register before 30th you can Enjoy',
      'sv': '',
    },
    'yrjicy03': {
      'en': '125KM',
      'sv': '',
    },
    'mgsh0ezp': {
      'en': 'My Driving Academy',
      'sv': '',
    },
    'ne5xce3u': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': '',
    },
    '0c6tdxce': {
      'en': 'Reviews',
      'sv': '',
    },
    '12j7lpdn': {
      'en': '(56)',
      'sv': '',
    },
    '6zz0gmv4': {
      'en': '€ 259.00',
      'sv': '',
    },
    'czinhr34': {
      'en': '*Register before 30th you can Enjoy',
      'sv': '',
    },
    'ikviv3ry': {
      'en': '125KM',
      'sv': '',
    },
    '62wtizfx': {
      'en': 'My Driving Academy',
      'sv': '',
    },
    'mwrl08rt': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': '',
    },
    'dvnlpmyk': {
      'en': 'Reviews',
      'sv': '',
    },
    'im0xee3r': {
      'en': '(56)',
      'sv': '',
    },
    'jvhot4sh': {
      'en': '€ 259.00',
      'sv': '',
    },
    'e82dlaws': {
      'en': '*Register before 30th you can Enjoy',
      'sv': '',
    },
    'bmdsr2as': {
      'en': '125KM',
      'sv': '',
    },
  },
  // ProfilePage
  {
    '6umyby7v': {
      'en': 'Mikael Anders',
      'sv': 'Mikael Anders',
    },
    '0yd66z8t': {
      'en': '+462139564235',
      'sv': '+462139564235',
    },
    'lyxu6ojf': {
      'en': 'mikaelanders@gmail.com',
      'sv': 'mikaelanders@gmail.com',
    },
    'pwqf8hum': {
      'en': 'Personal Info',
      'sv': 'Personlig information',
    },
    'n3ghwmkv': {
      'en': 'Notifications',
      'sv': 'Aviseringar',
    },
    'ucatqvmk': {
      'en': 'Get Help',
      'sv': 'Få hjälp',
    },
    '2pqha0jl': {
      'en': 'Feedback',
      'sv': 'Respons',
    },
    'mnfrbgm2': {
      'en': 'Privacy',
      'sv': 'Integritet',
    },
    'fckydfax': {
      'en': 'Logout',
      'sv': 'Logga ut',
    },
    '6hm08gtp': {
      'en': 'Notifications',
      'sv': 'Aviseringar',
    },
  },
  // GetStartedPage
  {
    'vkxp6gbd': {
      'en': 'Learn and Enjoy Your Driving Session',
      'sv': 'Lär dig och njut av din körsession',
    },
    'bqibqpyv': {
      'en': 'Get Started',
      'sv': 'Komma igång',
    },
    'oxbm1daq': {
      'en': 'EN',
      'sv': 'SV',
    },
    'zqb6er0l': {
      'en': '|',
      'sv': '|',
    },
    'gnrqcgfm': {
      'en': 'SE',
      'sv': 'SE',
    },
    '21zzovbz': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // LoginPage
  {
    'x2l47gef': {
      'en': 'Hello Welcome!',
      'sv': 'Hej välkommen!',
    },
    'omdx5x0q': {
      'en': 'Enter your credentials to access your account.',
      'sv': 'Ange dina uppgifter för att komma åt ditt konto.',
    },
    'rsgciywr': {
      'en': 'Enter your email',
      'sv': 'Ange din e-postadress',
    },
    'gqfrgxsi': {
      'en': 'Password',
      'sv': 'Lösenord',
    },
    '2hhoevrv': {
      'en': 'Remember me',
      'sv': 'Kom ihåg mig',
    },
    'aaec8c0d': {
      'en': 'Reset Password',
      'sv': 'Återställ lösenord',
    },
    '0qtdy0bq': {
      'en': 'Get Started',
      'sv': 'Komma igång',
    },
    'hxycmkt3': {
      'en': 'Do not have an account?  ',
      'sv': 'Har du inget konto?',
    },
    'qw1jzcbe': {
      'en': 'Register here',
      'sv': 'Registrera här',
    },
    'yotcc5vk': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // SignUpPage
  {
    '7wp44zja': {
      'en': 'Welcome to ',
      'sv': 'Hej välkommen!',
    },
    'bekneprf': {
      'en': 'körbil',
      'sv': 'Hej välkommen!',
    },
    '8lwgfo91': {
      'en': 'Create Account',
      'sv': 'Ange dina uppgifter för att komma åt ditt konto.',
    },
    'xm86w4kn': {
      'en': 'First Name',
      'sv': 'Ange din e-postadress',
    },
    'x0hy1hgd': {
      'en': 'Last Name',
      'sv': 'Ange din e-postadress',
    },
    '7t4g3ukg': {
      'en': 'Enter your phone no',
      'sv': 'Ange din e-postadress',
    },
    'a85962kx': {
      'en': 'Enter your email',
      'sv': 'Ange din e-postadress',
    },
    'aj449x9t': {
      'en': 'Password',
      'sv': 'Lösenord',
    },
    'xudlm1hc': {
      'en': 'Password',
      'sv': 'Lösenord',
    },
    'pptkj47l': {
      'en': 'Get Started',
      'sv': 'Komma igång',
    },
    '3xu311of': {
      'en': 'I have a account',
      'sv': 'Har du inget konto?',
    },
    '2l5mv6fh': {
      'en': 'Sign in',
      'sv': 'Registrera här',
    },
    'utcc6uub': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // SurveyPageCopy
  {
    'x6b7qvfm': {
      'en': 'Tell us bit more about your practice history',
      'sv': 'Berätta lite mer om din träningshistoria',
    },
    '1raf8dgn': {
      'en': '4',
      'sv': '4',
    },
    'exbm85a6': {
      'en': 'years of practice',
      'sv': 'år av praktik',
    },
    'azt01nsw': {
      'en': 'Next',
      'sv': 'Nästa',
    },
    'rd132x4w': {
      'en': 'Have you obtained the Learner’s Permit?',
      'sv': 'Har du fått ett elevtillstånd?',
    },
    '7dsfl8by': {
      'en': 'No',
      'sv': 'Nej',
    },
    'o4x1zdiw': {
      'en': 'Yes',
      'sv': 'Ja',
    },
    'ppx4gofm': {
      'en': 'Have you completed \nRisk 1?',
      'sv': 'Har du genomfört\nRisk 1?',
    },
    'nmhcumsu': {
      'en': 'No',
      'sv': 'Nej',
    },
    '7qnphk7d': {
      'en': 'Yes',
      'sv': 'Ja',
    },
    'fc3pbjhu': {
      'en': 'Do you want a license for manual or automatic transmission?',
      'sv': 'Vill du ha licens för manuell eller automatisk växellåda?',
    },
    'xr6o0hqk': {
      'en': 'Manual',
      'sv': 'Manuell',
    },
    'lhzlmjyh': {
      'en': 'Automatic',
      'sv': 'Automatisk',
    },
  },
  // SingleAcademy
  {
    'zcpk9w3y': {
      'en': 'My Driving Academy',
      'sv': '',
    },
    'dmlkjs23': {
      'en': 'Bergmansgatan 20, 431 30 Mölndal',
      'sv': '',
    },
    '2a6pyw6k': {
      'en': 'Reviews',
      'sv': '',
    },
    'xfypi4zc': {
      'en': '(56)',
      'sv': '',
    },
    '251tytef': {
      'en': '+94 71 41 87 921',
      'sv': '',
    },
    'ryng7rft': {
      'en': 'June Offerd',
      'sv': '',
    },
    '4q5nn7gx': {
      'en': '*Register before 30th you can Enjoy',
      'sv': '',
    },
    'aqmavyty': {
      'en': '259.00 € ',
      'sv': '',
    },
    'rbc45g5u': {
      'en': 'Group Lessons',
      'sv': '',
    },
    '62heqj6y': {
      'en': 'Risk 1',
      'sv': '',
    },
    'ns8qxgt4': {
      'en': 'Available',
      'sv': '',
    },
    'fzo8rw6l': {
      'en': 'EN',
      'sv': '',
    },
    'fej6v3od': {
      'en': 'SW',
      'sv': '',
    },
    '9a39lic4': {
      'en': 'Button',
      'sv': '',
    },
    'z1bo1136': {
      'en': 'Details',
      'sv': '',
    },
    '9k9cftjp': {
      'en': 'Home',
      'sv': '',
    },
  },
  // Filter
  {
    'vna2y8u6': {
      'en': 'Select Language',
      'sv': '',
    },
    'v83xwzzd': {
      'en': 'Select Language',
      'sv': '',
    },
    'w5txi0ou': {
      'en': 'Vehicles Types',
      'sv': '',
    },
    'hzkr079h': {
      'en': 'Automatic',
      'sv': '',
    },
    'l0elstki': {
      'en': 'Manual',
      'sv': '',
    },
    '73v5dzy5': {
      'en': 'Select Language',
      'sv': '',
    },
    '1nd1phu0': {
      'en': 'Select Location',
      'sv': '',
    },
    'res4zpd9': {
      'en': 'Clear',
      'sv': '',
    },
    'nwtyt6hk': {
      'en': 'Filter',
      'sv': '',
    },
  },
].reduce((a, b) => a..addAll(b));
