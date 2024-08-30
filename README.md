
# Drugs Order

DrugsOrder is a Flutter application designed to simplify the process of ordering drugs for a group of pharmacists in a hospital setting. The app provides a seamless experience for selecting, saving, and reviewing drug orders, making the daily tasks of pharmacists more efficient and organized.

## Features

- **Three Main Pages**:
  - **Home Page**: Displays the latest drug order for quick reference upon app launch.
  - **Drugs List Page**: Allows users to browse and select drugs from a list to create a new order.
  - **Order History Page**: Provides a history of all saved orders, enabling users to review past orders.

- **CRUD Operations**: The app supports full Create, Read, Update, and Delete functionalities for managing drug orders.

- **State Management**: Utilizes Riverpod for efficient and scalable state management throughout the app.

- **Local Database**: Implements the Isar local database for fast and reliable data storage.

- **Routing**: Uses `go_router` for handling navigation and routing within the app.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- A suitable IDE like Android Studio, IntelliJ IDEA, or Visual Studio Code.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/drugs_order.git
   cd drugs_order
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## Project Structure

The project follows a clean and organized folder structure:

- **lib/**:
    - **main.dart**: Entry point of the application.
    - **screens/**: Contains the different pages of the app (Home, Drugs List, Order History).
    - **models/**: Defines the data models used in the app, including the drug and order models.
    - **repositories/**: Manages data access and storage, including the DrugRepository and HistoryRepository.
    - **providers/**: Contains the Riverpod notifiers for managing state across the app.
    - **utils/**: Includes formatters, sizes and defualt drugs upon first launch.

## Usage

- **Home Page**: View the latest drug order immediately upon opening the app.
- **Drugs List Page**: Select drugs from a pre-defined list and save your order.
- **Order History Page**: Browse through all past orders, with options to edit or delete them.

## Technologies Used

- **Riverpod**: For state management, ensuring a reactive and maintainable app architecture.
- **Isar**: A local NoSQL database for storing drug data and orders efficiently.
- **GoRouter**: For navigation and routing within the app.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.