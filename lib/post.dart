class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes +=
          1; //the user likes the post the likes will then increase by 1
    } else {
      this.likes -= 1;
    }
  }
}
