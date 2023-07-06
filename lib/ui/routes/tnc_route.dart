import 'package:flutter/material.dart';
import 'package:kzn/utils/utils.dart';

class TnCRoute extends StatefulWidget {
  static final String routeName = "/tnc_route";
  @override
  _TnCRouteState createState() => _TnCRouteState();
}

class _TnCRouteState extends State<TnCRoute> {
  final Color tileColor = Colors.redAccent;
  final Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Terms & Conditions",
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
                  text: "Terms of Use\n",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                  children: [
                    TextSpan(
                      text:
                          "These Terms of Use were last updated on November 5th, 2023.\n\n",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            /* fontWeight: FontWeight.normal, */
                            fontSize: 14,
                            color: Colors.black,
                          ),
                    ),
                    subTitle("1.1. WELCOME TO SHWE THIRI KHIT APPLICATION\n",
                        context),
                    subBody(
                      "We provide its Services to you through its mobile applications and other interactive properties owned and operated by SHWE THIRI KHIT, subject to the following Terms of Use."
                      "The Application is an online learning community for personal development. The Application  enables users to access and/or purchase courses made available on the App, post photographs, images and videos, share comments, opinions and ideas, promote their work and participate in contests and promotions. Services include, but are not limited to, any service and/or content SHWE THIRI KHIT makes available to or performs for you, as well as the offering of any materials displayed, transmitted or performed on the Site.\n\n",
                      context,
                    ),
                    subTitle("1.2. ACCEPTANCE OF TERMS OF USE\n", context),
                    subBody(
                      "These terms of use are entered into by and between you and SHWE THIRI KHIT Application. The following terms and conditions, together with any documents that are expressly incorporated by reference (collectively “Terms of Use”), govern your access to and use of the Services, whether as a guest or a registered user.\n",
                      context,
                    ),
                    subBody(
                      "Please read the Terms of Use carefully before you start to use the Services. By using the Services and accessing the App, you accept and agree to be bound and abide by these Terms of Use and our Privacy Policy, incorporated herein by reference. If you do not agree to these Terms of Use or Privacy Policy, promptly exit this page without accessing or using any of the Services. If you are using the Services on behalf of a business, that business also accepts these Terms of Use.\n\n",
                      context,
                    ),
                    subTitle("1.3. CHANGES TO THE TERMS OF USE\n", context),
                    subBody(
                        "We may revise and update these Terms of Use from time to time in our sole discretion. If we change these Terms of Use, depending on the nature of the change, we will post the changes on this page and indicate at the top of this page the date these terms were last revised and/or notify you, either through the user interface, in an email notification or through other reasonable means and as required by application. Your continued use of the Services following the posting of revised Terms of Use means that you accept and agree to the changes. You are expected to check this page from time to time so you are aware of any changes, as they are binding on you.\n\n",
                        context),
                    subTitle("2.1. ACCESS TO THE SERVICES\n", context),
                    subBody(
                        "SHWE THIRI KHIT reserves the right to modify or discontinue, temporarily or permanently, the Services (or any part thereof) with or without notice. You agree that SHWE THIRI KHIT will not be liable to you or any third party for any modification, suspension or discontinuance of the Services. We will not be liable if, for any reason, all or any part of the Services are unavailable at any time or for any period. From time to time, we may restrict access to some parts of the Services, or the entire Services, to users, including registered users.\n",
                        context),
                    subBody(
                        "We reserve the right to disable any user name, password or other identifier, whether chosen by you or provided by us, at any time in our sole discretion for any or no reason, including if, in our opinion, you have violated any provision of these Terms of Use."
                        "The Services are accessible worldwide, but this does not mean all Services or service features are available in your country. SHWE THIRI KHIT may block access to certain Services. Services are not available in all languages.\n",
                        context),
                    subBody(
                        "Services are available only to users above 16 years old; however, if you are younger than the required age for consent to use online services where you live, you shall not use the Services but we encourage you to invite a parent or guardian to open an account and help you access content that is appropriate for you. If you are below this age of consent to use online services, you must not access the Services. If we discover that you have created an account that violates these rules, we will terminate your account.\n\n",
                        context),
                    subTitle("2.2. REGISTRATION\n", context),
                    subBody(
                        "To access the App or some of the Services it offers, you may be asked to provide certain registration details or other information. You agree to: (a) provide true, accurate, current and complete information about yourself in the registration form and (b) maintain and promptly update such information to keep it "
                        "true, accurate, current and complete. If you provide any information that is untrue, inaccurate, not current or incomplete, or if SHWE THIRI KHIT has reasonable grounds to suspect that such information is untrue, inaccurate, not current or incomplete, SHWE THIRI KHIT has the right to suspend or terminate your account and refuse any and all current or future use of the Services (or any portion thereof). You agree that all information you provide to register with the Services or otherwise, including, but not limited to, through the use of any interactive features, is governed by our Privacy Policy, and you consent to all actions we take with respect to your information consistent with our Privacy Policy.\n\n",
                        context),
                    subTitle("2.3. ACCOUNT SECURITY\n", context),
                    subBody(
                        "If you choose, or are provided with, a user name, password or any other piece of information as part of our security procedures, you must treat such information as confidential, and you must not disclose it to any other person or entity. You also acknowledge that your account is personal to you and agree not to provide any other person with access to the Services or portions of it using your username, password or other security information. It is your responsibility to keep your login credentials secure and you are solely responsible for all activities that occur via your account. You agree to notify us immediately of any unauthorized access to or use of your username or password or any other breach of security. You also agree to ensure that you logout of your account at the end of each session. You should use particular caution when accessing your account from a public or shared computer so that others are not able to view or record your password or other personal information. SHWE THIRI KHIT will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions.\n\n",
                        context),
                    subTitle("3.1. USE OF THE SERVICE\n", context),
                    subBody(
                        "The Site and the Service is solely for your personal and non-commercial use. Unless otherwise expressly authorized in writing by SHWE THIRI KHIT, you agree not to display, distribute, license, perform, publish, reproduce, duplicate, copy, create derivative works from, modify, sell, resell, exploit, transfer or upload for any commercial purposes, any portion of the Service, use of the Service, or access to the Service."
                        "The Service should not be used or relied upon for storage of your photographs, images, videos, sounds or any other content you uploaded, and you shall retain your own copies of all content posted on the Application.\n\n",
                        context),
                    subTitle("3.2. PROHIBITED USES\n", context),
                    subBody(
                        "You hereby agree not to use the Services for any purposes that are unlawful or prohibited by these Terms of Use, or any other purpose not reasonably intended by SHWE THIRI KHIT.\n\n",
                        context),
                    subBody("You agree not to:\n", context)
                  ],
                ),
              ),
              UnorderListItem(
                  rightString:
                      "Bypass any measures we may use to prevent or restrict access to the Services."),
              UnorderListItem(
                  rightString:
                      "Use the Services in any manner that could disable, overburden, damage, or impair the Services or interfere with any other party's use of the Site, including their ability to engage in real time activities through the Site."),
              UnorderListItem(
                  rightString:
                      "Use any robot, spider or other automatic device, process or means to access the Services for any purpose, including monitoring or copying any of the material on the Services."),
              UnorderListItem(
                  rightString:
                      "Use any manual process to monitor or copy any of the material on the Services, or for any other purpose not expressly authorized in these Terms of Use, without our prior written consent."),
              UnorderListItem(
                  rightString:
                      "Use any device, software or routine that interferes with the proper working of the Services."),
              UnorderListItem(
                  rightString:
                      "Introduce any viruses, trojan horses, worms, logic bombs or other material which is malicious or technologically harmful."),
              UnorderListItem(
                  rightString:
                      "Obtain or attempt to obtain or otherwise obtain any materials or information through any means not intentionally made available or provided for through the Service."),
              UnorderListItem(
                  rightString:
                      "Attempt to gain unauthorized access to, interfere with, damage or disrupt any parts of the Services, the server on which the Services are stored, any server, computer or database connected to the Services or to private accounts of other users."),
              UnorderListItem(
                  rightString:
                      "Attack the Services via a denial-of-service attack or a distributed denial-of-service attack."),
              UnorderListItem(
                  rightString:
                      "Otherwise attempt to interfere with the proper working of the Services."),
              verticalSpace(10),
              RichText(
                  text: TextSpan(
                text:
                    "SHWE THIRI KHIT shall have the right to remove any content that violates the Terms of Use or is otherwise objectionable.\n",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      /* fontWeight: FontWeight.normal, */
                      fontSize: 14,
                      color: Colors.grey.shade800,
                    ),
                children: [
                  subBody(
                    "If you suspect there has been a breach of these Terms of Use (other than relating to copyright infringement notices, as described below) please contact us through our email."
                    "You agree that you are solely responsible for your interactions with any other user in connection with the Service and SHWE THIRI KHIT will have no liability or responsibility with respect thereto. SHWE THIRI KHIT reserves the right, but has no obligation, to become involved in any way with disputes between you and any other user of the Service.\n\n",
                    context,
                  ),
                  subTitle(
                      "4. SHWE THIRI KHIT’S INTELLECTUAL PROPERTY RIGHTS\n",
                      context),
                  subBody(
                      "The Services and related content, features and functionality (including but not limited to all information, software, text, displays, images, video and audio, and the design, selection and arrangement thereof), are owned by SHWE THIRI KHIT.\n",
                      context),
                  subBody(
                      "When accessing the Services and/or when purchasing a course, we grant you a limited, non-exclusive, non-transferable, license to access the SHWE THIRI KHIT content and view (a) course(s) through the Services on a streaming-only basis for that purpose. Except for the foregoing limited license, no right, title or interest in or to the Services or any content on the Services is transferred to you, and all rights not expressly granted are reserved by SHWE THIRI KHIT. You must not reproduce, distribute, modify, create derivative works of, publicly display, publicly perform, republish, download, store or transmit any of the material on our Services.\n",
                      context),
                  subBody(
                      "SHWE THIRI KHIT’s name, SHWE THIRI KHIT’s logo and all related names, logos, product and service names, designs and slogans are trademarks of SHWE THIRI KHIT or its affiliates or licensors. You must not use such marks without our prior written permission.\n",
                      context),
                  subBody(
                      "You must not delete or alter any copyright, trademark or other proprietary rights notices from any materials on the Site.\n",
                      context),
                  subBody(
                      "Any use of the Site not expressly permitted by these Terms of Use is a breach of these Terms of Use and may violate copyright, trademark and other laws.\n\n",
                      context),
                  subTitle("5. USER CONTRIBUTIONS\n", context),
                  subBody(
                      "You retain all rights and ownership of your photographs, images, videos, sounds or any other content or material you upload through the Services or share with other users or recipients (collectively, “User Contributions”). SHWE THIRI KHIT does not claim any ownership rights in your User Contributions. However, by providing or uploading any User Contributions you hereby grant and will grant to SHWE THIRI KHIT.  SHWE THIRI KHIT will always give you proper credit when using your User Contributions. In addition, by submitting your User Contributions you grant other SHWE THIRI KHIT users and visitors the right to share your User Contributions via social media platforms integrated with SHWE THIRI KHIT (such as Instagram, Pinterest, Facebook or Twitter). You may terminate this license at any time by removing your User Contributions from the users support group located on Facebook. You understand and acknowledge that you are responsible for all User Contributions and Submissions you submit or contribute, and you, not SHWE THIRI KHIT, have full responsibility for such content, including its legality, reliability, accuracy and appropriateness.\n",
                      context),
                  subBody(
                      "SHWE THIRI KHIT and its designees will have the right (but not the obligation) in their sole discretion to refuse or remove any content that is available via the Services. Without limiting the foregoing, SHWE THIRI KHIT and its designees will have the right to remove any content that violates these Terms of Use or is deemed by SHWE THIRI KHIT, in its sole discretion, to be otherwise objectionable. We have no obligation to retain any of your User Contribution for any period of time beyond what may be required by applicable law. You agree and understand that SHWE THIRI KHIT shall not be liable to you for any such unlawful copying of your User Contributions.\n\n",
                      context),
                  subTitle(
                      "Please send any feedback, comments, requests for technical support, and any other communications relating to the Services to us through our ",
                      context),
                  TextSpan(
                      text: "Facebook Page ",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                      children: [
                        subBody("or to ", context),
                        TextSpan(
                          text: "helloshwethirikhit@gmail.com",
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                        subBody('),', context),
                      ])
                ],
              )),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}

TextSpan subTitle(String text, BuildContext context) {
  return TextSpan(
      text: text,
      // ignore: deprecated_member_use
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            /* fontWeight: FontWeight.normal, */
            fontSize: 14,
            color: Colors.black,
          ));
}

TextSpan subBody(String text, BuildContext context) {
  return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            /* fontWeight: FontWeight.normal, */
            fontSize: 14,
            color: Colors.grey.shade800,
          ));
}

class UnorderListItem extends StatelessWidget {
  const UnorderListItem({
    super.key,
    required this.rightString,
  });
  final String rightString;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        horizontalSpace(10),
        Text(
          "●",
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              rightString,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.grey.shade800,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
