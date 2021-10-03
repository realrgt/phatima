import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

final menuItems = [
  SalomonBottomBarItem(
    selectedColor: const Color(0xFF8C6D51),
    icon: const Icon(Icons.home, size: 30),
    title: const Text('Home'),
  ),
  SalomonBottomBarItem(
    selectedColor: const Color(0xFF8C6D51),
    icon: const Icon(Icons.shopping_cart, size: 30),
    title: const Text('Orders'),
  ),
  SalomonBottomBarItem(
    selectedColor: const Color(0xFF8C6D51),
    icon: const Icon(Icons.payment, size: 30),
    title: const Text('Finance'),
  ),
  SalomonBottomBarItem(
    selectedColor: const Color(0xFF8C6D51),
    icon: const Icon(Icons.person, size: 30),
    title: const Text('Profile'),
  )
];
