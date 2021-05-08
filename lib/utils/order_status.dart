class OrderStatus {
  final String title;
  final String id;

  const OrderStatus({
    required this.title,
    required this.id,
  });
}

class OrderStatusEnum {
  static const OrderStatus shopping = OrderStatus(
    title: 'Đang mua hàng',
    id: '0',
  );

  static const OrderStatus processing = OrderStatus(
    title: 'Đơn hàng đang giao',
    id: '1',
  );

  static const OrderStatus done = OrderStatus(
    title: 'Đơn hàng hoàn thành',
    id: '2',
  );

  static const OrderStatus canceled = OrderStatus(
    title: 'Đã hủy',
    id: '3',
  );

  static const List<OrderStatus> statuses = [
    shopping,
    processing,
    done,
    canceled,
  ];

  static OrderStatus getStatusById({required String id}) {
    return statuses.firstWhere(
      (status) {
        return status.id == id;
      },
    );
  }

  static OrderStatus getStatusByTitle({required String title}) {
    return statuses.firstWhere(
      (status) {
        return status.title == title;
      },
    );
  }
}
