class userModel {
  int? health;
  int? damage;
  int? id;
  bool? isAlive;
  int? kill;

  userModel({this.health, this.damage, this.id, this.isAlive, this.kill});

  userModel.fromJson(Map<String, dynamic> json) {
    health = json['health'];
    damage = json['damage'];
    id = json['id'];
    isAlive = json['isAlive'];
    kill = json['kill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, int>();
    data['health'] = this.health;
    data['damage'] = this.damage;
    data['id'] = this.id;
    data['isAlive'] = this.isAlive;
    data['kill'] = this.kill;
    return data;
  }
}
