import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DisplayImageChange extends StatelessWidget {
  final File imageSource;
  final Size size;
  final Color iconColor;
  final Color backgroundColor;
  final ValueChanged<ImageSource> onClicked;

  const DisplayImageChange({
    Key? key,
    required this.imageSource,
    required this.size,
    required this.iconColor,
    required this.backgroundColor,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath = imageSource.path;
    final image = imagePath.contains("https://")
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(
              color: backgroundColor,
              width: 5,
            ),
          ),
          child: Ink(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: image as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 35,
          width: size.width + 10,
          child: IconButton(
            iconSize: 20,
            icon: Icon(Icons.edit),
            color: iconColor,
            onPressed: () async {
              final source = await showImageSource(context);
              if (source == null) return;

              onClicked(source);
            },
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

Future<ImageSource?> showImageSource(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.add_a_photo_outlined),
          title: Text('Camera'),
          onTap: () => Navigator.of(context).pop(ImageSource.camera),
        ),
        ListTile(
          leading: Icon(
            Icons.photo_library_outlined,
          ),
          title: Text('Galeria'),
          onTap: () => Navigator.of(context).pop(ImageSource.gallery),
        ),
      ],
    ),
  );
}
