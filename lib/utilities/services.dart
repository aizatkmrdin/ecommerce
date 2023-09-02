getDiscountPrice(double discountRate, int price) {
  return (price - (price * (discountRate / 100))).toStringAsFixed(2);
}
