import 'package:ecommerce_yildiz_flutter/core/components/basic_widgets/basic_scaffold.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_container.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex.dart';
import 'package:ecommerce_yildiz_flutter/core/utils/widgets/my_flex_item.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/layouts/layout.dart';
import 'package:ecommerce_yildiz_flutter/product/utility/widgets/my_textform_field.dart';
import 'package:ecommerce_yildiz_flutter/view/product/product_attributes_set/view/subviews/product_attributes_set_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/theme/app_style.dart';
import '../../../../core/utils/widgets/my_button.dart';
import '../../../../core/utils/widgets/my_spacing.dart';
import '../../../../core/utils/widgets/my_text.dart';
import '../../../../core/utils/widgets/ui_mixin.dart';

class ProductAttributesSetView extends StatelessWidget with UIMixin {
  const ProductAttributesSetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
        child: Layout(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductAttributesSetAppbar(),
        _addAttributeSet(),
        SizedBox(height: 30),
        MyFlex(children: [
          MyFlexItem(sizes: "lg-5", child: _allAttributes()),
          MyFlexItem(sizes: "lg-5", child: _selectedAttributes()),
        ]),
      ],
    )));
  }

  MyContainer _selectedAttributes() {
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium('SEÇİLİ ÖZELLİKLER'),
          SizedBox(
            height: 60,
            child: MyText.bodySmall(
                'Özellik setinde olmasını istediğiniz ürün özelliklerini aşağıdaki listeden düzenleyebilirsiniz. Düzenleme ve kaldırma istekleriniz sağ tarafta yer alan ikonlar tarafından gerçekleştirilebilir'),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: MyTextFormField(hintText: 'Attribute')),
              SizedBox(width: 20),
              MyButton(
                elevation: 0,
                onPressed: () {},
                padding: MySpacing.xy(12, 16),
                backgroundColor: contentTheme.primary,
                //backgroundColor: contentTheme.success,
                borderRadiusAll: AppStyle.buttonRadius.medium,
                child: Icon(
                  LucideIcons.edit,
                  color: contentTheme.light,
                  size: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  MyContainer _allAttributes() {
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium('TÜM ÖZELLİKLER'),
          SizedBox(
            height: 60,
            child: MyText.bodySmall(
                'Oluşturmak istediğiniz özellik setlerine hangi ürün özelliklerinin dahil olması gerektiğini aşağıdaki listeden düzenleyebilirsiniz'),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: MyTextFormField(hintText: 'Attribute')),
              SizedBox(width: 20),
              MyButton(
                elevation: 0,
                onPressed: () {},
                padding: MySpacing.xy(12, 16),
                backgroundColor: contentTheme.primary,
                //backgroundColor: contentTheme.success,
                borderRadiusAll: AppStyle.buttonRadius.medium,
                child: Icon(
                  LucideIcons.plusCircle,
                  color: contentTheme.light,
                  size: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  MyContainer _addAttributeSet() {
    return MyContainer.bordered(
      color: Colors.white,
      marginAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [MyText.titleMedium('Özellik Seti Ekle')],
          ),
          SizedBox(height: 20),
          MyText(
              'Özellik setlerinizi bu sayfadan oluşturabilir ve içermesi gereken tüm özelliklerinizi bu sayfadan yönetebilirsiniz'),
          SizedBox(height: 40),
          MyText('Özellik Seti Adı'),
          SizedBox(height: 10),
          MyTextFormField(),
          SizedBox(height: 20),
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
