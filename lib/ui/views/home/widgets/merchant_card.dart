import 'package:flutter/material.dart';
import 'package:shopping/data_model/merchant_data_model.dart';
import 'package:shopping/ui/common/ui_helpers.dart';

class MerchantCard extends StatelessWidget {
  final MerchantDataModel? merchant;
  final VoidCallback? onTap;
  const MerchantCard({
    super.key,
    this.merchant,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              MerchantLogo(
                logo: merchant?.image ?? '',
                isActive: merchant?.isActive ?? false,
              ),
              verticalSpaceTiny,
              Text(
                merchant?.name ?? '--',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xff1A1A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MerchantLogo extends StatelessWidget {
  final String logo;
  final bool isActive;
  const MerchantLogo({
    super.key,
    required this.logo,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          logo,
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        Builder(builder: (context) {
          if (isActive) {
            return Container(
              height: 15,
              width: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 11,
                width: 11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
