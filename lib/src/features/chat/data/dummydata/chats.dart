import '../model/chat.dart';
import '../model/user.dart';

const List<Chat> dummyMessages = [
  Chat(
    sender: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    receiver: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    room: 'room1',
    isRead: true,
    message: 'Hey dolly, how are you?',
    createdAt: '2024-08-12T10:00:00Z',
    updatedAt: '2024-08-12T10:00:00Z',
  ),
  Chat(
    sender: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    receiver: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    room: 'room1',
    isRead: false,
    message: 'I am good, Bibek. What about you?',
    createdAt: '2024-08-12T10:02:00Z',
    updatedAt: '2024-08-12T10:02:00Z',
  ),
  Chat(
    sender: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    receiver: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    room: 'room2',
    isRead: false,
    message: 'Did you see the latest post?',
    createdAt: '2024-08-13T11:15:00Z',
    updatedAt: '2024-08-13T11:15:00Z',
  ),
  Chat(
    sender: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    receiver: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    room: 'room2',
    isRead: false,
    message: 'Yes, it’s really interesting!',
    createdAt: '2024-08-13T11:20:00Z',
    updatedAt: '2024-08-13T11:20:00Z',
  ),
  Chat(
    sender: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    receiver: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    room: 'room3',
    isRead: true,
    message: 'Are we meeting tomorrow?',
    createdAt: '2024-08-14T09:45:00Z',
    updatedAt: '2024-08-14T09:45:00Z',
  ),
  Chat(
    sender: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    receiver: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    room: 'room3',
    isRead: false,
    message: 'Yes, let’s meet at 3 PM.',
    createdAt: '2024-08-14T09:50:00Z',
    updatedAt: '2024-08-14T09:50:00Z',
  ),
  Chat(
    sender: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    receiver: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    room: 'room4',
    isRead: false,
    message: 'Thanks for your help today!',
    createdAt: '2024-08-15T14:30:00Z',
    updatedAt: '2024-08-15T14:30:00Z',
  ),
  Chat(
    sender: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    receiver: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    room: 'room4',
    isRead: false,
    message: 'You’re welcome!',
    createdAt: '2024-08-15T14:35:00Z',
    updatedAt: '2024-08-15T14:35:00Z',
  ),
  Chat(
    sender: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    receiver: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    room: 'room5',
    isRead: true,
    message: 'What’s the plan for the weekend?',
    createdAt: '2024-08-16T16:00:00Z',
    updatedAt: '2024-08-16T16:00:00Z',
  ),
  Chat(
    sender: User(
      id: '66aca8c8d9b3649d2d4b7de0',
      userName: 'dollychai123',
      avatar: null,
    ),
    receiver: User(
      id: 'user1',
      userName: 'bibek',
      avatar: null,
    ),
    room: 'room5',
    isRead: true,
    message: 'I’m thinking of going hiking. What about you?',
    createdAt: '2024-08-16T16:05:00Z',
    updatedAt: '2024-08-16T16:05:00Z',
  ),
  // Add more dummy data as needed
];
