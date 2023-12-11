part of 'chat_gpt_cubit.dart';

@immutable
abstract class ChatGptState {}

class ChatGptInitial extends ChatGptState {}
class SendMessageState extends ChatGptState {}
class EndSendMessageState extends ChatGptState {}
class LogOutState extends ChatGptState {}
class DeleteHistory extends ChatGptState {}
class ChangeMode extends ChatGptState {}
class AddLike extends ChatGptState {}
class AddDisLike extends ChatGptState {}
