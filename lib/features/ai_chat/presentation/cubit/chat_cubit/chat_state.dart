part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  final List<ChatMessage> messages;

  const ChatInitial({this.messages =const []});
  @override
  List<Object> get props => [messages];
}

final class ChatLoading extends ChatState {
  final List<ChatMessage> messages;

  const ChatLoading({required this.messages});
  @override
  List<Object> get props => [messages];
}

class ChatSuccess extends ChatState {
  final String response;
  final List<ChatMessage> messages;
  const ChatSuccess({required this.response, required this.messages});

  @override
  List<Object?> get props => [response, messages];
}

class ChatError extends ChatState {
  final String error;
  final List<ChatMessage> messages;

  const ChatError({required this.error, required this.messages});

  @override
  List<Object?> get props => [error, messages];
}

class ChatMessage extends Equatable {
  final String text;
  final bool isUser;

  const ChatMessage({required this.text,this.isUser = false});

  @override
  List<Object?> get props => [text, isUser];
}
