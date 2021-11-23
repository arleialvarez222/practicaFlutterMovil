import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/models/mark_model.dart';

class MarkCard extends StatelessWidget {

  //final Categories categories;
  //final double height; 

  final Mark mark;

  const MarkCard({
    Key? key, 
    required this.mark, 
    //required this.height,
    /* required this.categories, */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 0),
        width: double.infinity,
        height: 70,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft, 
          children: [
        
             _DetailsMark( nameMark: mark.mark,),

          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,7),
        blurRadius: 10
      )
    ]
  );
}

class _DetailsMark extends StatelessWidget {

  final dynamic nameMark;

  const _DetailsMark( {
    Key? key,  
    required this.nameMark
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(nameMark, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
    color: Colors.indigoAccent.shade400,
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    
  );
}