import 'package:test3/Maxlook/models/prdouct.dart';
import 'package:test3/Maxlook/models/product_form.dart';
import 'package:test3/Maxlook/utils/enums.dart';

import '../models/ad.dart';

List<Product> productsData = [
  Product(
      id: '1',
      name: 'faux suede boxy collared bomber',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.m, ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j1.jpg',
            mainImage: 'lib/Maxlook/images/j1.jpg',
            detailsMainPic: 'lib/Maxlook/images/j1.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j1.jpg',
              'lib/Maxlook/images/j1.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [ProductSize.m, ProductSize.xl, ProductSize.s],
      price: 320,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'Bomber jackets are another item that\'s become an absolute 00s clothing essential. Go oversized for a relaxed streetwear mood, and if you\'re feelin\' flush, treat yourself to satin, varsity, and cotton twill men\'s bomber jackets',
      overallRating: 4.5,
      isNew: false,
      isPopular: true,
      hasShortage: false,
      maxQuantityToOrder: 4),
  Product(
      id: '2',
      name: 'Stretch Harrington With Patch Pockets',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j2.jpg',
            mainImage: 'lib/Maxlook/images/j2.jpg',
            detailsMainPic: 'lib/Maxlook/images/j2.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j2.jpg',
              'lib/Maxlook/images/j2.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [
        ProductSize.m,
        ProductSize.s,
        ProductSize.xl,
        ProductSize.s
      ],
      price: 410,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'If you\'re searching for a casual cover-up to go with everything, look no further than this men\'s Harrington jacket. Ideal for the transitional spring and summer months when the weather becomes warmer, this waist-length jacket features a zip-down front so you can throw it on over any outfit with ease. As a functional option, layer up this lightweight jacket over sweatshirts or wear it alone with a T-shirt, polo shirt or casual shir',
      overallRating: 4.0,
      isNew: true,
      isPopular: false,
      hasShortage: false,
      maxQuantityToOrder: 3),
  Product(
      id: '3',
      name: 'boxy collared bomber',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.m, ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j1.jpg',
            mainImage: 'lib/Maxlook/images/j1.jpg',
            detailsMainPic: 'lib/Maxlook/images/j1.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j1.jpg',
              'lib/Maxlook/images/j1.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [ProductSize.m, ProductSize.xl, ProductSize.s],
      price: 320,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'Bomber jackets are another item that\'s become an absolute 00s clothing essential. Go oversized for a relaxed streetwear mood, and if you\'re feelin\' flush, treat yourself to satin, varsity, and cotton twill men\'s bomber jackets',
      overallRating: 4.5,
      isNew: false,
      isPopular: true,
      hasShortage: false,
      maxQuantityToOrder: 4),
  Product(
      id: '4',
      name: 'faux suede boxy collared bomber',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.m, ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j1.jpg',
            mainImage: 'lib/Maxlook/images/j1.jpg',
            detailsMainPic: 'lib/Maxlook/images/j1.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j1.jpg',
              'lib/Maxlook/images/j1.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [ProductSize.m, ProductSize.xl, ProductSize.s],
      price: 320,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'Bomber jackets are another item that\'s become an absolute 00s clothing essential. Go oversized for a relaxed streetwear mood, and if you\'re feelin\' flush, treat yourself to satin, varsity, and cotton twill men\'s bomber jackets',
      overallRating: 4.5,
      isNew: false,
      isPopular: true,
      hasShortage: false,
      maxQuantityToOrder: 4),
  Product(
      id: '5',
      name: 'Stretch Harrington With Patch Pockets',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j2.jpg',
            mainImage: 'lib/Maxlook/images/j2.jpg',
            detailsMainPic: 'lib/Maxlook/images/j2.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j2.jpg',
              'lib/Maxlook/images/j2.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [
        ProductSize.m,
        ProductSize.s,
        ProductSize.xl,
        ProductSize.s
      ],
      price: 410,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'If you\'re searching for a casual cover-up to go with everything, look no further than this men\'s Harrington jacket. Ideal for the transitional spring and summer months when the weather becomes warmer, this waist-length jacket features a zip-down front so you can throw it on over any outfit with ease. As a functional option, layer up this lightweight jacket over sweatshirts or wear it alone with a T-shirt, polo shirt or casual shir',
      overallRating: 4.0,
      isNew: true,
      isPopular: false,
      hasShortage: false,
      maxQuantityToOrder: 3),
  Product(
      id: '6',
      name: 'boxy collared bomber',
      forms: [
        ProductForm(
            formId: '1',
            size: [ProductSize.m, ProductSize.xl, ProductSize.s],
            formThumbImage: 'lib/Maxlook/images/j1.jpg',
            mainImage: 'lib/Maxlook/images/j1.jpg',
            detailsMainPic: 'lib/Maxlook/images/j1.jpg',
            detailsSubPics: [
              'lib/Maxlook/images/j1.jpg',
              'lib/Maxlook/images/j1.jpg'
            ])
      ],
      mainFormId: '1',
      producedSizes: [ProductSize.m, ProductSize.xl, ProductSize.s],
      price: 320,
      gender: ProductGender.men,
      type: ProductType.jacket,
      description:
          'Bomber jackets are another item that\'s become an absolute 00s clothing essential. Go oversized for a relaxed streetwear mood, and if you\'re feelin\' flush, treat yourself to satin, varsity, and cotton twill men\'s bomber jackets',
      overallRating: 4.5,
      isNew: false,
      isPopular: true,
      hasShortage: false,
      maxQuantityToOrder: 4),
];

List<Ad> adsData = [
  Ad(
      id: '1',
      name: 'season off 2024 - 20%',
      imageUrl: 'lib/Maxlook/images/jacket_ad1.jpg'),
  // Ad(id: '1', name: '', imageUrl: 'lib/Maxlook/images/jacket_ad1.jpg'),
];
