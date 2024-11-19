
# Flutter News Application

This is a Flutter application designed to fetch and display news articles dynamically. It follows a modular architecture using packages and utilizes the BLoC (Business Logic Component) pattern to manage state efficiently.

## Demo

The demo of the application running can be found [here](https://youtu.be/-RKzEBfd9RU)

## Project Structure

The project is organized into a **main application** and two custom **packages**:

### Packages
1. **news_api**
   - **Purpose**: Handles fetching data from the API and converting it into Dart models.
   - **Responsibilities**:
     - Connects to the news API endpoint.
     - Parses the API response into Dart objects for use in the application.

2. **news_repository**
   - **Purpose**: Acts as a bridge between the `news_api` package and the application logic.
   - **Responsibilities**:
     - Fetches data from the `news_api` package.
     - Implements the BLoC pattern:
       - Defines **BLoC Events** to handle user actions or system triggers.
       - Defines **BLoC States** to represent various states of the application (e.g., loading, error, success).
       - Creates the **actual BLoC** to manage the transition between events and states.

### Main Application
- **Purpose**: Renders the user interface based on the states provided by the BLoC.
- **Workflow**:
  1. A BLoC instance is created in the `main` function.
  2. The application listens to states emitted by the BLoC.
  3. The UI updates dynamically based on the current state (e.g., displaying a loading indicator, error messages, or news articles).

## Key Features
- **Separation of Concerns**: Each package handles a specific responsibility, ensuring clean and maintainable code.
- **Reactive State Management**: The BLoC pattern efficiently manages application state and transitions.
- **Dynamic UI Updates**: The UI adapts to state changes automatically, providing a responsive user experience.

## Getting Started

### Prerequisites
- **Flutter SDK**: Ensure Flutter is installed and configured. [Get Flutter](https://flutter.dev/docs/get-started/install)
- **API Access**: Obtain access to the news API and configure it in the `news_api` package. I have left my API key in the code, feel free to use that for the remaining number of uses left.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/KhizarA77/Flutter-News-Application
   ```
2. Navigate to the project directory:
   ```bash
   cd newsapp
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```

### Directory Structure
```plaintext
newsapp/
├── packages/
│   ├── news_api/
│   │   ├── lib/
│   ├── news_repository/
│   │   ├── lib/
├── lib/
│   ├── main.dart
│   ├── custom_tiles.dart     
│   ├── NewsScreen.dart
│   ├── shimmer_tile.dart 
```

### Running the Application
1. Run the application on a connected device or emulator:
   ```bash
   flutter run
   ```

## Usage
1. The application fetches news articles when launched.
2. The UI updates to show loading, error, or the fetched news articles based on the current state.

## Future Improvements
- Add more API integrations (e.g., for categories, trending news).
- Implement caching for offline support.
- Enhance error handling and retry mechanisms.

## Contributing
Feel free to fork the repository, create a feature branch, and submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).
