import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/home_controller.dart';
import '../../../data/constant.dart';
import '../../../widget/general_card.dart';

class ViewAllScreen extends StatelessWidget {
  final String typeString;
  const ViewAllScreen({ Key? key ,required this.typeString,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final HomeController  _homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "His's and Her's Learning",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        // centerTitle: true,
        actions: [


          SizedBox(
            width: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.resolveWith<double>(
                  // As you said you dont need elevation. I'm returning 0 in both case
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return 0;
                    }
                    return 0; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () async {
                try {
                  await launch('https://m.me/hisandhermyanmar');
                } catch (e) {
                  print(e);
                }
              },
              child: FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.blue,
                size: 23,
              ),
            ),
          ),

          SizedBox(width: 20,),


        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Obx(
                 () {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      childAspectRatio: 1,
                      ), 
                    itemCount:  _homeController.getByType(typeString).length,
                    itemBuilder: (context,index) => GeneralCard(
    expertModel: _homeController.getByType(typeString)[index],
    ),
                    );
                }
              ),
              ),
    );
  }
}