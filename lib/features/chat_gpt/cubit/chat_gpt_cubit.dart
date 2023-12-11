import 'package:chatgpt/core/theme/app_colors/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global/constatnties/app_string_constant.dart';
import '../../../core/helper/shared_preference/shared_preference.dart';
import '../../../core/servecies/api_service.dart';
import '../../onboarding/ui/onboarding_screen.dart';
import '../data/models/chat_model.dart';
import '../ui/widgets/text_widget.dart';
part 'chat_gpt_state.dart';

class ChatGptCubit extends Cubit<ChatGptState> {
  ChatGptCubit() : super(ChatGptInitial());
  static ChatGptCubit get(context)=>BlocProvider.of(context);
  TextEditingController textController=TextEditingController();
  List<ChatModel> chatList = [];
  List<ChatModel> chatHistoryList = [];
  bool isTyping = false;
  ScrollController listScrollController =ScrollController();
  FocusNode focusNode=FocusNode();




  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    chatHistoryList.add(ChatModel(msg: msg, chatIndex: 0));
    emit(SendMessageState());
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    emit(SendMessageState());
  }

  Future<void> sendMessageFCT({required ChatGptCubit chatGptCubit,required BuildContext context})
  async {
    if (isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor:AppColorDark.primaryColor,
        ),
      );
      return;
    }else{

      try {
        String msg = textController.text;
        isTyping = true;
        addUserMessage(msg: msg);
        textController.clear();
        focusNode.unfocus();
        await sendMessageAndGetAnswers(
            msg: msg, chosenModelId: AppStrings.currentModel);
        emit(SendMessageState());

      } catch (error) {
        print(error.toString());
      }
      finally {
        scrollListToEND();
        isTyping = false;
        emit(SendMessageState());
      }
    }


  }


  void scrollListToEND() {
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
    emit(EndSendMessageState());

  }

  bool isDark =false;
  changeMode(bool fromShard)async{
    if(fromShard.toString().isNotEmpty){
      isDark=fromShard;
      await CacheHelper.saveDate(key: 'isDark', value: isDark);
      emit(ChangeMode());
    }else{
      isDark =!isDark;
      await CacheHelper.saveDate(key: 'isDark', value: isDark);
      emit(ChangeMode());
    }

  }

 void deleteHistory(){
   chatList.clear();
   chatHistoryList.clear();
   emit(DeleteHistory());

 }

  void deleteHistoryItem(ChatModel chatModel){
    try{
      chatHistoryList.remove(chatModel);
      for(int n=0;n<=getChatList.length-1;n++ ){
        if(getChatList[n].msg==chatModel.msg){
          chatList.removeAt(n);
          chatList.removeAt(n);
          break;
        }
      }

      emit(DeleteHistory());
    }catch(e){
      print(e.toString());
    }
  }


void addLike(ChatModel chatModel){
  for(int n=0;n<=getChatList.length-1;n++ ){
    if(getChatList[n].msg==chatModel.msg){
      getChatList[n].isLike =true;
      getChatList[n].isNotLike =false;
      break;
    }
  }
  emit(AddLike());

}
void addDisLike(ChatModel chatModel){
  for(int n=0;n<=getChatList.length-1;n++ ){
    if(getChatList[n].msg==chatModel.msg){
      getChatList[n].isLike =false;
      getChatList[n].isNotLike =true;
      break;
    }
  }
  emit(AddDisLike());
}

  void logOut(context)async{
    CacheHelper.removeData(key: 'onBoarding');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoardingScreen()));
    emit(LogOutState());
  }

}
