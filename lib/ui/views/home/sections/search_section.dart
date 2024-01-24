import 'package:flutter/material.dart';
import 'package:shopping/ui/common/ui_helpers.dart';
import 'package:shopping/ui/views/home/home_viewmodel.dart';
import 'package:shopping/ui/views/home/widgets/search_button.dart';
import 'package:stacked/stacked.dart';

class SearchSection extends ViewModelWidget<HomeViewModel> {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products or stores',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff9494B8),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff9494B8),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF1F3FE),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            horizontalSpace(20),
            SearchButton(
              onTap: viewModel.actionSearch,
            ),
          ],
        ),
      ),
    );
  }
}
