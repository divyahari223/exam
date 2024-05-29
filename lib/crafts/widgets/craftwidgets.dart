import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rest_cafeapi/crafts/widgets/detailscreen.dart';
class craftwidget extends StatefulWidget {
 final String id;
  final String name;
 final String categoryId;
  final String file;
  final String quantity;
 final String description;
 final String additionalInformation;
 final String ownerId;
 final String price;
 final String ownerName;
 final String ownerEmail;
 final String ownerPhone;
 final String ownerAddress;
 final String ownerUnitName;

  craftwidget(
      { 
    required this.id,
    required this.name,
    required this.categoryId,
    required this.file,
    required this.quantity,
    required  this.description,
    required  this.additionalInformation,
    required this.ownerId,
    required this.price,
     required this.ownerName,
     required this.ownerEmail,
     required this.ownerPhone,
     required this.ownerAddress,
     required this.ownerUnitName
     
     
     });

  @override
  State<craftwidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<craftwidget> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
body: SingleChildScrollView(
  child: Column(
    children: [
      Card(
        child:Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => detailscreen(id: widget.id))));
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.file))
                ),
              ),
            ),
        Text(widget.name,style: TextStyle(color: Colors.orange),),
        Text("₹:"+widget.price)
          ],
        ),
        
      )
    ],
  ),
),

    );
  }
}