import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../styles/text_style.dart';
import '../../widgets/customized_button.dart';

class ExamsContainer extends StatelessWidget {
  const ExamsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.2,
      height: height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientText(
                    AppLocalizations.of(context).examsTitle.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    colors: const [
                      Color.fromARGB(255, 35, 82, 162),
                      Color.fromARGB(255, 20, 117, 196),
                      Color.fromARGB(255, 75, 162, 234),
                      Colors.teal,
                      Color.fromARGB(255, 51, 201, 188),
                    ],
                  ),
                  FittedBox(
                    child: SizedBox(
                      width: width / 1.5,
                      child: Text(AppLocalizations.of(context).examsMainTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: darkgreySmallStyle),
                    ),
                  ),
                  Text(
                    '"${AppLocalizations.of(context).examsSubTitle}" ${AppLocalizations.of(context).examsSubTitleAuthor}',
                    style: italicGreySmallStyle,
                  ),
                  CustomizedButton(
                    navigationPath: () {},
                    buttonText: AppLocalizations.of(context).examsButtonText,
                  ),
                ]),
            Expanded(
              child: Image.asset(
                'assets/computer_phone.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
