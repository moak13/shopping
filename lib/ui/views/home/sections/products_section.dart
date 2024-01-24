import 'package:flutter/material.dart';
import 'package:shopping/ui/common/ui_helpers.dart';
import 'package:shopping/ui/views/home/home_viewmodel.dart';
import 'package:shopping/ui/views/home/widgets/product_card.dart';
import 'package:stacked/stacked.dart';

class ProductsSection extends ViewModelWidget<HomeViewModel> {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SliverToBoxAdapter(
      child: Container(
        color: const Color(0xffF1F3FE),
        child: Builder(
          builder: (context) {
            if (viewModel.loadProducts) {
              return Column(
                children: [
                  SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        top: 14,
                        left: 21,
                        right: 21,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SkeletonLoader(
                          loading: viewModel.loadProducts,
                          child: const SizedBox(
                            height: 174,
                            width: 161,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return horizontalSpace(24);
                      },
                      itemCount: 5,
                    ),
                  ),
                  verticalSpace(26),
                  SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        bottom: 14,
                        left: 21,
                        right: 21,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SkeletonLoader(
                          loading: viewModel.loadProducts,
                          child: const SizedBox(
                            height: 174,
                            width: 161,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return horizontalSpace(24);
                      },
                      itemCount: 5,
                    ),
                  ),
                ],
              );
            }

            return Column(
              children: [
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 14,
                      left: 21,
                      right: 21,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = viewModel.products.elementAt(index);
                      return ProductCard(
                        product: product,
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) {
                      return horizontalSpace(24);
                    },
                    itemCount: viewModel.products.length,
                  ),
                ),
                verticalSpace(26),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      bottom: 14,
                      left: 21,
                      right: 21,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product =
                          viewModel.products.reversed.elementAt(index);
                      return ProductCard(
                        product: product,
                        onTap: viewModel.actionMoveToProduct,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return horizontalSpace(24);
                    },
                    itemCount: viewModel.products.reversed.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
