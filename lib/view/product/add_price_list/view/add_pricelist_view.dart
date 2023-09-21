import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_container.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex_item.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_text.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/widgets/my_dropdown_field.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/widgets/my_textform_field.dart';
import 'package:ecommerce_yildiz_flutter/view/product/add_price_list/cubit/add_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/theme/app_style.dart';
import '../../../../core/utils/widgets/my_button.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import 'subviews/add_price_list_appbar.dart';

class AddPriceListView extends StatelessWidget with UIMixin {
  const AddPriceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPriceListCubit(),
      child: BasicScaffold(
          child: Layout(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddPriceListAppbar(),
          SizedBox(height: 20),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: "lg-5",
                child: MyContainer.bordered(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleMedium('Fiyat Listesi Ekleme'),
                        SizedBox(height: 5),
                        MyText.titleSmall(
                            'Yeni bir fiyat listesi ekleyerek bir kataloğu eşleştirebilirsiniz'),
                        SizedBox(height: 10),
                        MyText.bodyMedium('PRICE LIST NAME'),
                        MyTextFormField(),
                        SizedBox(height: 10),
                        MyText.bodyMedium('ERP CONNECTİON'),
                        MyDropDown(
                          modelList: [true, false],
                          hintText: 'ERP Connection',
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyButton.small(
                              elevation: 0,
                              onPressed: () {
                                Get.back();
                              },
                              padding: MySpacing.xy(12, 16),
                              //backgroundColor: contentTheme.onPrimary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: MyText.bodyLarge(
                                "Kaydet",
                                color: contentTheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ))),
    );
  }
}
