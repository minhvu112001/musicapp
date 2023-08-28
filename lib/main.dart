import 'dart:io';
import 'song.dart';

void main() {
  List<Song> songs = [];

  while (true) {
    print('\nChoose an option:');
    print('1. Add a song');
    print('2. View all songs');
    print('3. Update a song');
    print('4. Delete a song');
    print('5. Exit');

    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        addSong(songs);
        break;
      case '2':
        viewSongs(songs);
        break;
      case '3':
        updateSong(songs);
        break;
      case '4':
        deleteSong(songs);
        break;
      case '5':
        exit(0);
        break;
      default:
        print('Invalid option');
    }
  }
}

void addSong(List<Song> songs) {
  print('Enter the song details:');
  print('Title:');
  String title = stdin.readLineSync()!;
  print('Artist:');
  String artist = stdin.readLineSync()!;
  print('Duration (in seconds):');
  int duration = int.parse(stdin.readLineSync()!);

  Song newSong = Song(title, artist, duration);
  songs.add(newSong);

  print('Song added successfully!');
}

void viewSongs(List<Song> songs) {
  if (songs.isEmpty) {
    print('No songs available');
  } else {
    print('\nAll Songs:');
    for (int i = 0; i < songs.length; i++) {
      print('${i + 1}. ${songs[i].title} - ${songs[i].artist} (${songs[i].duration} seconds)');
    }
  }
}

void updateSong(List<Song> songs) {
  if (songs.isEmpty) {
    print('No songs available');
  } else {
    viewSongs(songs);
    print('Enter the index of the song to update:');
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index >= 0 && index < songs.length) {
      print('Enter the updated song details:');
      print('Title:');
      String title = stdin.readLineSync()!;
      print('Artist:');
      String artist = stdin.readLineSync()!;
      print('Duration (in seconds):');
      int duration = int.parse(stdin.readLineSync()!);

      songs[index].title = title;
      songs[index].artist = artist;
      songs[index].duration = duration;

      print('Song updated successfully!');
    } else {
      print('Invalid index');
    }
  }
}

void deleteSong(List<Song> songs) {
  if (songs.isEmpty) {
    print('No songs available');
  } else {
    viewSongs(songs);
    print('Enter the index of the song to delete:');
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index >= 0 && index < songs.length) {
      songs.removeAt(index);
      print('Song deleted successfully!');
    } else {
      print('Invalid index');
    }
  }
}