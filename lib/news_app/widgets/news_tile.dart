import 'package:flutter/material.dart';
import '../model/articles.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.data,
    required this.onclick,
  });
  final VoidCallback onclick;
  final Article data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 3), // Offset in the vertical direction
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              data.urlToImage != ""
                  ? ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      child: Image.network(data.urlToImage,
                          height: 70.0, width: 70.0, fit: BoxFit.cover),
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Text(
                  data.title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            data.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(data.publishedAt),
          )
        ],
      ),
    );
  }
}
