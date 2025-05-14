import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/services/gemini_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GeminiService geminiService;
  List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;
  ChatCubit(this.geminiService) : super( ChatInitial(messages: []));

  Future<void> sendMessage(String message) async {
    _messages.add(ChatMessage(text: message, isUser: true));
    emit(ChatLoading(messages: List.from(_messages)));
    try {
      final response = await GeminiService.sendQuery(userQuery: message);
      if (response != null) {
        final aiMessage = ChatMessage(text: response, isUser: false);
        _messages.add(aiMessage);
        emit(ChatSuccess(response: response, messages: List.from(_messages)));
      } else {
        emit(ChatError(error: 'Failed to get response from AI.', messages: List.from(_messages)));
      }
    } catch (e) {
      emit(ChatError(error: e.toString(), messages: List.from(_messages)));
    }
  }


}
