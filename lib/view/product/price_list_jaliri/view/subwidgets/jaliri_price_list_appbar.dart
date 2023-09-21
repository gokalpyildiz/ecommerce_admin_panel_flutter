import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_flex.dart';
import '../../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../../core/utils/widgets/my_text.dart';

class JaliriPriceListAppbar extends StatelessWidget with UIMixin {
  const JaliriPriceListAppbar({
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
                        "FİYAT LİSTELERİ",
                      ),
                      MyText(
                        'Bu sayfada istediğiniz ürün için fiyat listesi tanımlayabilir ve değişiklik yapabilirsiniz',
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
