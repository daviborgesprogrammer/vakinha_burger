import 'package:dw9delivery/app/core/extensions/formatter_extensions.dart';
import 'package:dw9delivery/app/core/ui/styles/text_styles.dart';
import 'package:dw9delivery/app/dto/order_product_dto.dart';
import 'package:dw9delivery/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/env/env.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;
  const DeliveryProductTile(
      {super.key, required this.product, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult = await Navigator.of(context).pushNamed(
          '/productDetail',
          arguments: {'product': product, 'order': orderProduct},
        );

        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProductResult as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                        fontSize: 12,
                        color: ColorsApp.i.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 4),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: '${Env.i['backend_base_url']}/${product.image}',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
