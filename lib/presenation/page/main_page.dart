import 'package:coligo/presenation/page/components/announcements_back.dart';
import 'package:coligo/presenation/widgets/customized_button.dart';
import 'package:coligo/presenation/widgets/customized_textfield.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:coligo/presenation/page/components/duedate_back.dart';
import 'package:coligo/presenation/page/components/exams_container.dart';
import 'package:coligo/presenation/page/components/side_menu.dart';
import 'package:coligo/presenation/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/language_model.dart';
import '../../provider/locale_provider.dart';

class MainPage extends StatefulWidget {
  final bool isLogin;
  const MainPage({super.key, required this.isLogin});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LanguageModel? _choosenValue;
  final List<LanguageModel> _languages = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _languages.add(LanguageModel(code: 'en', name: 'English'));
    _languages.add(LanguageModel(code: 'ar', name: 'Arabic'));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppLocalizations.of(context).appTitle,
              style: TextStyle(
                  color: grey, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CustomizedTextField(
                hintTextData: AppLocalizations.of(context).search)
          ]),
          actions: [
            DropdownButton<LanguageModel>(
              value: _choosenValue,
              dropdownColor: teal,
              iconEnabledColor: Colors.white,
              items: _languages
                  .map<DropdownMenuItem<LanguageModel>>((LanguageModel value) {
                return DropdownMenuItem<LanguageModel>(
                  value: value,
                  child: Text(
                    value.name!,
                    style: TextStyle(color: black),
                  ),
                );
              }).toList(),
              hint: Text(AppLocalizations.of(context).languageText),
              onChanged: (LanguageModel? newValue) {
                setState(() {
                  _choosenValue = newValue!;
                  Provider.of<LocalProvider>(context, listen: false)
                      .setLocale(Locale(newValue.code!));
                });
              },
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: teal,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mail),
              color: teal,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage('assets/man.jpg'),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: widget.isLogin == false
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isLogin == false ? Container() : const SideMenu(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const ExamsContainer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const AnnouncementsContainerBack(),
                          SizedBox(
                            width: width / 33,
                          ),
                          const DueDateContainerBack(),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            CustomizedButton(
                buttonText: AppLocalizations.of(context).logIn,
                navigationPath: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPage(isLogin: true)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
