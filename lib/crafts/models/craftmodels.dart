class Products {
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

  Products(
      {required this.id,
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
     required this.ownerUnitName});

 factory Products.fromJson(Map<String, dynamic> json) {
  return Products(
    id : json['id'],
    name : json['name'],
    categoryId : json['category_id'],
    file : json['file'],
    quantity : json['quantity'],
    description : json['description'],
    additionalInformation : json['additional_information'],
    ownerId : json['owner_id'],
    price : json['price'],
    ownerName : json['owner_name'],
    ownerEmail : json['owner_email'],
    ownerPhone : json['owner_phone'],
    ownerAddress : json['owner_address'],
    ownerUnitName : json['owner_unit_name'],
  );
  }
}