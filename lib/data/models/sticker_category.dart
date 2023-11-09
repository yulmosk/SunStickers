import 'package:equatable/equatable.dart';

import '_models.dart';

class StickerCategory extends Equatable {
  final StickerType type;
  final bool isSelected;

  StickerCategory({required this.type, required this.isSelected});

  @override
  List<Object?> get props => [type, isSelected];
  StickerCategory copyWith({StickerType? type, bool? isSelected}) {
    return StickerCategory(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
    );
  }

}
