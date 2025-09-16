import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: 0.45,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Stock',
              hintText: 'Add Stock, only numbers are allowed',
            ),
            validator: (value) => TValidator.validateEmptyText('Stock', value),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          ),
        ),

        SizedBox(height: TSizes.spaceBtwInputFields,),

        Row(
          children: [
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
                hintText: 'Price with up-to 2 decimal',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],

            )),
            SizedBox(height: TSizes.spaceBtwItems,),
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Discount Price',
                hintText: 'Price with up-to 2 decimal',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],

            )),

          ],
        )
      ],
    ));
  }
}
