import 'dart:convert';
import 'package:http/http.dart' as http;


RequestNotifications({required String title,required String body,required String token})async{
  String serverToken = 'AAAAxfKVswM:APA91bFoUNmeVb2PXuh1rmSR6KZK0uN9K3dRqNGT2GlCjBK-SRzVHNusfHgOO0lF0z97fme2zjzWXlamdhblPeRPExQscSNxwdokr9eETTXmxt4_Q-XRJ_WYszoOrmyak3ZxRBP0qtfg';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':'key=$serverToken'
  };
  var request = http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
  request.body = json.encode({
    "to": token,
    "notification": {
      "title": title,
      "body": body,
      "mutable_content": true,
      "sound": "Tri-tone"
    },

    "data": {
      "name": "MOHAMMED ANWAE",
      "age": "23",
      "phone": "Ridmi Note 10"
    }

  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }
}

RequestNotificationsTopic({required String title,required String body,required String topic})async{
  String serverToken = 'AAAAxfKVswM:APA91bFoUNmeVb2PXuh1rmSR6KZK0uN9K3dRqNGT2GlCjBK-SRzVHNusfHgOO0lF0z97fme2zjzWXlamdhblPeRPExQscSNxwdokr9eETTXmxt4_Q-XRJ_WYszoOrmyak3ZxRBP0qtfg';
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':'key=$serverToken'
  };
  var request = http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
  request.body = json.encode({
    "to": "/topics/$topic",
    "notification": {
      "title": title,
      "body": body,
      "mutable_content": true,
      "sound": "Tri-tone"
    },

    "data": {
      "name": "MOHAMMED ANWAE",
      "age": "23",
      "phone": "Ridmi Note 10"
    }

  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }
}