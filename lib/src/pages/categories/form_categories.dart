import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/form/input_decoration.dart';

class CategoriesForm extends StatelessWidget {
  const CategoriesForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              width: double.infinity,
              decoration: _buildDecoration(),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    
                    const SizedBox(height: 30,),

                    TextFormField(
                      initialValue: "",
                      onChanged: (value) => value = value,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Este campo es obligatorio';
                        }
                      },
                      decoration: InputDecorations.authInputDecoration(
                        hintText: 'Nombre Categoria', 
                        labelText: 'Nombre',
                      ),
                    ),

                    const SizedBox(height: 30,),

                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      minWidth: double.infinity,
                      color: Colors.blue,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: const Text( 'Save',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      onPressed: (){},
                    ),

              const SizedBox(height: 20,),

              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                minWidth: double.infinity,
                color: Colors.red,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text( 'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),

                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}