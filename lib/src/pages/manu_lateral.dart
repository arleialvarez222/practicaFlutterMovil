import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/pages/categories/categories.dart';
import 'package:handling_cupboard/src/pages/cupboard/cupboard.dart';
import 'package:handling_cupboard/src/pages/home/home_page.dart';
import 'package:handling_cupboard/src/pages/Products/products_page.dart';
import 'package:handling_cupboard/src/pages/marks/mark.dart';
import 'package:handling_cupboard/src/services/auth_service.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/model/item_hidden_menu.dart';
import 'package:hidden_drawer_menu/model/screen_hidden_drawer.dart';
import 'package:provider/provider.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);


  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {

  List<ScreenHiddenDrawer> items = [];
  //final authService = Provider.of<AuthService>(context, listen: false);

  @override
  void initState() {
    items.add( ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Home",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.5), fontSize: 28.0 ),
          colorLineSelected: Colors.orange, 
          selectedStyle: const TextStyle(color: Colors.white),
        ),
       const HomePage()));

    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Products",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(color: Colors.white),
        ),
        const ProductsPage()));

    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Categories",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(color: Colors.white),
        ),
        const CategoriesPage()));

    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Cupboard",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(color: Colors.white),
        ),
        const CupboardPage()));

    items.add(ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Mark",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
          selectedStyle: const TextStyle(color: Colors.white),
        ),
        const MarkPage()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.lightBlue.shade400,
      backgroundColorAppBar: Colors.lightBlue,
      screens: items,
        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    disableAppBarDefault: false,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
      slidePercent: 50.0,
      verticalScalePercent: 90.0,
      contentCornerRadius: 40.0,
      //iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),
        actionsAppBar: <Widget>[IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, 'login');
          }, 
          icon: const  Icon(Icons.login_outlined)
        )],
        //    backgroundColorContent: Colors.blue,
        //    elevationAppBar: 4.0,
      //tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
            /* backgroundMenu: const DecorationImage(
              image: NetworkImage('https://fsb.zobj.net/crop.php?r=iLyhXwU27oCz7PXJKSoD3FOc0LVx7iAuqoW2lknHKQ5ymmhS3q5FZOqz-1S6vjwB7t06C-4_Q3K_akt4jm_NlEL_8pDusC9a1Fs9s7oCtcPRKmEKVyFMW32LbwnVb75qu0RWi_y0cNsGPbW-'),
              fit: BoxFit.cover
            ), */
    ); 
  }
}