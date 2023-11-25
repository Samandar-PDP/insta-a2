class Post {
  String? id;
  String? time;
  String? ownerId;
  int likeCount = 0;
  String? image;
  String? text;
  String? imageName; /// 1

  Post();
  Post.post(this.id,this.text,this.image,
      this.time,this.likeCount,this.ownerId, this.imageName); /// 2

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'image': image, 'time': time,
      'like_count': likeCount, 'owner_id': ownerId, 'image_name': imageName}; /// 3
  }
  Post.fromJson(Map<Object?, Object?> json) :
        id = json['id'].toString(),
        time = json['time'].toString(),
        ownerId = json['owner_id'].toString(),
        likeCount = int.tryParse(json['like_count'].toString()) ?? 0,
        image = json['image'].toString(),
        text = json['text'].toString(), /// vergul bosin!
         imageName = json['image_name'].toString(); /// 4
}