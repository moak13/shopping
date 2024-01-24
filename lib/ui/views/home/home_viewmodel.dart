import 'package:shopping/data_model/product_data_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool loadProducts = false;
  void actionActivateCredit() {}

  void actionSearch() {}

  final List<ProductDataModel> _products = [
    ProductDataModel(
      name: 'Nokia G20',
      image: 'assets/png/nokia_g20.png',
      promoPrice: '39,780',
      price: '88,000',
      companyLogo: '',
      hasPercent: true,
    ),
    ProductDataModel(
      name: 'iPhone XS Max 4GB..',
      image: 'assets/png/iphone_xs_max.png',
      promoPrice: '295,999',
      price: '315,000',
      companyLogo: 'assets/png/oga_bassey.png',
      hasPercent: false,
    ),
    ProductDataModel(
      name: 'Anker Soundcore..',
      image: 'assets/png/anker.png',
      promoPrice: '39,780',
      price: '88,000',
      companyLogo: 'assets/png/okay_fones.png',
      hasPercent: false,
    ),
    ProductDataModel(
      name: 'iPhone 12 Pro',
      image: 'assets/png/iphone_12_pro.png',
      promoPrice: '490,500',
      price: '515,000',
      companyLogo: 'assets/png/imate_stores.png',
      hasPercent: false,
    ),
  ];

  List<ProductDataModel> products = [];

  Future<List<ProductDataModel>> _fetchProducts() async {
    loadProducts = true;
    rebuildUi();

    try {
      await Future.delayed(const Duration(seconds: 3));
      products = _products;
      return products;
    } finally {
      loadProducts = false;
      rebuildUi();
    }
  }

  Future<void> init() async {
    await _fetchProducts();
  }
}
