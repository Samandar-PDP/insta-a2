class FbUser {
  String? uid;
  String? image;
  String? username;
  String? email;
  String? password;
  String? nickname;
  int? postCount; /// mano 3 tasi
  int? followerCount;
  int? followingCount;

  FbUser.user(
      this.uid,
      this.image,
      this.username,
      this.email,
      this.password,
      this.nickname,
      this.postCount, /// mashi 3 tasi
      this.followerCount,
      this.followingCount
      );
  FbUser();

  FbUser.fromJson(Map<Object?, Object?> json) :
      uid = json['uid'].toString(),
      image = json['image'].toString(),
      email = json['email'].toString(),
      username = json['username'].toString(),
  nickname = json['nickname'].toString(),
      password = json['password'].toString(),
     postCount = int.tryParse(json['post_count'].toString()) ?? 0, /// 3 tasi
     followingCount = int.tryParse(json['following_count'].toString()) ?? 0,
     followerCount = int.tryParse(json['follower_count'].toString()) ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'image': image,
      'username': username,
      'email': email,
      'password': password,
      'nickname': nickname,
      'post_count': postCount, /// 3 tasi
      'following_count': followingCount,
      'follower_count': followerCount
    };
  }
}