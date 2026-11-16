
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/widget/item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();

    final favoriteCandi = candiList.where((candi) {
      return favoriteProvider.isFavorite(candi.name);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
      ),
      body: favoriteCandi.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Belum ada candi favorit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: favoriteCandi.length,
              itemBuilder: (context, index) {
                return ItemCard(
                  candi: favoriteCandi[index],
                );
              },
            ),
    );
  }
}
