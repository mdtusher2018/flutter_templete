import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:template/protos/message.pb.dart';

part 'protobuf_service.g.dart';

@riverpod
Future<Greeting> greeting(Ref ref) async {
  // fetch protobuf binary from Node backend
  final response = await Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3000",
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      responseType: ResponseType.bytes,
    ),
  ).get("/hello");

  final bytes = Uint8List.fromList(response.data);
  return Greeting.fromBuffer(bytes);
}

class WelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetingAsync = ref.watch(greetingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Screen"),
      ),
      body: Center(
        child: greetingAsync.when(
          loading: () => CircularProgressIndicator(),
          error: (err, _) => Text("Failed to load data: $err"),
          data: (greeting) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name: ${greeting.name}", style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text(
                "Message: ${greeting.message}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
