class Post {
  String? id;
  String? time;
  String? ownerId;
  int likeCount = 0;
  String? image;
  String? text;

  Post();
  Post.post(this.id,this.text,this.image,this.time,this.likeCount,this.ownerId);

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'image': image, 'time': time,
      'like_count': likeCount, 'owner_id': ownerId};
  }
  Post.fromJson(Map<Object?, Object?> json) :
        id = json['id'].toString(),
        time = json['time'].toString(),
        ownerId = json['owner_id'].toString(),
        likeCount = int.tryParse(json['like_count'].toString()) ?? 0,
        image = json['image'].toString(),
        text = json['text'].toString();
}