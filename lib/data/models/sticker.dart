enum StickerType { all, toy, fauna, plant, berry, fruit, other }

class Sticker {
  int id;
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  StickerType type;
  int voter;
  bool cart;

  Sticker(
    this.id,
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isFavorite,
    this.description,
    this.score,
    this.type,
    this.voter,
    this.cart,
  );
}
