import 'package:ic_creame_app/core/hive.dart';
import 'package:ic_creame_app/features/authentication%20/providers/sign_in_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Constants{
  static List<String> ice_cream_names = [
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
    "https://culinaryshades.com/wp-content/uploads/2022/03/mango-ice-cream-sqr01.jpg",
  ];
  static  String? authToken;
  static List<SingleChildWidget> providers=[
    ChangeNotifierProvider(create: (_)=>SignUpProvider()),
  ];
}