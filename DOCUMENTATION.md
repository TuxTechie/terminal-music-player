# Terminal Music Player

## Overview

The Terminal Music Player is a Bash script that allows users to browse and play audio files from the terminal. It uses `mpv` as the audio player, `fzf` as the fuzzy finder for file selection, and `lolcat` for colorful output. The script displays a menu for users to select audio files and handles audio playback gracefully.

## Script Details

### Variables

- `DEFAULT_DIR`: The default directory path for audio files.

### Functions

- `play_audio(file)`: Plays the specified audio file using `mpv` in the background.
- `cleanup_and_exit()`: Handles the Ctrl+C (SIGINT) signal, stops audio playback, and exits the script.
- `display_player(file)`: Displays the music player UI and allows browsing and playing audio files.
- `select_audio_file()`: Lists and selects audio files, displays a progress bar while searching, and allows the user to play selected files.

### Main Flow

1. The script checks if the default music directory exists and creates it if not.
2. Changes to the default music directory.
3. Sets up a trap for the Ctrl+C signal to call `cleanup_and_exit`.
4. Displays a main menu loop with options to browse and play audio files or exit.
5. Handles user input to browse and play audio files or exit.

## Dependencies

- `mpv`: A media player used for audio playback.
- `fzf`: A fuzzy finder used for file selection.
- `lolcat`: A tool for rainbow-colored text output.

## Usage Instructions

1. Ensure `mpv`, `fzf`, and `lolcat` are installed on your system.
2. Download and make the script executable.
3. Run the script and use the menu to browse and play audio files.

## Notes

- The script supports audio file formats including MP3, WAV, OGG, and FLAC.
- The script gracefully handles the Ctrl+C signal to stop audio playback and exit.

## License

This project is licensed under the GPL v3.0 License. See the [LICENSE](LICENSE) file for details.
