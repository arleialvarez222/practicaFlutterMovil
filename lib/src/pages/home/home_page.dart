import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/home/tag_home.dart';


class HomePage extends StatelessWidget {
 //final color = const TextStyle(color: Colors.white);

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          spacing: 10.0,
          children: <Widget>[
            const Tag(
              icon: Icons.warning_amber_outlined, color: Colors.yellow, 
              texto: "5 productos estan por expirar",
            ),
            Tag(
              icon: Icons.warning_amber_outlined, color: Colors.red.shade500, 
              texto: "5 productos estan vencidos",
            ),
            const Tag(
              icon: Icons.check_circle_outline, color: Colors.green, 
              texto: "50 productos estan disponibles",
            ),

           
          ],
        ),
     ),
   );
  }
}