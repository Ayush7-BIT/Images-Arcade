#!/bin/bash
# Define color variables

BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`


echo "${YELLOW}${BOLD}Starting${RESET}" "${GREEN}${BOLD}Execution${RESET}"

gcloud alpha services api-keys create --display-name="awesome" 

KEY_NAME=$(gcloud alpha services api-keys list --format="value(name)" --filter "displayName=awesome")

export API_KEY=$(gcloud alpha services api-keys get-key-string $KEY_NAME --format="value(keyString)")

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')

gsutil mb gs://$PROJECT_ID

curl -LO raw.githubusercontent.com/Ayush7-BIT/Images-Arcade/main/PubSub%20Lite%3A%20Qwik%20Start/city.png

curl -LO raw.githubusercontent.com/Ayush7-BIT/Images-Arcade/main/PubSub%20Lite%3A%20Qwik%20Start/donuts.png

curl -LO raw.githubusercontent.com/Ayush7-BIT/Images-Arcade/main/PubSub%20Lite%3A%20Qwik%20Start/selfie.png

gsutil cp donuts.png gs://$PROJECT_ID

gsutil cp selfie.png gs://$PROJECT_ID

gsutil cp city.png gs://$PROJECT_ID

gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/donuts.png

gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/selfie.png

gsutil acl ch -u AllUsers:R gs://$PROJECT_ID/city.png

echo "${RED}${BOLD}Congratulations${RESET}" "${WHITE}${BOLD}for${RESET}" "${GREEN}${BOLD}Completing the Lab !!!${RESET}"
