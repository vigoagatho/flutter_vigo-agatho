import 'package:api_implement/models/post_model.dart';
import 'package:flutter/material.dart';

class ModelCard extends StatelessWidget {
  final PostModel postModel;

  const ModelCard({ Key? key, required this.postModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.purple.shade800
      ),
      child: Column(
        children: [
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const SizedBox(
          //       width: 50,
          //       child: Text('ID'),
          //     ),
          //     SizedBox(width: 220, child: Text(':${postModel.id}'),)
          //   ],
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                child: Text('Name'),
              ),
              SizedBox(width: 220, child: Text(': ${postModel.name}'),)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                child: Text('Job'),
              ),
              SizedBox(width: 220, child: Text(': ${postModel.job}'),)
            ],
          ),

        ],
      ),
      
    );
  }
}