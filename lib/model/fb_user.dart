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

  FbUser.fromJson(Map<String, dynamic> json) :
      uid = json['uid'],
      image = json['image'],
      email = json['email'],
      username = json['username'],
  nickname = json['nickname'],
      password = json['password'],
     postCount = json['post_count'], /// 3 tasi
     followingCount = json['following_count'],
     followerCount = json['follower_count'];

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