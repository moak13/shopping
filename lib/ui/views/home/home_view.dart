import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shopping/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';
import 'widgets/search_button.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 20,
                  bottom: 30,
                  top: 15,
                ),
                color: const Color(0xffD0DAFF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pay later',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'everywhere',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                                color: Colors.black,
                              ),
                            ),
                            horizontalSpace(7),
                            Container(
                              height: 17,
                              width: 17,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: const Icon(
                                Icons.priority_high,
                                size: 10,
                                color: Color(0xff274FED),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Shopping limit: ₦0',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff20294A),
                          ),
                        ),
                        verticalSpaceSmall,
                        MaterialButton(
                          onPressed: viewModel.actionActivateCredit,
                          color: const Color(0xff274FED),
                          child: const Text(
                            'Activate Credit',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
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
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
