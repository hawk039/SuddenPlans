import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/Responsive/sizeconfig.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/static_constants.dart';
import '../widgets/ice_cream_tile.dart';

class CatalougeScreen extends StatefulWidget {
  const CatalougeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CatalougeScreen> createState() => _CatalougeScreenState();
}

class _CatalougeScreenState extends State<CatalougeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.primary.withOpacity(0.9),
        width: SizeConfig.getWidth * 0.6,
        child: Column(children: []),
      ),
      backgroundColor: AppColors.primaryback,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: GridView.count(
          crossAxisCount: 3,
          children: Constants.ice_cream_names
              .map((e) => IceCreamTile(image: e, name: "mango"))
              .toList()),
    );
  }
}
