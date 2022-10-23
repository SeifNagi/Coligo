import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/quizes_data.dart';
import '../../styles/color.dart';
import '../../styles/text_style.dart';

class DueDateContainerBack extends StatelessWidget {
  const DueDateContainerBack({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 5.8,
      //3.5
      height: height / 1.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(AppLocalizations.of(context).dueDateTitle,
                          style: blackNormalStyle)),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: teal),
                      child: Text(AppLocalizations.of(context).all),
                    ),
                  )
                ],
              ),
              Text(
                AppLocalizations.of(context).dueDateSubTitle,
                style: greySmallStyle,
              ),
              SizedBox(
                width: width / 3.2,
                height: height / 1.6,
                child: ListView.builder(
                  itemCount: fakeQuizesSrvice.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  IconData(
                                      int.parse(
                                          '0x${fakeQuizesSrvice[index]['icon']}'),
                                      fontFamily: 'MaterialIcons',
                                      matchTextDirection: true),
                                  color: teal,
                                ),
                                Text(fakeQuizesSrvice[index]['title'])
                              ],
                            ),
                            Text(
                              'Course: ${fakeQuizesSrvice[index]['course_name']}',
                              style: greySmallStyle,
                            ),
                            Text(
                              'Topic: ${fakeQuizesSrvice[index]['topic']}',
                              style: greySmallStyle,
                            ),
                            Text(
                              'Due to: ${fakeQuizesSrvice[index]['due_date']}',
                              style: greySmallStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          side: BorderSide(color: teal),
                                          foregroundColor: teal,
                                          backgroundColor: Colors.white),
                                      child: Text(
                                        fakeQuizesSrvice[index]
                                                    ['button_text'] ==
                                                "Start Quiz"
                                            ? AppLocalizations.of(context)
                                                .startQuiz
                                            : AppLocalizations.of(context)
                                                .solveAssigment,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            fakeQuizesSrvice[index] == fakeQuizesSrvice.last
                                ? Container()
                                : const Divider()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
