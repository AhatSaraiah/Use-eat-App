
import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String

}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
}

class ChatViewController: MessageViewController, MessagesDataSource , MessagesDisplayDelegate , MessagesLayoutDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "ahat")
    let othertUser = Sender(senderId: "self", displayName: "other")

    var messages = [MessageType]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let messagesCollectionView : MessagesCollectionView
        messagesCollectionView = MessagesCollectionView()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello")))
        
        messages.append(Message(sender: othertUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-70000),
                                kind: .text("Hi")))
        
        messages.append(Message(sender: currentUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-60000),
                                kind: .text("I want to order 5 meals")))
        
        messages.append(Message(sender: othertUser,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-56400),
                                kind: .text("WWhat is your address")))
     
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

}
