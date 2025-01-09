#!/bin/bash

# Default directory path for audio files
DEFAULT_DIR="/home/$USER/Music"

# Function to play audio
play_audio() {
    local file="$1"
    mpv --no-terminal --loop "$file" &
    music_pid=$!
    display_player "$file"
}

# Function to handle Ctrl+C (SIGINT)
cleanup_and_exit() {
    echo -e "\n\e[34mExiting... Stopping audio playback. Bye-bye! 🐧\e[0m"
    pkill -9 mpv 2>/dev/null
    exit 0
}

# Function to display music player UI and allow browsing and playing audio files
display_player() {
    local file="$1"

    # Display current song playing
    echo -e "\e[33mCurrent playing: $file 🎶\e[0m"

    # Allow user to browse and select another audio file while current file is playing
    while true; do
        # List available audio files in the system for browsing
        selected_file=$(find /home/$USER/ -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.flac" \) 2>/dev/null | fzf --header="Select a song to play 🐧" --height=20% --border)

        # If user selects a file, stop the current playback and play the new file
        if [[ -n "$selected_file" ]]; then
            pkill -9 mpv 2>/dev/null  # Stop the current song
            play_audio "$selected_file"  # Play the selected song
            break  # Exit the loop and restart display_player with new song
        else
            echo -e "\e[31mNo file selected, oops! Returning to the menu... 🐧\e[0m"
            break
        fi
    done
}

# Function to list and select audio files
select_audio_file() {
    local audio_files
    local total_files
    local files_processed=0

    # Show the progress bar message
    echo -e "\e[34mSearching for audio files in /home/$USER/ 🐧\e[0m"

    # Use find command to get all audio files
    audio_files=$(find /home/$USER/ -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.flac" \) 2>/dev/null)

    # Count total files found
    total_files=$(echo "$audio_files" | wc -l)

    # If files are found, simulate a progress bar while searching
    if [[ $total_files -gt 0 ]]; then
        echo -e "\e[33mFound $total_files audio files! 🐧🎶\e[0m"

        # Create a progress bar using a loop
        while IFS= read -r file; do
            # Simulate some processing (progress bar)
            files_processed=$((files_processed + 1))
            percent=$((files_processed * 100 / total_files))
            printf "\r\e[32m[%-50s] %d%%\e[0m" $(printf "%0.s#" $(seq 1 $((percent / 2)))) $percent
            sleep 0.01  # Simulate delay (you can adjust the speed of the bar)
        done <<< "$audio_files"

        # New line after progress bar is done
        echo -e "\n\e[32mSearch completed. You can now select a file to play. 🐧🎶\e[0m"

        # Allow the user to select a file using fzf
        selected_file=$(echo "$audio_files" | fzf --header="Select a song to play 🎧" --height=20% --border)

        # If a file is selected, play it
        if [[ -n "$selected_file" ]]; then
            play_audio "$selected_file"
        else
            echo -e "\e[31mNo file selected. Returning to the menu... 🐧\e[0m"
            sleep 1
        fi
    else
        echo -e "\e[31mNo audio files found in the system. Please add some! 🐧\e[0m"
        sleep 2
    fi
}

# Ensure the Music directory exists
if [[ ! -d "$DEFAULT_DIR" ]]; then
    mkdir -p "$DEFAULT_DIR"
fi

# Change to default music directory
cd "$DEFAULT_DIR" || {
    echo -e "\e[31mFailed to access the default music directory: $DEFAULT_DIR 🐧\e[0m"
    exit 1
}

# Trap Ctrl+C (SIGINT) and call cleanup_and_exit
trap cleanup_and_exit SIGINT

# Main menu loop
while true; do
    clear
    echo -e "\e[34m=============================\e[0m"
    echo -e "\e[34m      Terminal Music Player 🐧🎧      \e[0m"
    echo -e "\e[34m=============================\e[0m"
    echo -e "\e[33m1. Browse and Play Audio Files 🐧🎶\e[0m"
    echo -e "\e[33m2. Exit 🐧\e[0m"
    echo -e "\e[34m=============================\e[0m"
    read -p "Enter your choice: " choice
    clear

    case $choice in
        1)
            select_audio_file
            ;;
        2)
            cleanup_and_exit
            ;;
        *)
            echo -e "\e[31mInvalid choice. Please try again. 🐧\e[0m"
            sleep 1
            ;;
    esac
done
