import 'package:flutter/material.dart';

import '../../ui_kit/_ui_kit.dart';

enum EmptyWrapperType { cart, favorite }

class EmptyWrapper extends StatelessWidget {
  const EmptyWrapper(
      {super.key, this.type = EmptyWrapperType.cart, required this.title, required this.isEmpty, required this.child});

  final EmptyWrapperType type;
  final String title;
  final bool isEmpty;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                type == EmptyWrapperType.cart
                    ? Image.asset(AppAsset.emptyCart, width: 300)
                    : Image.asset(AppAsset.emptyFavorite, width: 300),
                const SizedBox(height: 10),
                Text(title, style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
          )
        : child;
  }
}
