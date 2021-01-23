class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground);
}

List<CardModel> cards = cardData
    .map(
      (item) => CardModel(
        item['user'],
        item['cardNumber'],
        item['cardExpired'],
        item['cardType'],
        item['cardBackground'],
      ),
    )
    .toList();

var cardData = [
  {
    "user": "Walter White",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "03/2030",
    "cardType": "assets/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
  },
  {
    "user": "Uncle Hank",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "04/2027",
    "cardType": "assets/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
  }
];
