class ContactDataModel {
  String? name;
  String? phone;

  ContactDataModel({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap(){
    return{
      'name' : name,
      'phone' : phone
    };
  }

  ContactDataModel.fromMap(Map<String, dynamic> map){
    name = map['name'];
    phone = map['phone'];
  }
}
