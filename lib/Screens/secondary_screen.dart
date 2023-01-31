import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_app_bar.dart';
import '../Widgets/utility_card_widget.dart';

class SecondaryScreen extends StatefulWidget {
  final String title;
  const SecondaryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SecondaryScreen> createState() => _SecondaryScreenState();
}
final Map<String, String> imgList = {
  'Iraq': 'images/iraq.png',
  'Iran': 'images/azadi.png',
};
class _SecondaryScreenState extends State<SecondaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(Name:widget.title, isCompass: false,)),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10),
                child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const SecondaryScreen()),
                          // );
                        },
                        child: UtilityCard(
                            imgName: imgList.values.elementAt(index),
                            name: imgList.keys.elementAt(index)
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

