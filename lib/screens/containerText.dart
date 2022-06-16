import 'package:flutter/material.dart';
import 'package:notepads/models/user_data.dart';
import 'package:intl/intl.dart';

class ContainerText {
  var timeFormat = DateFormat("dd.MM.yyyy HH:mm");
  Widget build(BuildContext context, User user) {
    return Container(
      constraints: BoxConstraints(minHeight: 100, maxHeight: double.infinity),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      // height: 200,
      // width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${user.title}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 57, 9, 148),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${user.text}",
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                color: Color.fromARGB(255, 57, 9, 148),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.schedule,
                size: 16,
                color: Color(0xFF9094B0),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                timeFormat.format(user.time),
                style: TextStyle(color: Color(0xFF9094B0)),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
