class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Map<String, String> origin;
  late Map<String, String> location;
  late String image;
  late List<dynamic> episode;
  late String url;
  late DateTime created;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'];
    location = json['location'];
    image = json['image'];
    episode = json['episod'];
    url = json['url'];
    created = DateTime.parse(json["created"]);
  }
}
