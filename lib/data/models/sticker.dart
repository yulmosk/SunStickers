enum StickerType { all, toy, fauna, plant, berry, fruit, other }

class Sticker {
  int id;
  String image;
  String name;
  double price;
  int quantity;
  bool favorite;
  String description;
  double score;
  StickerType type;
  int voter;
  bool cart;

  Sticker({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.favorite,
    required this.description,
    required this.score,
    required this.type,
    required this.voter,
    required this.cart,
  });
}
