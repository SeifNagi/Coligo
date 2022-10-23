import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/customized_icos_text_button.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        height: height,
        width: width / 7.3,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.8],
          colors: [
            Color.fromARGB(255, 14, 75, 125),
            Color.fromARGB(255, 20, 100, 166),
            Color.fromARGB(255, 5, 95, 86),
          ],
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      AppLocalizations.of(context).dashboardTitle,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              CustomizeIconTextdButton(
                icon: Icons.home,
                textContent: AppLocalizations.of(context).dashboard,
              ),
              CustomizeIconTextdButton(
                icon: Icons.calendar_month,
                textContent: AppLocalizations.of(context).schedule,
              ),
              CustomizeIconTextdButton(
                icon: Icons.book,
                textContent: AppLocalizations.of(context).courses,
              ),
              CustomizeIconTextdButton(
                icon: Icons.school,
                textContent: AppLocalizations.of(context).gradebook,
              ),
              CustomizeIconTextdButton(
                icon: Icons.leaderboard,
                textContent: AppLocalizations.of(context).performance,
              ),
              CustomizeIconTextdButton(
                icon: Icons.campaign,
                textContent: AppLocalizations.of(context).announcement,
              )
            ],
          ),
        ),
      ),
    );
  }
}
