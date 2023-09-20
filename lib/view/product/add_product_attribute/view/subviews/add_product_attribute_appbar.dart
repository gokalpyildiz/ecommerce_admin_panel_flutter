import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_text.dart';

class AddProductAttributeAppbar extends StatelessWidget with UIMixin {
  const AddProductAttributeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText.titleLarge(
                  "ÜRÜN ÖZELLİKLERİ",
                ),
                MyText(
                  'Bu Sayfada Ürün Özellik Gruplarını Görüntüleyebilir ve Yönetebilirsiniz',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
