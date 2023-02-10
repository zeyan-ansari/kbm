import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final IconData iconName;
  final String Name;
  final String subName;
  const TimeCard({
    Key? key, required this.iconName, required this.Name, required this.subName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(iconName,color: Colors.white,size: 25,),
          SizedBox(height: 5,),
          Text(Name,
            style: const TextStyle(
                color: Colors.white,fontSize: 12
            ),),SizedBox(height: 5,),
          Text(subName,
            style: const TextStyle(
                color: Colors.white,fontSize: 12
            ),),
        ],
      ),
    );
  }
}
