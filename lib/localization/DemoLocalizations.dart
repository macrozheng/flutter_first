import 'package:flutter/material.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "main title": "flutter first demo",
      "localization title":"localization demo",
      "switch button text":"switch language",
      "language text":"english language",
    },
    "zh": {
      "main title": "flutter 首个示例",
      "localization title":"国际化示例",
      "switch button text": "切换语言",
      "language text": "中文",
    }
  };

  get mainTitle {
    return _localizedValues[locale.languageCode]["main title"];
  }

  get localizationTitle{
    print(locale.languageCode);
    return _localizedValues[locale.languageCode]["localization title"];
  }

  get switchButtonText{
    return _localizedValues[locale.languageCode]["switch button text"];
  }

  get languageText{
    return _localizedValues[locale.languageCode]["language text"];
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }
}
