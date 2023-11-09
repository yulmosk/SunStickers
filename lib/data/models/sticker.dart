import 'package:equatable/equatable.dart';

enum StickerType { all, toy, fauna, plant, berry, fruit, other }

class Sticker extends Equatable{
  final int id;
  final String image;
  final String name;
  final double price;
  final int quantity;
  final bool favorite;
  final String description;
  final double score;
  final StickerType type;
  final int voter;
  final bool cart;

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

  List<Object?> get props => [id, image, name, price, quantity, favorite, description, score, type, voter, cart];
  @override
  int get hashCode => id.hashCode^image.hashCode^name.hashCode^price.hashCode^quantity.hashCode^favorite.hashCode^description.hashCode^score.hashCode^type.hashCode^voter.hashCode^cart.hashCode;

  Sticker copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    int? quantity,
    bool? favorite,
    String? description,
    double? score,
    StickerType? type,
    int? voter,
    bool? cart,
  }) {
    return Sticker(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      favorite: favorite ?? this.favorite,
      description: description ?? this.description,
      score: score ?? this.score,
      type: type ?? this.type,
      voter: voter ?? this.voter,
      cart: cart ?? this.cart,
    );
  }
}
