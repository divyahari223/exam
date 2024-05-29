import'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:rest_cafeapi/crafts/provider/craftprovider.dart';

class detailscreen extends StatefulWidget {
    static const routeName = 'detail_screen';
    final String id;
  const detailscreen({super.key,
   required this.id,
  });

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {
    final Craft= Provider.of< craftprovider>(context).products.firstWhere((element) => element.id == widget.id);
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(Icons.shopping_cart)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            height: 200,
            width: double.infinity,
           decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(Craft.file),fit: BoxFit.cover
              ),
          )
          ),
          Text(Craft.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("₹"+Craft.price,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text("Quantity:"+Craft.quantity,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[500]),),
          Text("Type:"+Craft.ownerId,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          Text("Farmer:"+Craft.ownerName,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text(Craft.description,),
              SizedBox(height: 20,),
             Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 46, 102, 47)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(Icons.shopping_bag),
                  Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                ],
              ),
             )
            ],
          )
          ],
        ),
      ),
    );
  }
}