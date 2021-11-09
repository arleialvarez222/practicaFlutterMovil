import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/form/input_decoration.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Add Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            
            _FormProduct(),
            
          ],
        ),
      ),
    );
  }
}

class _FormProduct extends StatelessWidget {
  const _FormProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
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
                    return 'This field is required';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Name of product', 
                  labelText: 'Name',
                ),
              ),

              const SizedBox(height: 30,),

              TextFormField(
                initialValue: "",
                onChanged: (value) => value = value,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'This field is required';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Brand of product', 
                  labelText: 'Brand',
                ),
              ),

              const SizedBox(height: 30,),

              TextFormField(
                initialValue: "",
                onChanged: (value) => value = value,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'This field is required';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Code of product', 
                  labelText: 'Code',
                ),
              ),

              const SizedBox(height: 40,),

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
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );
}