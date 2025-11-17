import 'package:e_commerce_app/app/app.dart';
import 'package:e_commerce_app/app/extensions/localizations_extensions.dart';
import 'package:flutter/material.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.Localizations.selectLanguage),
      trailing: DropdownMenu<Locale>(
        dropdownMenuEntries: CraftyBay.languageController.supportedLocales.map(
          (locale) {
            return DropdownMenuEntry(value: locale, label: locale.languageCode);
          },
        ).toList(),
        onSelected: (Locale? locale) {
          CraftyBay.languageController.changeLocale(locale!);
        },
      ),
    );
  }
}
