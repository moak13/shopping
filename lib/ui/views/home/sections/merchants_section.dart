import 'package:flutter/material.dart';
import 'package:shopping/ui/common/ui_helpers.dart';
import 'package:shopping/ui/views/home/home_viewmodel.dart';
import 'package:shopping/ui/views/home/widgets/merchant_card.dart';
import 'package:stacked/stacked.dart';

class MerchantsSection extends ViewModelWidget<HomeViewModel> {
  const MerchantsSection({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Merchants',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Color(0xff33334D),
                  ),
                ),
                TextButton(
                  onPressed: viewModel.actionViewMore,
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xff274FED),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(41),
          Builder(
            builder: (context) {
              if (viewModel.loadMerchants) {
                return Wrap(
                  spacing: 39,
                  runSpacing: 30,
                  children: List.generate(8, (index) {
                    return SkeletonLoader(
                      loading: viewModel.loadMerchants,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
                );
              }
              return Wrap(
                spacing: 39,
                runSpacing: 30,
                children: List.generate(viewModel.merchants.length, (index) {
                  final merchant = viewModel.merchants.elementAt(index);
                  return MerchantCard(
                    merchant: merchant,
                    onTap: viewModel.actionMoveToMerchant,
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
