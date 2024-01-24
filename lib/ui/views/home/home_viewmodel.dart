import 'package:shopping/data_model/merchant_data_model.dart';
import 'package:shopping/data_model/product_data_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool loadProducts = false;
  bool loadMerchants = false;

  void actionActivateCredit() {}

  void actionSearch() {}

  void actionViewMore() {}

  void actionMoveToProduct() {}

  void actionMoveToMerchant() {}

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

  final List<MerchantDataModel> _merchants = [
    MerchantDataModel(
      image: 'assets/png/imate_stores.png',
      name: 'IMate Stores',
      isActive: true,
    ),
    MerchantDataModel(
      image: 'assets/png/okay_fones.png',
      name: 'OkayFones',
      isActive: true,
    ),
    MerchantDataModel(
      image: 'assets/png/oga_bassey.png',
      name: 'Ogabassey',
      isActive: true,
    ),
    MerchantDataModel(
      image: 'assets/png/dreamworks.png',
      name: 'Dreamworks',
      isActive: true,
    ),
    MerchantDataModel(
      image: 'assets/png/hubmart.png',
      name: 'Hubmart',
    ),
    MerchantDataModel(
      image: 'assets/png/just_used.png',
      name: 'Just Used',
    ),
    MerchantDataModel(
      image: 'assets/png/slot.png',
      name: 'Slot',
    ),
    MerchantDataModel(
      image: 'assets/png/orile.png',
      name: 'Orile Resturant',
    ),
  ];

  List<MerchantDataModel> merchants = [];

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

  Future<List<MerchantDataModel>> _fetchMerchants() async {
    loadMerchants = true;
    rebuildUi();

    try {
      await Future.delayed(const Duration(seconds: 4));
      merchants = _merchants;
      return merchants;
    } finally {
      loadMerchants = false;
      rebuildUi();
    }
  }

  Future<void> init() async {
    await Future.wait([
      _fetchProducts(),
      _fetchMerchants(),
    ]);
  }
}
