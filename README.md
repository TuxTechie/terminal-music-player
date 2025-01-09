# Terminal Music Player

A simple Bash script to play audio files from the terminal. This script allows users to browse and play audio files from a specified directory using the `mpv` player and `fzf` for selection.

## Features

- Browse and play audio files from the terminal.
- Supports various audio file formats including MP3, WAV, OGG, and FLAC.
- Displays a progress bar while searching for audio files.
- Handles user input to select and play audio files.
- Gracefully exits on Ctrl+C and stops audio playback.
- Colorful output with `lolcat`.

## Prerequisites

- `mpv` - A free, open-source, and cross-platform media player.
- `fzf` - A general-purpose command-line fuzzy finder.
- `lolcat` - A tool for rainbow-colored text output.

## Installation

1. Ensure that `mpv`, `fzf`, and `lolcat` are installed on your system. You can install them using your package manager. For example, on Ubuntu/Debian:

    ```sh
    sudo apt-get update
    sudo apt-get install mpv fzf lolcat
    ```

2. Clone this repository or download the script:

    ```sh
    git clone https://github.com/TuxTechie/terminal-music-player.git
    cd terminal-music-player
    ```

3. Make the script executable:

    ```sh
    chmod +x terminal-music-player.sh
    ```

## Usage

1. Run the script:

    ```sh
    ./terminal-music-player.sh
    ```

2. Use the menu to browse and play audio files or exit the script.

## License

This project is licensed under the GPL v3.0 License. See the [LICENSE](LICENSE) file for details.
