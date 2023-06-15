import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? deText = '',
  }) =>
      [enText, arText, deText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1w2itfam': {
      'en': 'Threads',
      'ar': 'الخيوط',
      'de': 'Themen',
    },
    'oh25kjyu': {
      'en': 'Switch to Dark Mode',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'de': 'Wechseln Sie in den Dunkelmodus',
    },
    'e0m6oinn': {
      'en': 'Switch to Light Mode',
      'ar': 'قم بالتبديل إلى وضع الإضاءة',
      'de': 'Wechseln Sie in den Lichtmodus',
    },
    'di1f7cv0': {
      'en': 'Sign Out',
      'ar': 'خروج',
      'de': 'Austragen',
    },
    'w4r0mufi': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
    },
  },
  // LanguageSelection
  {
    'xit497ay': {
      'en': 'Please select...',
      'ar': 'الرجاء تحديد ...',
      'de': 'Bitte auswählen...',
    },
    '27xvnsqs': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'de': 'Nach einem Artikel suchen...',
    },
    'ylx33xsw': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
    },
    'c8loz2fg': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
    },
  },
  // NewThread
  {
    'bwz348do': {
      'en': 'Upload An Image (.jpg, .png, ..)',
      'ar': 'تحميل صورة (.jpg، .png، ..)',
      'de': 'Laden Sie ein Bild hoch (.jpg, .png, ..)',
    },
    '1s9apgyw': {
      'en': 'Upload PDF file',
      'ar': 'تحميل ملف PDF',
      'de': 'PDF-Datei hochladen',
    },
    'fj0k1fco': {
      'en': 'Start a new chat',
      'ar': 'ابدأ محادثة جديدة',
      'de': 'Starten Sie einen neuen Chat',
    },
    't40gdkiw': {
      'en': 'Please select a way to start chatting...',
      'ar': 'الرجاء تحديد طريقة لبدء الدردشة ...',
      'de': 'Bitte wählen Sie eine Möglichkeit, mit dem Chatten zu beginnen...',
    },
    'f2de2rb1': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'de': 'Nach einem Artikel suchen...',
    },
    'q9yn1ts9': {
      'en': 'Please select document language...',
      'ar': 'الرجاء تحديد لغة المستند ...',
      'de': 'Bitte wählen Sie die Dokumentsprache aus...',
    },
    '5gesai2h': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'de': 'Nach einem Artikel suchen...',
    },
    'a13rb3ap': {
      'en': 'Image Upload',
      'ar': 'خروج',
      'de': 'Austragen',
    },
    'b363ucdi': {
      'en': 'Upload pdf',
      'ar': 'تحميل الصور',
      'de': 'Bild hochladen',
    },
    'e83kkfe7': {
      'en': 'Start',
      'ar': 'بدأ',
      'de': 'Start',
    },
    'ye8328rs': {
      'en': 'New Thread',
      'ar': 'موضوع جديد',
      'de': 'Neues Thema',
    },
    'k37otuq8': {
      'en': 'Home',
      'ar': 'الرئيسية',
      'de': 'Heim',
    },
  },
  // ThreadPage
  {
    '2eqirg9o': {
      'en': 'Type here..',
      'ar': 'أكتب هنا..',
      'de': 'Geben Sie hier ein..',
    },
    'kxjjgci0': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
    },
  },
  // StartThread
  {
    'cn5j1oay': {
      'en': 'Start a new Thread',
      'ar': 'بدء موضوع جديد',
      'de': 'Starten Sie einen neuen Thread',
    },
  },
  // EmptyChat
  {
    'xc7iqeki': {
      'en': 'Seems you don’t have\n any messages',
      'ar': 'يبدو أنه ليس لديك أي رسائل',
      'de': 'Anscheinend haben Sie keine Nachrichten',
    },
    'jyf6wwy9': {
      'en': 'Start messaging now',
      'ar': 'ابدأ المراسلة الآن',
      'de': 'Beginnen Sie jetzt mit dem Versenden von Nachrichten',
    },
  },
  // HoldOnImThinking
  {
    '02tfhv7y': {
      'en': 'Hold On, ',
      'ar': '',
      'de': '',
    },
    '7rmb09nx': {
      'en': 'I\'m Thinking',
      'ar': '',
      'de': '',
    },
  },
  // Miscellaneous
  {
    '4i0krcuy': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'nh6ly40n': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'p9dlbw6l': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'ifm8t5gw': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'mbccvpxs': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'dzt8zxsk': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'mi22kec6': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'i76yfk16': {
      'en': '',
      'ar': '',
      'de': '',
    },
    '7qk9d806': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'fatqk2wr': {
      'en': '',
      'ar': '',
      'de': '',
    },
    '63rtl32e': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'ead834s6': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'jyk9unef': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'o0t1iz3v': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'dkkv5e7z': {
      'en': '',
      'ar': '',
      'de': '',
    },
    '440e1ws6': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'xakokvjk': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'v0rj44dr': {
      'en': '',
      'ar': '',
      'de': '',
    },
    '9l21szc8': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'dmzpv7t4': {
      'en': '',
      'ar': '',
      'de': '',
    },
    '719p30zs': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'q0bvrhhd': {
      'en': '',
      'ar': '',
      'de': '',
    },
    'btls0z38': {
      'en': '',
      'ar': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
