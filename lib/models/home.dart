class HomeCategory {
  final String image, title, description;
  final int id;

  HomeCategory({
    this.id,
    this.image,
    this.title,
    this.description,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) {
    return HomeCategory(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      description: json["description"],
    );
  }
}

List<HomeCategory> products = [
  HomeCategory(
    id: 1,
    title: "Office Code",
    image: "assets/images/home/build.png",
  ),
  HomeCategory(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/repair.png",
  ),
  HomeCategory(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/maintenance.png",
  ),
  HomeCategory(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/build.png",
  )
];
