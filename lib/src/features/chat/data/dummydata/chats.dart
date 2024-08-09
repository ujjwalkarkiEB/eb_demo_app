import '../model/chat.dart';
import '../model/user.dart';

const List<Chat> dummyChats = [
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9d",
      userName: "alice_jones",
      avatar: "https://example.com/avatars/alice_jones.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9c",
      userName: "john_doe",
      avatar: "https://example.com/avatars/john_doe.png",
    ),
    room: "general",
    isRead: false,
    message: "Hello everyone!",
    createdAt: "2024-08-09T12:00:00.000Z",
    updatedAt: "2024-08-09T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9e",
      userName: "bob_brown",
      avatar: "https://example.com/avatars/bob_brown.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9d",
      userName: "alice_jones",
      avatar: "https://example.com/avatars/alice_jones.png",
    ),
    room: "general",
    isRead: true,
    message: "Good morning, Alice!",
    createdAt: "2024-08-09T12:01:30.000Z", // 1 minute 30 seconds ago
    updatedAt: "2024-08-09T12:01:30.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9c",
      userName: "john_doe",
      avatar: "https://example.com/avatars/john_doe.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9e",
      userName: "bob_brown",
      avatar: "https://example.com/avatars/bob_brown.png",
    ),
    room: "private",
    isRead: false,
    message: "Are we meeting today?",
    createdAt: "2024-08-09T11:00:00.000Z", // 1 hour ago
    updatedAt: "2024-08-09T11:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9d",
      userName: "alice_jones",
      avatar: "https://example.com/avatars/alice_jones.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9b",
      userName: "jane_smith",
      avatar: "https://example.com/avatars/jane_smith.png",
    ),
    room: "general",
    isRead: true,
    message: "Let's catch up later.",
    createdAt: "2024-08-08T12:00:00.000Z", // 1 day ago
    updatedAt: "2024-08-08T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9e",
      userName: "bob_brown",
      avatar: "https://example.com/avatars/bob_brown.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9d",
      userName: "alice_jones",
      avatar: "https://example.com/avatars/alice_jones.png",
    ),
    room: "private",
    isRead: false,
    message: "Can you review my work?",
    createdAt: "2024-08-07T12:00:00.000Z", // 2 days ago
    updatedAt: "2024-08-07T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9b",
      userName: "jane_smith",
      avatar: "https://example.com/avatars/jane_smith.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9e",
      userName: "bob_brown",
      avatar: "https://example.com/avatars/bob_brown.png",
    ),
    room: "general",
    isRead: true,
    message: "Let's finalize the plan.",
    createdAt: "2024-08-05T12:00:00.000Z", // 4 days ago
    updatedAt: "2024-08-05T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9c",
      userName: "john_doe",
      avatar: "https://example.com/avatars/john_doe.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9b",
      userName: "jane_smith",
      avatar: "https://example.com/avatars/jane_smith.png",
    ),
    room: "general",
    isRead: false,
    message: "Where is the meeting room?",
    createdAt: "2024-08-02T12:00:00.000Z", // 7 days ago
    updatedAt: "2024-08-02T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9d",
      userName: "alice_jones",
      avatar: "https://example.com/avatars/alice_jones.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9c",
      userName: "john_doe",
      avatar: "https://example.com/avatars/john_doe.png",
    ),
    room: "private",
    isRead: true,
    message: "Let's go for lunch.",
    createdAt: "2024-07-25T12:00:00.000Z", // 15 days ago
    updatedAt: "2024-07-25T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9e",
      userName: "bob_brown",
      avatar: "https://example.com/avatars/bob_brown.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9b",
      userName: "jane_smith",
      avatar: "https://example.com/avatars/jane_smith.png",
    ),
    room: "general",
    isRead: false,
    message: "Meeting postponed to 2 PM.",
    createdAt: "2024-07-20T12:00:00.000Z", // 20 days ago
    updatedAt: "2024-07-20T12:00:00.000Z",
  ),
  Chat(
    sender: User(
      id: "60d5ec6c8a6f0c001f9e8f9b",
      userName: "jane_smith",
      avatar: "https://example.com/avatars/jane_smith.png",
    ),
    receiver: User(
      id: "60d5ec6c8a6f0c001f9e8f9c",
      userName: "john_doe",
      avatar: "https://example.com/avatars/john_doe.png",
    ),
    room: "private",
    isRead: true,
    message: "See you at the meeting.",
    createdAt: "2024-07-10T12:00:00.000Z", // 30 days ago
    updatedAt: "2024-07-10T12:00:00.000Z",
  )
];
