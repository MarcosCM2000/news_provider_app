import 'package:flutter/material.dart';
import 'package:news_provider_app/models/models.dart';
import 'package:news_provider_app/theme/theme.dart';

class ListaNoticias extends StatelessWidget {
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: noticias.length,
        itemBuilder: ((context, index) {
          return _Noticia(noticia: noticias[index], index: index);
        }));
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({super.key, required this.noticia, required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(
          noticia: noticia,
        ),
        const _TarjetaBotones(),
        const SizedBox(height: 25),
        const Divider()
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({Key? key, required this.noticia, required this.index})
      : super(key: key);

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}', style: const TextStyle(color: Colors.redAccent)),
          Text(noticia.source.name, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({super.key, required this.noticia});
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen({super.key, required this.noticia});
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: noticia.urlToImage != null
                ? FadeInImage(
                    placeholder: const AssetImage('assets/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage!))
                : const Image(image: AssetImage('assets/no-image.png'))),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  const _TarjetaBody({super.key, required this.noticia});
  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description ?? ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.redAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          SizedBox(width: 15),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}
