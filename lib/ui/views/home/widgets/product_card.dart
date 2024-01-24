import 'package:flutter/material.dart';
import 'package:shopping/data_model/product_data_model.dart';
import 'package:shopping/ui/common/ui_helpers.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel? product;
  final VoidCallback? onTap;
  const ProductCard({
    super.key,
    this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      width: 161,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 5,
            spreadRadius: 0.35,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.only(
              left: 7,
              top: 6,
              right: 7,
              bottom: 6,
            ),
            child: Stack(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 96,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(product?.image ?? ''),
                          ),
                        ),
                      ),
                      verticalSpace(13),
                      Text(
                        product?.name ?? '--',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Color(0xff1A1A1A),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '₦ ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Color(0xff274FED),
                              ),
                              children: [
                                TextSpan(
                                  text: product?.promoPrice ?? '--',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '₦ ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffB3B3CC),
                                decoration: TextDecoration.lineThrough,
                              ),
                              children: [
                                TextSpan(
                                  text: product?.price ?? '--',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CompanyLogo(
                  logo: product?.companyLogo ?? '',
                  hasInitialPercent: product?.hasPercent ?? false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompanyLogo extends StatelessWidget {
  final String logo;
  final bool hasInitialPercent;
  const CompanyLogo({
    super.key,
    required this.logo,
    this.hasInitialPercent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 5,
          )
        ],
      ),
      child: Builder(
        builder: (context) {
          if (hasInitialPercent) {
            return Container(
              padding: const EdgeInsets.all(6),
              alignment: Alignment.center,
              child: const FittedBox(
                child: Column(
                  children: [
                    Text(
                      'Pay',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xffC1C1CE),
                      ),
                    ),
                    verticalSpaceSmall,
                    Text(
                      '40%',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Color(0xff274FED),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Image.asset(
            logo,
            height: 35,
            width: 35,
            fit: BoxFit.scaleDown,
          );
        },
      ),
    );
  }
}
