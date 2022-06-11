class Doctors {
   String? id;
   String? name;
   String? imgIcon;
   String? cat;
   String? img;
   String? location;
   String? price;
   String? waiting;
   String? info;
   String? subCat;

  Doctors.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    imgIcon = data['imgIcon'];
    cat = data['cat'];
    img = data['img'];
    location = data['location'];
    price = data['price'];
    waiting = data['waiting'];
    info = data['info'];
    subCat = data['subCat'];
  }
}
