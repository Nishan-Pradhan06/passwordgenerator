# Random Password Generator

## About

This project is a **Random Password Generator** developed as a challenge from [Kodaschool](https://kodaschool.com/challenges/password-generator/65533e8aafffe611529ef892). It is implemented using Flutter with Provider for state management, allowing for dynamic password generation based on user preferences.

## Features

- **Random Password Generation**: Generate secure and random passwords.
- **Customizable Criteria**: Users can specify whether to include letters, numbers, and special characters.
- **Responsive Design**: The app is designed to adapt to various screen sizes.
- **State Management**: Utilizes Provider for managing the application state effectively.
- **Persistent Settings**: Uses SharedPreferences to save user preferences for password criteria and onboarding status.

## Usage

1. **Generate Password**: Tap the "Generate" button to create a random password based on your selected criteria.
2. **Customize Options**: Use the toggles to include or exclude letters, numbers, and special characters in the generated password.
3. **Copy to Clipboard**: Tap the "Copy" button to copy the generated password to your clipboard.

## Customization

- **Letters**: Toggle to include or exclude uppercase and lowercase letters.
- **Numbers**: Toggle to include or exclude numbers.
- **Special Characters**: Toggle to include or exclude special characters.
## Screenshots
![App Screenshot](https://github.com/Nishan-Pradhan06/passwordgenerator/blob/main/assets/demo/ss1.png)

![App Screenshot](https://github.com/Nishan-Pradhan06/passwordgenerator/blob/main/assets/demo/ss2.png)



## Setup Instructions

### Prerequisites

Before setting up the project, ensure you have the following installed:

- **Flutter**: Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) to install Flutter and set up your environment.
- **Dart**: Dart is included with Flutter.

### Clone the Repository

To get a local copy of the project, follow these steps:

1. **Open your terminal or command prompt.**
2. **Clone the repository** by running the following command:
    ```bash
    git clone https://github.com/Nishan-Pradhan06/passwordgenerator
    ```
3. **Navigate to the project directory**:
    ```bash
    cd passwordgenerator
    ```

### Installation

Once you have the project on your local machine, you need to fetch the required dependencies:

1. **Install dependencies** by running the following command in the project directory:
    ```bash
    flutter pub get
    ```

---

By following these steps, you will have the project set up and ready to run on your local machine. If you encounter any issues during the setup process, ensure that Flutter and Dart are correctly installed and configured by running `flutter doctor` in your terminal.
