import 'package:flutter/material.dart';
import 'package:kzn/utils/utils.dart';

class PrivacyPolicyRoute extends StatefulWidget {
  static final String routeName = "/privacy_policy_route";
  @override
  _PrivacyPolicyRouteState createState() => _PrivacyPolicyRouteState();
}

class _PrivacyPolicyRouteState extends State<PrivacyPolicyRoute> {
  final Color tileColor = Colors.redAccent;
  final Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Privacy Policy",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Thank you for using SHWE THIRI KHIT Application!\n\n',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            "Our mission is to bring everyone the inspiration "
                            "to create a life they love. To do that, "
                            "we show you personalized content we think you\’ll "
                            "be interested in based on information we collect "
                            "from you and third parties. We only use that "
                            "information where we have a proper legal basis for "
                            "doing so.We wrote this policy to help you understand "
                            "what information we collect, how we use it and what "
                            "choices you have about it.\n\n",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              /* fontWeight: FontWeight.normal, */
                              fontSize: 16,
                              color: Colors.black,
                            )),
                    TextSpan(
                      text:
                          'When you give it to us or give us permission to obtain it\n',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                    ),
                    TextSpan(
                      text:
                          'When you sign up for or use SHWE THIRI KHIT Application you voluntarily share certain information including your name, email address, phone number, photos, comments, and any other information you give us. You will also have the option to share other information about yourself such as your gender, age and preferred language.If you connect your Facebook, Google or other third-party accounts to SHWE THIRI KHIT Application, we use information from those accounts (such as your friends or contacts) to improve your user experience. This is dependent on the privacy policies or settings for those accounts.\n\n',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                    ),
                    TextSpan(
                      text:
                          'We’re committed to showing you content that’s relevant, interesting and personal to you. To do that, we use your information to provide and improve your experience, including:\n',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
              //Unorder List
              UnorderListItem(
                leftString: "•",
                rightString:
                    "Identify you when you use SHWE THIRI KHIT Application.",
              ),
              UnorderListItem(
                  leftString: "•",
                  rightString:
                      "Recommend news, topics, or courses you might like based on your activity on SHWE THIRI KHIT."),
              UnorderListItem(
                  leftString: "•",
                  rightString: "Respond to your questions or comments."),
              UnorderListItem(
                leftString: "●",
                rightString:
                    "Help your friends and contacts find you on SHWE THIRI KHIT. For example, if you sign up using a Facebook account, we can help your Facebook friends find you on SHWE THIRI KHIT when they first sign up for SHWE THIRI KHIT. Or people can search for your account on SHWE THIRI KHIT using your email.",
              ),
              UnorderListItem(
                leftString: "●",
                rightString:
                    "Send you updates (such as when certain activity, like saves or comments) and news by email or push notification, depending on your settings. For example, we send weekly updates that include news and blog posts you may like.",
              ),
              verticalSpace(10),
              RichText(
                text: TextSpan(
                  text: 'Our policy on children’s information\n',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                  children: [
                    TextSpan(
                      text:
                          'Children under 16 are not allowed to use SHWE THIRI KHIT Application. However, if you are younger than the required age consemt to use online services, we encourage you to invite the parent or guardian to open an account and help you access content that is appropriate for you.\n\n',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                    ),
                    TextSpan(
                      text: 'Contact us\n',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: 'The best way to get in touch with us through the ',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                    ),
                    TextSpan(
                      text: 'User Support Group ',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    TextSpan(
                      text: 'on Facebook (or) send email via ',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                    ),
                    TextSpan(
                      text: 'helloshwethirikhit@gmail.com',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
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

class UnorderListItem extends StatelessWidget {
  const UnorderListItem({
    super.key,
    required this.leftString,
    required this.rightString,
    this.leftSize,
  });
  final String leftString;
  final String rightString;
  final double? leftSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        horizontalSpace(5),
        Text(
          leftString,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              rightString,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
