import 'package:flutter/material.dart';
import 'package:kzn/data/constant.dart';
import 'package:kzn/ui/routes/tnc_route.dart';
import 'package:kzn/utils/utils.dart';

class AboutRoute extends StatefulWidget {
  static final String routeName = "/about_route";
  @override
  _AboutRouteState createState() => _AboutRouteState();
}

class _AboutRouteState extends State<AboutRoute> {
  final Color tileColor = Colors.redAccent;
  final Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondMainThemeColor),
        backgroundColor: mainThemeColor,
        title: Text("About",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: secondMainThemeColor)),
      ),
      // appBar: AppBar(title: Text("About")),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text:
                      "Shwe Thiri Khit is the founder of “Shwe Thiri Khit” Self-Improvement Application.  Her mission is to help young women everywhere become their BEST SELVES, reach their true potential and create their dream life. She is the author of BEST SELF: Crafting Your Destiny.  Self-improvement and self-love transformed her life.  She was low self-esteem, unhappy and not confident the way she looked. Until one day she had a discovery that she can’t live her life constantly comparing herself to everyone else because that was making her miserable.  And she soon realized that she lacked the most basic fundamental of confidence.  She looked confident on the outside but very insecure on the inside.\n\n",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        /* fontWeight: FontWeight.normal, */
                        fontSize: 14,
                        color: secondMainThemeColor,
                      ),
                  children: [
                    subTitle(
                        "And after that realization, she then set out on a journey to become a confident person, a successful entrepreneur, and being comfortable in her own skin.  She has been working as a founder and fashion designer at her own fashion brand called “Amara Khit” since 2014.  She has experience in the creative industry for 20 years.  She has exhibited widely at home and abroad with a desire to integrate art into fashion.  Her works of art were published in Myanmar local magazines and TV programs as well as in Adobe Photoshop magazine based in the UK.\n\n",
                        context),
                    subTitle(
                        "Shwe Thiri Khit is an accomplished entrepreneur who lived and worked in Myanmar, United Kingdom and Malaysia.  She shares valuable creativity tips, innovative business tips and personal development through her social media.  She started conducting both face-to-face and the online classes since 2010 from the artistic programs to unlock creativity to the business courses of how to do business for creative people who want to transform their passion to profit.  She remains friends with many of her students, to whom continued advice and coach is provided for their careers and personal development.\n\n",
                        context),
                    TextSpan(
                      text:
                          "She believes that all women from any background can transform their lives ",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: secondMainThemeColor,
                          ),
                    ),
                    subTitle(
                        "and opportunities by elevating their mindset, personal presentation and strategising on reaching individual goals and aspirations.\n\n",
                        context),
                    subTitle(
                        "She currently lives in Myanmar, Mandalay with her husband and daughter. When She’s not sharing and educating through her various platforms, she can be found living her best life at the riding stables, traveling and spending quality time with those she values most.\n\n",
                        context),
                    subTitle(
                      "You can connect with her and her community via her social channels and products to educate yourself on personal improvement.  The core reason she has put her whole story out there is to inspire the belief in you that transformation never stops and",
                      context,
                    ),
                    TextSpan(
                      text: " anything is possible!\n\n",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: secondMainThemeColor,
                          ),
                    ),
                    TextSpan(
                      text: "Shwe Thiri Khit",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: secondMainThemeColor,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
