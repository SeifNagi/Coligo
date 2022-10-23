import 'package:coligo/l10n/supported_locale.dart';
import 'package:coligo/presenation/page/main_page.dart';
import 'package:coligo/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<LocalProvider>(
    create: (context) => LocalProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalProvider>(builder: (context, appState, child) {
      return MaterialApp(
        title: 'Coligo',
        locale: Provider.of<LocalProvider>(context).locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: L10n.support,
        debugShowCheckedModeBanner: false,
        home: const MainPage(
          isLogin: false,
        ),
      );
    });
  }
}
