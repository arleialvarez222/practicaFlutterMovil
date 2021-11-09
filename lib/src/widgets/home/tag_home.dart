import 'package:flutter/material.dart';

class Tag extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String texto;

  const Tag({
    Key? key,
    required this.icon,
    required this.texto, 
    required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 0),
        width: double.infinity,
        height: 200,
        decoration: _cardBorders(),
        //margin: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            _DetailsHome(icon: icon, texto: texto, color: color,)
          ],
          
        )
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


class _DetailsHome extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color;

  const _DetailsHome( {
    Key? key, 
    required this.icon,
    required this.texto,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: 200,
        decoration: _buildBoxDecoration(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(icon, color: color, size: 100,),
              ),

              Container(
                child: Text(texto, style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>  const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(25) ,bottomLeft: Radius.circular(25), topRight: Radius.circular(25), bottomRight: Radius.circular(25))
    
  );
}