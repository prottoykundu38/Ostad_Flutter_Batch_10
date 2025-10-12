import 'package:e_commerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationsExtensions on BuildContext {
  AppLocalizations get Localizations {
    return AppLocalizations.of(this)!;
  }
}
