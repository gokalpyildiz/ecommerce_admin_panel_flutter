import 'package:ecommerce_yildiz_flutter/core/utils/widgets/ui_mixin.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_text.dart';

class AddPriceListAppbar extends StatelessWidget with UIMixin {
  const AddPriceListAppbar({
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
                  "FİYAT LİSTESİ",
                ),
                MyText(
                  'Ürünün fiyat listesini bu sayfada görüntüleyebilir ve yönetebilirsiniz',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
