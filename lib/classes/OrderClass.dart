class Order {
  final int idOrder;
  final int idClient;
  final int idPrepa;
  final int stateOrder;
  final String timestamp;

  const Order({
    required this.idOrder,
    required this.idClient,
    required this.idPrepa,
    required this.stateOrder,
    required this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id_order': int idOrder,
      'id_client': int idClient,
      'id_picker': int idPrepa,
      'order_state': int stateOrder,
      'date': String timestamp,
      } =>
          Order(
            idOrder: idOrder,
            idClient: idClient,
            idPrepa: idPrepa,
            stateOrder: stateOrder,
            timestamp: timestamp,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
