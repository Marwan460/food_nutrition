import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/features/ai_chat/presentation/views/widgets/ai_indicator.dart';
import 'package:food_nutrition/features/ai_chat/presentation/views/widgets/message_container.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_icon.dart';
import '../../../../../res/assets_res.dart';
import '../../cubit/chat_cubit/chat_cubit.dart';
import 'chat_text_field.dart';

class AiChatViewBody extends StatefulWidget {
  const AiChatViewBody({super.key});

  @override
  State<AiChatViewBody> createState() => _AiChatViewBodyState();
}

class _AiChatViewBodyState extends State<AiChatViewBody> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  final _textController = TextEditingController();
  bool _isKeyboardVisible = false;

  void _handleKeyboardState() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
    _scrollController;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleKeyboardState);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0.0) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CustomIcon(
                  onPressed: () => Navigator.pop(context),
                  size: 16,
                  icon: Icons.arrow_back_ios_new,
                  backgroundColor: AppColors.lightGrey,
                  iconColor: AppColors.black,
                ),
                const SizedBox(width: 10),
                const Text('AI Hub', style: AppStyles.bold24),
              ],
            ),
          ),
          Expanded(
            child:
                BlocConsumer<ChatCubit, ChatState>(listener: (context, state) {
              if (state is ChatSuccess) {
                _scrollToBottom();
              }
            }, builder: (context, state) {
              final cubit = context.read<ChatCubit>();
              if (state is ChatInitial) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsRes.AI_CHAT),
                      const SizedBox(height: 20),
                      const Text('Ask your nutrition question!'),
                    ],
                  ),
                );
              }

              return Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.only(
                        bottom: _isKeyboardVisible
                            ? MediaQuery.of(context).viewInsets.bottom + 80
                            : 80,
                        left: 20,
                        right: 20),
                    itemCount: cubit.messages.length,
                    itemBuilder: (context, index) {
                      final message = cubit.messages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MessageContainer(
                          message: message.text,
                          isUser: message.isUser,
                        ),
                      );
                    },
                  ),
                  if (state is ChatLoading)
                    Positioned(
                      bottom: _isKeyboardVisible
                          ? MediaQuery.of(context).viewInsets.bottom + 20
                          : 20,
                      child: const AiIndicator(),
                    ),
                ],
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 10,
            ),
            child: ChatTextField(
              textEditingController: _textController,
              focusNode: _focusNode,
              onSendPressed: () {
                final message = _textController.text.trim();
                  if(message.isNotEmpty){
                    context.read<ChatCubit>().sendMessage(message);
                    _textController.clear();
                    _focusNode.unfocus();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                  }
              },
            ),
          ),
        ],
      ),
    );
  }
}
