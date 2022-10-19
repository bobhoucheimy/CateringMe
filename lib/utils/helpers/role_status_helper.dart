
import 'dart:ui';

import 'package:cater_me_v2/consts/order_status.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';

class StatusOrderHelper {
  static OrderStatusEnum getStatusEnum(String? status) {
    if (status == 'Payment Pending') {
      return OrderStatusEnum.PENDING;
    } else if (status == 'Received') {
      return OrderStatusEnum.RECEIVED;
    } else if (status == 'Preparing') {
      return OrderStatusEnum.PREPARING;
    } else if (status == 'Delivered') {
      return OrderStatusEnum.DELIVERED;
    }
    return OrderStatusEnum.PENDING;
  }

  static String getOrderImage(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.PENDING:
        return ImageAsset.WAITING;
      case OrderStatusEnum.RECEIVED:
        return ImageAsset.RECEIVE;
      case OrderStatusEnum.PREPARING:
        return ImageAsset.PREPARING;
      case OrderStatusEnum.DELIVERED:
        return ImageAsset.DELIVERED;
      default:
        return ImageAsset.WAITING;
    }
  }
  static Color getOrderColor(OrderStatusEnum status) {
    switch (status) {
      case OrderStatusEnum.PENDING:
        return Colors.yellow.shade900;

      case OrderStatusEnum.RECEIVED:
        return Colors.blue.shade900;

      case OrderStatusEnum.PREPARING:
        return Colors.brown.shade900;

      case OrderStatusEnum.DELIVERED:
        return Colors.green.shade900;
      default:
        return  Colors.yellow.shade900;
    }
  }

}
