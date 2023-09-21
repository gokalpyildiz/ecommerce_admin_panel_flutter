import 'package:ecommerce_yildiz_flutter/view/product/price_list/cubit/price_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../core/utils/widgets/my_container.dart';
import '../../../../../core/utils/widgets/my_spacing.dart';
import '../../../../../core/utils/widgets/my_text.dart';
import '../../../../../product/utility/widgets/dialogs/show_dialogs.dart';

class PriceListFilter extends StatelessWidget {
  const PriceListFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceListCubit, PriceListState>(
      builder: (context, state) {
        var cubit = context.read<PriceListCubit>();
        return MyContainer.bordered(
          color: Colors.white,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.titleMedium('Filtreler'),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        showSelectItemDialog(
                          context: context,
                          title: 'Filtreler',
                          list: state.filterList ?? [],
                          onTapConfirmButton: cubit.setSelectedFilterIndexes,
                          selectedIndexList:
                              List<int>.from(state.selectedFilterIndexes ?? []),
                        );
                      },
                      icon: Icon(
                        LucideIcons.filter,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  for (var item in state.selectedFilterIndexes ?? [])
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildFilter(state.filterList![item as int]),
                    ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget buildFilter(String text) {
    return MyContainer.bordered(
      padding: MySpacing.x(12),
      alignment: Alignment.center,
      width: 300,
      height: 70,
      child: MyText.bodyMedium(text),
    );
  }
}
