import 'package:flutter/material.dart';

class CommonAvatar extends StatelessWidget {
  int? radius;
  String? imageUrl;
  String? imageAsset;
  CommonAvatar({
    super.key,
    this.imageUrl =
        "https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png",
    this.imageAsset,
    this.radius = 30,
  });
  @override
  Widget build(BuildContext context) {
    assert(imageUrl != null || imageAsset != null,
        'Image Url or Image Asset must be provided');
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // borderRadius: BorderRadius.circular(10),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radius!.toDouble(),
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: radius!.toDouble() - 1,
          backgroundImage: imageUrl != null
              ? NetworkImage(imageUrl!)
              : AssetImage(imageAsset!) as ImageProvider<Object>,
        ),
      ),
    );
  }
}
