import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageCache extends StatefulWidget {
  const MyImageCache({Key? key}) : super(key: key);

  @override
  State<MyImageCache> createState() => _MyImageCacheState();
}

class _MyImageCacheState extends State<MyImageCache> {
  List<String> imagens = [
    'https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/709552/pexels-photo-709552.jpeg?auto=compress&cs=tinysrgb&w=300',
    'https://images.pexels.com/photos/142497/pexels-photo-142497.jpeg?auto=compress&cs=tinysrgb&w=300',
    'https://images.pexels.com/photos/1146706/pexels-photo-1146706.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: imagens.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: 100,
                height: 110,
                color: Colors.grey,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: imagens[index],
                  maxHeightDiskCache: 344,
                  maxWidthDiskCache: 344,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[400],
                      ),
                    ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
Image(
                  image: CachedNetworkImageProvider(
                    imagens[index],
                    maxWidth: 344,
                    maxHeight: 344,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    // no loadingProgress temos o total de bytes, e o baixado, se estiver carregada é null
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[400],
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
*/