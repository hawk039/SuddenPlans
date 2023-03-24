import 'package:flutter/cupertino.dart';
import 'package:ic_creame_app/core/constants/app_color.dart';
import 'package:ic_creame_app/features/helpers/helper_functions.dart';

class IceCreamTile extends StatefulWidget {
  IceCreamTile({Key? key, required this.image, required this.name})
      : super(key: key);
  String image;
  String name;

  @override
  State<IceCreamTile> createState() => _IceCreamTileState();
}

class _IceCreamTileState extends State<IceCreamTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteFF,
      margin: const EdgeInsets.all(7),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 6, 3, 0),
          child: Column(children: [
            const SizedBox(height: 5),
            Image.network(widget.image, height: 75, width: 75),
            Text(
              HelperFunctions.capitalistFirstLetter(widget.name),
              style: const TextStyle(color: AppColors.grey4D),
            )
          ]),
        ),
      ),
    );
  }
}
