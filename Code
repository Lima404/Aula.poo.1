void main() {
  valors();
}

void valors() {
  var product = Produto(2, "Capacete", "2 anos");
  var product2 = Produto(4, "Cinto", "5 anos");
  var product3 = Produto(3, "Chocolate", "2025");
  var item = Item(5, product);
  var item2 = Item(20, product2);
  var item3 = Item(10, product3);
  var sale = Sale("09/03/2020", [item, item2, item3]);
  print("thats all valor of sale: ");
  print(sale.total());
}

class Item {
  double quantity;
  double total() => quantity * product.price;
  Produto product;

  Item(this.quantity, this.product);
}

class Sale {
  String data;
  List<Item> itens;
  //Feito com base no código de Isayan
  double total() {
    var res = itens.reduce((value, element) {
      value.product.price = ((value.total() + element.total()) /
          (value.quantity + element.quantity));
      value.quantity += element.quantity;
      return value;
    });
    return res.total();
  }

  Sale(
    this.data,
    this.itens,
  );
}

class Produto {
  double price;
  String desc;
  String validity;

  Produto(this.price, this.desc, this.validity);
}
