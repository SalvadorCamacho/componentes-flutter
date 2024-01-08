import 'package:flutter/material.dart';

import '../pages/Inputs.dart';
import '../pages/alert_page.dart';
import '../pages/animated_Container.dart';
import '../pages/avatar_page.dart';
import '../pages/card_page.dart';
import '../pages/home_page.dart';
import '../pages/listview_page.dart';
import '../pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context)  => const HomePage(),
    'alert': (BuildContext context)  => const AlertPage(),
    'avatar': (BuildContext context)  => const AvatarPage(),
    'card': (BuildContext context)  => const CardPage(),
    'animatedContainer': (BuildContext context)  => const AnimatedContainerPage(),
    'inputs': (BuildContext context)  => const InputPage(),
    'slider': (BuildContext context)  => const SliderPage(),
    'list': (BuildContext context)  => const ListaPage(),
  };
}
