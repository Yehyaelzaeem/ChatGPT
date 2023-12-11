class ChatModel {
  final String msg;
  final int chatIndex;
   bool? isLike=false;
   bool? isNotLike=false;

  ChatModel({
    required this.msg,required this.chatIndex,
});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );
}
