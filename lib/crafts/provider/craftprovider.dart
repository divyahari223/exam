import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_cafeapi/crafts/models/craftmodels.dart';






class craftprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<Products> _products = [];//this is model class name
  List<Products> get products  {
    return [..._products];
  }

  Future getAllproductData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await http.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_products.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/homemade_crafts/API/view_all_products.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _products = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> craftdetails = extractedData['products'];//the value filmdetails is the variable from the api which stores the data (look in postman)
        for (var i = 0; i < craftdetails.length; i++) {
          _products.add(
             Products(
            id:craftdetails [i]['id'].toString() ,
              name: craftdetails [i]['name'].toString(),
              categoryId: craftdetails [i]['category_id'].toString(),
             file: craftdetails [i]['file'].toString(),
               quantity : craftdetails [i]['quantity'].toString(),
              description:craftdetails [i]['description'].toString(),
             additionalInformation: craftdetails [i]['additional_information'] .toString(),
               ownerId: craftdetails [i]['owner_id'].toString(),
               price : craftdetails [i]['price'].toString(),
              ownerName: craftdetails [i]['owner_name'].toString(),
              ownerEmail:craftdetails[i]['owner_email'].toString(),
              ownerPhone:craftdetails[i]['owner_phone'].toString(),
             ownerAddress:craftdetails[i]['owner_address'].toString(),
             ownerUnitName:craftdetails[i]['owner_unit_name'].toString()
            ),

          );
        }
        ;

        print('product details' + _products.toString());
        _isLoading = false;
        print('shop loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in shop prod -->>' + e.toString());
      print('shop Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}