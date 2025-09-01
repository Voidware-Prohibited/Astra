#!/usr/bin/env bash

# Define an associative array to store provider details
declare -A providers

# --- Functions for prompting ---

# Function to get secure, hidden input for secrets
get_secure_input() {
  local prompt_text="$1"
  local var_name="$2"
  read -r -s -p "$prompt_text" "$var_name"
}

# Function to get standard input
get_standard_input() {
  local prompt_text="$1"
  local var_name="$2"
  read -r -p "$prompt_text" "$var_name"
}

# Function to prompt for provider details
prompt_provider_details() {
  local provider_name="$1"
  echo "--- Configuring $provider_name ---"
  get_standard_input "Enter $provider_name API Key: " api_key
  get_secure_input "Enter $provider_name Secret: " secret
  get_standard_input "Enter $provider_name Callback URL: " callback_url

  providers["$provider_name.api_key"]="$api_key"
  providers["$provider_name.secret"]="$secret"
  providers["$provider_name.callback_url"]="$callback_url"
  echo ""
  echo "Configuration for $provider_name saved."
  echo ""
}

# --- Main script ---

#
#     ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░
#    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
#    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
#    ░▒▓████████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓████████▓▒░
#    ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
#    ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
#    ░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
#
#    ┏━┃┏━ ┛┏┏ ┏━┃   ┃   ┏━┃┃ ┃┏━┃┏━┃
#    ┏━┃┃ ┃┃┃┃┃┏━┃  ━┏┛  ┏━┃┃ ┃┏┏┛┏━┃
#    ┛ ┛┛ ┛┛┛┛┛┛ ┛   ┛   ┛ ┛━━┛┛ ┛┛ ┛
#

echo "--- Aspira Setup ---"

# Menu for Mode
echo "First, we need to set the Mode."
PS3='Choose a Mode: '
# Define the options in an array
options=("Dedicated Server" "Master Server")

# Use select to present the options and capture the user's choice
select choice in "${options[@]}"; do
    case $choice in
        "Dedicated Server")
            selected_option="A"
            echo "You selected: Dedicated Server"
            break # Exit the select loop
            ;;
        "Option B")
            selected_option="B"
            echo "You selected: Master Server"
            break # Exit the select loop
            ;;
        *)
            echo "Invalid option. Please enter 1 or 2."
            ;;
    esac
done

echo "The chosen option saved in 'selected_option' variable is: $selected_option"

# Prompt for HMAC secret (hidden input)
echo "First, we need to set the global HMAC secret."
get_secure_input "Enter the HMAC secret: " hmac_secret
echo ""
echo "HMAC secret configured."
echo ""

# Menu for OAuth2 providers
PS3='Choose an OAuth2 provider to configure (or "Done" to finish): '
options=("GitHub" "Google" "Twitch" "Add Another" "Done")

while true; do
  select opt in "${options[@]}"; do
    case $opt in
      "GitHub")
        prompt_provider_details "GitHub"
        break
        ;;
      "Google")
        prompt_provider_details "Google"
        break
        ;;
      "Twitch")
        prompt_provider_details "Twitch"
        break
        ;;
      "Add Another")
        get_standard_input "Enter the name of the provider: " custom_provider
        prompt_provider_details "$custom_provider"
        break
        ;;
      "Done")
        echo "Configuration complete. Displaying results:"
        break 2 # Break out of both the case and the select loop
        ;;
      *)
        echo "Invalid option. Please try again."
        ;;
    esac
  done
done

# --- Display collected data and save to a file ---

echo "-------------------------------------"
echo "Generated Configuration"
echo "-------------------------------------"
echo "MODE=\"$selected_option\"" > config.env
echo "MODE: ${selected_option}"
echo "" >> config.env
echo "HMAC_SECRET=\"$hmac_secret\"" > config.env
echo "HMAC_SECRET: [HIDDEN]"
echo "" >> config.env

for provider in "${!providers[@]}"; do
  key="${provider%.*}"
  value="${provider#*.}"
  if [[ "$value" == "api_key" ]]; then
    echo "## $key"
    echo "$key.API_KEY=\"${providers[$provider]}\"" >> config.env
    echo "$key API Key: ${providers[$provider]}"
  elif [[ "$value" == "secret" ]]; then
    echo "$key.SECRET=\"${providers[$provider]}\"" >> config.env
    echo "$key Secret: [HIDDEN]"
  elif [[ "$value" == "callback_url" ]]; then
    echo "$key.CALLBACK_URL=\"${providers[$provider]}\"" >> config.env
    echo "$key Callback URL: ${providers[$provider]}"
  fi
done

echo ""
echo "Configuration has been written to config.env"
echo "Note: The actual HMAC and provider secrets are written to the file."
# cat "$ENV_FILE"

# Launch Docker Compose
echo "Launching Astra..."
docker-compose up -d

echo "Astra launched successfully."