import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../core/utils/theme/app_style.dart';
import '../../../../../core/utils/widgets/my_button.dart';
import '../../../../../core/utils/widgets/my_flex.dart';
import '../../../../../core/utils/widgets/my_flex_item.dart';
import '../../../../../core/utils/widgets/my_spacing.dart';
import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../product/navigator/getx_router/app_pages.dart';

class PriceListAppbar extends StatelessWidget with UIMixin {
  const PriceListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[200],
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
                        'Bu sayfadan istediğiniz ürün için fiyat listesi tanımlayabilir ve değişiklik yapabilirsiniz',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MyFlexItem(
              sizes: "lg-4",
              child: Row(
                children: [
                  SizedBox(width: 20),
                  MyButton(
                    elevation: 0,
                    onPressed: () {
                      Get.toNamed(AppPages.addPriceList);
                    },
                    padding: MySpacing.xy(12, 16),
                    //backgroundColor: contentTheme.primary,
                    backgroundColor: contentTheme.success,
                    borderRadiusAll: AppStyle.buttonRadius.medium,
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.plusCircle,
                          color: contentTheme.light,
                          size: 16,
                        ),
                        MySpacing.width(16),
                        MyText.bodySmall(
                          "Yeni Fiyat Listesi Oluşturma",
                          color: contentTheme.onPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
