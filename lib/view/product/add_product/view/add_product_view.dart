import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/product/constants/image_constants.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/widgets/my_dropdown_field.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/widgets/my_textform_field.dart';
import 'package:ecommerce_yildiz_flutter/view/product/add_product/cubit/add_product_cubit.dart';
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
import '../../../../product/utility/widgets/my_dotted_line.dart';
import 'subviews/add_product_appbar.dart';

class AddProductView extends StatelessWidget with UIMixin {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BasicScaffold(
          child: Layout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddProductAppbar(),
            SizedBox(height: 40),
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
                                  "Ürün Ekle",
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
                                        _nameAndCode(),
                                        SizedBox(height: 20),
                                        _skuAndType(),
                                        SizedBox(height: 20),
                                        _attributeAndState(),
                                        SizedBox(height: 20),
                                        _fileAndDescription(),
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

  Widget _fileAndDescription() {
    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        var cubit = context.read<AddProductCubit>();
        return Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText.labelMedium(
                  "Ürün fotoğrafları",
                ),
                SizedBox(height: 10),
                InkWell(
                  // onTap:
                  //     controller.pickFile,
                  onTap: cubit.pickFile,
                  child: MyDottedLine(
                    strokeWidth: 0.2,
                    color: contentTheme.onBackground,
                    corner: const MyDottedLineCorner(
                      leftBottomCorner: 2,
                      leftTopCorner: 2,
                      rightBottomCorner: 2,
                      rightTopCorner: 2,
                    ),
                    child: Center(
                      child: Padding(
                        padding: MySpacing.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePath.instance.fileImage,
                              height: 200,
                            ),
                            MyContainer(
                              //width: 340,
                              alignment: Alignment.center,
                              paddingAll: 0,
                              child: MyText.titleMedium(
                                "Dosya Sürükle veya Yüklemek İçin Tıkla",
                                fontWeight: 600,
                                muted: true,
                                fontSize: 18,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyText.labelMedium(
                  "Ürün Açıklaması",
                ),
                MyTextFormField(
                    hintText: 'Ürün açıklaması', minLine: 3, multiLine: true)
              ],
            ))
          ],
        );
      },
    );
  }

  Row _attributeAndState() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Özellik Seti",
            ),
            MyDropDown(modelList: <String>[
              'Ürün Özellik Seti 1,',
              'Ürün Özellik Seti 2,',
              'Ürün Özellik Seti 3,',
              'Ürün Özellik Seti 4,',
              'Ürün Özellik Seti 5,',
            ])
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Ürün Tipi",
            ),
            MyDropDown(modelList: [
              true,
              false,
            ])
          ],
        )),
      ],
    );
  }

  Row _skuAndType() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "SKU",
            ),
            MyTextFormField(hintText: 'Sku')
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Ürün Tipi",
            ),
            // MyTextFormField(
            //     hintText: 'Ürün Tipi')
            MyDropDown(modelList: [
              "Ürün Tipi",
              "Ürün Tipi 2",
              "Ürün Tipi 3",
              "Ürün Tipi 4",
              "Ürün Tipi 5",
            ])
          ],
        )),
      ],
    );
  }

  Row _nameAndCode() {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Ürün Adı",
            ),
            MyTextFormField(hintText: 'Ürün Adı')
          ],
        )),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Base Code",
            ),
            MyTextFormField(hintText: 'Code')
          ],
        ))
      ],
    );
  }
}
