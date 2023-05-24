import 'package:flutter/material.dart';

import '../../data/_data.dart';
import '../../ui_kit/_ui_kit.dart';
import '../_ui.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  var favoriteItems = AppData.favoriteItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: EmptyWrapper(
        type: EmptyWrapperType.favorite,
        title: "Empty favorite",
        isEmpty: favoriteItems.isEmpty,
        child: _favoriteListView(),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Favorite screen",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget _favoriteListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      itemCount: favoriteItems.length,
      itemBuilder: (_, index) {
        Sticker sticker = favoriteItems[index];
        return Card(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : AppColor.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            title: Text(
              sticker.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            leading: Image.asset(sticker.image),
            subtitle: Text(
              sticker.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
          ),
        );
      },
      separatorBuilder: (_, __) => Container(
        height: 20,
      ),
    );
  }
}
