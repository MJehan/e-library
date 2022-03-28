import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book/book3.dart';
import '../constrains/constrain.dart';

class ImageButton3 extends StatelessWidget {
  String title ='';
  String path = '';
  ImageButton3({
    required this.title, required this.path,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.kInactiveColor,
      elevation: 8 ,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.black26,
        onTap: (){
          Navigator.pushNamed(context, Book3.id);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink.image(image: AssetImage(path),
              height: MediaQuery.of(context).size.height* 0.20,
              width: MediaQuery.of(context).size.width* 0.25,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 6,),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
