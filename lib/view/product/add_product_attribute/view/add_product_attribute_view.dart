import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_pool/cubit/product_pool_cubit.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/utils/theme/app_style.dart';
import '../../../../core/utils/widgets/my_button.dart';
import '../../../../core/utils/widgets/my_container.dart';
import '../../../../core/utils/widgets/my_flex.dart';
import '../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';
import '../../../../core/utils/widgets/ui_mixin.dart';
import '../../../../product/utility/layouts/responsive.dart';
import '../../../../product/utility/widgets/my_dropdown_field.dart';
import '../../../../product/utility/widgets/my_textform_field.dart';
import 'subviews/add_product_attribute_appbar.dart';

class AddProductAttributeView extends StatelessWidget with UIMixin {
  const AddProductAttributeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductPoolCubit()..init(),
      child: BasicScaffold(
          child: Layout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddProductAttributeAppbar(),
            Padding(
              padding: MySpacing.x(flexSpacing / 2),
              child: MyFlex(
                children: [
                  MyFlexItem(
                    sizes: "lg-7",
                    child: MyContainer(
                      paddingAll: 0,
                      child: Column(
                        children: [
                          MyContainer(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FeatherIcons.package,
                                  size: 16,
                                ),
                                MySpacing.width(12),
                                MyText.titleMedium(
                                  "Özellik Ekle",
                                  fontWeight: 600,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: MySpacing.all(flexSpacing),
                            child: Column(
                              children: [
                                MyFlexItem(
                                    sizes: "lg-6 md-12",
                                    child: Form(
                                        //todo validator eklenecek
                                        //key: controller.basicValidator.formKey,
                                        child: Column(
                                      children: [
                                        _codeAndInput(),
                                        SizedBox(height: 20),
                                        _mandatoryAndVisible(),
                                        SizedBox(height: 20),
                                        _searchableAndFilterable(),
                                        SizedBox(height: 20),
                                        _variantAndListenable(),
                                        SizedBox(height: 20),
                                        _nameAndErp(),
                                        SizedBox(height: 20),
                                        _preAndLocalizable(),
                                        SizedBox(height: 20),
                                        _description(),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            MyButton.small(
                                              elevation: 0,
                                              onPressed: () {
                                                Get.back();
                                              },
                                              padding: MySpacing.xy(12, 16),
                                              backgroundColor:
                                                  contentTheme.success,
                                              borderRadiusAll:
                                                  AppStyle.buttonRadius.medium,
                                              child: MyText.bodyLarge(
                                                "Kaydet",
                                                color: contentTheme.onPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Row _codeAndInput() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Attribute Code",
            ),
            MyTextFormField()
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Product Attribute Input Type",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [
              "Input Type 1",
              "Input Type 2",
              "Input Type 3",
              "Input Type 4",
            ])
          ],
        )),
      ],
    );
  }

  Row _mandatoryAndVisible() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Mandatory Attribute",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [
              "Mandatory Attribute 1",
              "Mandatory Attribute 2",
              "Mandatory Attribute 3",
              "Mandatory Attribute 4",
            ])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Is Visble",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
      ],
    );
  }

  Row _searchableAndFilterable() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Searchable",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Is Filterable",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
      ],
    );
  }

  Row _variantAndListenable() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Variant Attribute",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Is Variant Listenable",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
      ],
    );
  }

  Row _nameAndErp() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Attribute Name",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "ERP Code",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
      ],
    );
  }

  Row _preAndLocalizable() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Pre Attribute",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [
              'Attribute 1',
              'Attribute 2',
              'Attribute 3',
              'Attribute 4'
            ])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Is Localiable",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [true, false])
          ],
        )),
      ],
    );
  }

  Row _description() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Description",
            ),
            MyTextFormField(
                hintText: 'Description', minLine: 4, multiLine: true)
          ],
        ))
      ],
    );
  }
}
