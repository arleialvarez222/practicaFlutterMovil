import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/models/mark_model.dart';
import 'package:handling_cupboard/src/pages/loading.dart';
import 'package:handling_cupboard/src/services/mark_service.dart';
import 'package:handling_cupboard/src/widgets/mark/mark_card.dart';
import 'package:provider/provider.dart';

class MarkPage extends StatelessWidget {
  const MarkPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final markService = Provider.of<MarkService>(context);
    if(markService.isloading) return const Loading();
    return Scaffold(
      body: ListView.builder(
        itemCount: markService.marks.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => {
            markService.selectMark = markService.marks[index].update(),
            Navigator.pushNamed(context, 'formMark'),
          },
          child: MarkCard(mark: markService.marks[index]) ,
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          markService.selectMark = Mark(
            mark: '',
          );
          Navigator.pushNamed(context, 'formMark');
        },
      ),
    );
  }
}