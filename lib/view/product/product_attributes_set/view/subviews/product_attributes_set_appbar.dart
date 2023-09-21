import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_flex.dart';
import '../../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../../core/utils/widgets/my_text.dart';

class ProductAttributesSetAppbar extends StatelessWidget with UIMixin {
  const ProductAttributesSetAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: MyFlex(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyFlexItem(
            sizes: "lg-8",
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText.titleLarge(
                        "ÖZELLİK SETLERİ",
                      ),
                      MyText(
                        'Bu Sayfada Ürün Özellik Setlerini Yönetebilirsiniz',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
