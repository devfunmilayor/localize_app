import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localize_app/app_local.dart';
import 'package:localize_app/locale_fuc.dart';
import 'package:localize_app/provider/locale_vm.dart';
import 'package:provider/provider.dart';

void main() async {
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage? appLanguage;

  const MyApp({Key? key, this.appLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage!,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          // locale: model.appLocal,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.of(context)!.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: AppLang(),
        );
      }),
    );
  }
}
