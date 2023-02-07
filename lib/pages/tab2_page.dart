import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_provider_app/models/category_model.dart';
import 'package:news_provider_app/services/services.dart';
import 'package:news_provider_app/widgets/widgets.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const _ListaCategorias(),
            Expanded(
                child: ListaNoticias(
                    noticias: newsService.getArticulosCategoriaSeleccionada))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category: categories[index]),
                  const SizedBox(height: 5),
                  Text(categories[index].name)
                ],
              ),
            );
          })),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context, listen: false);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: category.name == newsService.selectedCategory
              ? Colors.redAccent
              : Colors.black54,
        ),
      ),
    );
  }
}
