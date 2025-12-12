class Student {
  //id, tên, email, địa chỉ, sđt
  int? id;
  String? name;
  String? email;
  String? address;
  String? phone;

  Student(
      {this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.phone});

  //model -> raw to persist into db
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'email': email,
      'address': address,
      'phone': phone
    };
    if (this.id != null) {
      map['id'] = id;
    }

    return map;
  }

  //convert to model from map rawtype
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        id: map['id'] as int?,
        name: map['name'] as String?,
        email: map['email'] as String?,
        address: map['address'] as String?,
        phone: map['phone'] as String?);
  }
}
