import 'package:coligo/presenation/styles/color.dart';
import 'package:flutter/material.dart';
import '../../../data/announcements_data.dart';
import '../../styles/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnnouncementsContainerBack extends StatelessWidget {
  const AnnouncementsContainerBack({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.6,
      height: height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(AppLocalizations.of(context).announcementTitle,
                      style: blackNormalStyle),
                ),
                FittedBox(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: teal),
                    child: Text(AppLocalizations.of(context).all),
                  ),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context).announcementSubTitle,
              style: greySmallStyle,
            ),
            Row(children: [
              SizedBox(
                height: height / 2.5,
                width: width / 1.8,
                child: ListView.builder(
                  itemCount: fakeAnnouncementService.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        FittedBox(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                fakeAnnouncementService[index]
                                    ['profile_image']),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text(fakeAnnouncementService[index]
                                          ['instructor_name']),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        fakeAnnouncementService[index]
                                            ['course_code'],
                                        style: greySmallStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: lightGrey,
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          fakeAnnouncementService[index]['instructor_bio'],
                          style: greySmallStyle,
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
