import "package:flutter/material.dart";
import "package:picsflutter/src/models/image.dart";

class ImageList extends StatelessWidget {
  final List<Image_model> images;

  const ImageList(this.images, {super.key});

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
            margin: const EdgeInsets.all(20),
            color: Colors.amber,
            child: Column(
              children: [
                Image.network(images[index].url),
                Center(
                  child: Text(images[index].title),
                )
              ],
            ));
      },
    );
  }
}
