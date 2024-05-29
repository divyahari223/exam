import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rest_cafeapi/crafts/pages/loadingscreen.dart';
import 'package:rest_cafeapi/crafts/provider/craftprovider.dart';
import 'package:rest_cafeapi/crafts/widgets/craftwidgets.dart';


class ProductsScreen extends StatefulWidget { 
   static const routeName = 'all_products_screen';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
    @override
  void initState() {
    
    Provider.of<craftprovider>(context, listen: false)
        .getAllproductData(context: context);
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final craft=Provider.of<craftprovider>(context);
    return Scaffold(
        appBar: AppBar(
      
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        // ignore: prefer_const_constructors
        },icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor:Colors.purple,
        title: const Text('Favouitres',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
    body:craft.loadingSpinner
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingScreen(title: 'Loading'),
                        CircularProgressIndicator(
                          color:Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                     
                      ],
                    )
                  : craft.products.isEmpty
                      ? const Center(
                          child: Text(
                          'No Products..',
                          style: TextStyle(color:Colors.green),
                        ))
                      : SizedBox(
                         // height: size.height * 0.6,
                          child: GridView.builder(
            itemCount: craft.products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.98,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return craftwidget(
              id:craft.products[index].id,
              name:craft.products[index].name,
             categoryId:craft.products[index].categoryId,
             file:craft.products[index].file,
              quantity:craft.products[index].quantity,
              description:craft.products[index]. description,
              additionalInformation:craft.products[index].additionalInformation,
              ownerId:craft.products[index].ownerId,
              price:craft.products[index].price,
              ownerName:craft.products[index].ownerName,
              ownerEmail:craft.products[index].ownerEmail,
              ownerPhone:craft.products[index].ownerPhone,
              ownerAddress:craft.products[index].ownerAddress,
              ownerUnitName:craft.products[index].ownerUnitName
              );
            },
          )
                        ),  
    );
  }
}