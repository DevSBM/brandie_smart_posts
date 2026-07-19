import 'package:flutter/material.dart';

@immutable
class Product {
  const Product({
    required this.name,
    this.imagePath,
    required this.price,
    required this.discountPercentage,
    required this.trendingMessage,
    required this.productLink,
  });

  final String name;
  final String? imagePath;
  final double price;
  final int discountPercentage;
  final String trendingMessage, productLink;
}
