class MountainModal{
  final String? name;
  final String? description;
  final int? price;
  final int? stars;
  final int? people;
  final int? selectec_people;
  final String? img;
  final String? location;
  final String? created_at;

  MountainModal({this.name, this.description, this.price, this.stars, this.people, this.selectec_people, this.img, this.location, this.created_at,});

  factory MountainModal.fromJson(Map<String, dynamic> json){
    return MountainModal(
        name:json["name"],
        description:json["description"],
        price:json["price"],
        stars:json["stars"],
        people:json["people"],
        selectec_people:json["selectec_people"],
        img:json["img"],
        location:json["location"],
       created_at:json["created_at"],
    );
  }
}