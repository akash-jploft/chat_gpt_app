class UserChatModel {
  bool isUser;
  String message;
  ChatType? chatType;

  UserChatModel({required this.isUser, required this.message, this.chatType});
}

List<UserChatModel> chatList = [
  UserChatModel(
      isUser: false,
      message: "How can I help you today?",
      chatType: ChatType.text),
  UserChatModel(
      isUser: true, message: "Code a landing page", chatType: ChatType.text),
  UserChatModel(
      isUser: false, message: "Code a landing page", chatType: ChatType.text),
  UserChatModel(
      isUser: false, chatType: ChatType.code, message: '''#include <iostream>

int main() {
    Solution solution;
    
    // Example usage:
    TreeNode* tree1 = new TreeNode(1);
    tree1->left = new TreeNode(2);
    tree1->right = new TreeNode(3);

    TreeNode* tree2 = new TreeNode(1);
    tree2->left = new TreeNode(2);
    tree2->right = new TreeNode(3);

    bool result = solution.isSameTree(tree1, tree2);
    
    if (result) {
        std::cout << "The trees are the same." << std::endl;
    } else {
        std::cout << "The trees are not the same." << std::endl;
    }
    
    // Don't forget to free the allocated memory for the trees to avoid memory leaks.
    delete tree1;
    delete tree2;

    return 0;
}
    '''),
  //ChatModel(isUser: false, message: "How can I help you today?"),
];

enum ChatType { text, code }
