import 'package:flutter/material.dart';
import 'package:shopping/ui/common/ui_helpers.dart';
import 'package:shopping/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TopSection extends ViewModelWidget<HomeViewModel> {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
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
    );
  }
}
