class OfferModel {
  final String price;
  final String amount;

  OfferModel(this.price, this.amount);
}

var sellOfferList = <OfferModel>[
  OfferModel('61,196.59', '0.06373'),
  OfferModel('61,195.79', '0.00285'),
  OfferModel('61,195.75', '0.06050'),
  OfferModel('61,195.74', '0.06374'),
  OfferModel('61,194.41', '0.02000'),
  OfferModel('61,189.63', '0.02500'),
];

var buyOfferList = <OfferModel>[
  OfferModel('61,189.62', '0.31564'),
  OfferModel('61,189.61', '0.01386'),
  OfferModel('61,189.58', '0.00037'),
  OfferModel('61,189.30', '0.04084'),
  OfferModel('61,185.86', '0.08167'),
  OfferModel('61,185.06', '0.04448'),
];
