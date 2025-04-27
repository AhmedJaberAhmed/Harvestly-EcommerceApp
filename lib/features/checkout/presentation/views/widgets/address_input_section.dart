import 'package:ecommerece_fruites/core/widgets/cutom_text_field.dart';
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});

  final GlobalKey<FormState> formKey;
  final   ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:   ValueListenableBuilder<AutovalidateMode>(
        valueListenable:valueListenable ,
        builder: (context,value,child)=> Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value){
          
                  context.read<OrderInputEntity>().shippingAddressEntity!.name=value;
                },
                  hintText: "الاسم الكامل", textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField( onSaved: (value){
          
                context.read<OrderInputEntity>().shippingAddressEntity!.email=value;
              },
                  hintText: "البريد الاكتروني", textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField( onSaved: (value){
          
                context.read<OrderInputEntity>().shippingAddressEntity!.address=value;
              },
                  hintText: "العنوان", textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField( onSaved: (value){
          
                context.read<OrderInputEntity>().shippingAddressEntity!.city=value;
              },
                  hintText: "المدينة", textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField( onSaved: (value){
          
                context.read<OrderInputEntity>().shippingAddressEntity!.floor=value;
              },
                  hintText: "رقم الطابق, رقم الشقة...",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField( onSaved: (value){
          
                context.read<OrderInputEntity>().shippingAddressEntity!.phone=value;
              },
                  hintText: "رقم الهاتف", textInputType: TextInputType.number),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
