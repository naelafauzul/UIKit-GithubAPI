# UIKit GitHub API

An iOS application built with **UIKit** that allows users to search GitHub profiles, view followers, and save favorite users with offline persistence.

This project emphasizes clean UIKit architecture, modular view composition, and robust networking with proper error handling.

---

## Screenshots
_Add screenshots or GIFs demonstrating the main features._

---

## Features
- Search GitHub users by username
- View user profile details and followers
- Infinite scrolling for followers list
- Save favorite users locally
- Offline access to saved favorites
- Asynchronous image loading with loading indicator
- Graceful error handling and empty states

---

## Tech Stack
- Swift
- UIKit (Programmatic UI)
- Auto Layout
- URLSession
- Diffable Data Source
- GitHub REST API

---

## Architecture

This project follows **MVC (Model–View–Controller)** with a pragmatic UIKit structure to maintain separation of concerns and scalability.

### MVC Breakdown
- **Model**
  - `User`, `Follower` — represent GitHub API response models
- **View**
  - Reusable UI components (`GFTitleLabel`, `GFBodyLabel`, `GFAvatarImageView`, `GFButton`)
  - TableView & CollectionView cells (`FavoriteCell`, `FollowerCell`)
- **Controller**
  - `SearchViewController`
  - `FollowersListViewController`
  - `UserInfoViewController`
  - `FavoritesListViewController`

### Parent & Child ViewControllers (Container Pattern)
Some screens are composed using a **Parent ViewController** that embeds multiple **Child ViewControllers** to modularize UI sections.

Example:
- `UserInfoViewController` (Parent)
  - `GFUserInfoHeaderVC` — user avatar & profile info
  - `GFRepoItemVC` — repository statistics
  - `GFFollowerItemVC` — follower actions

This approach improves UI modularity, reusability, and maintainability.

### Base ViewController
A `BaseViewController` is used as a shared foundation for common UI behaviors:
- Loading view management
- Empty-state presentation
- Common alert helpers
- Consistent layout configuration

---

## Networking & Error Handling

Networking is handled through a centralized `NetworkManager` using `URLSession` and the GitHub REST API.

### Request Flow
1. Construct endpoint URL
2. Validate URL
3. Execute request using `URLSession`
4. Validate HTTP response (`statusCode == 200`)
5. Validate response data
6. Decode JSON using `JSONDecoder` (`convertFromSnakeCase`)
7. Return result using `Result<T, GFError>`

### Error Handling
A custom `GFError` enum represents predictable failures:
- `invalidUsername`
- `unableToComplete`
- `invalidResponse`
- `invalidData`

Errors are presented through standardized alert helpers to ensure a consistent user experience.

### Image Loading
User avatars are loaded asynchronously with a loading indicator inside reusable cells.  
`prepareForReuse()` is used to prevent incorrect images due to cell reuse.

---

## Persistence
Favorite users are stored locally using a persistence manager, enabling:
- Offline access to saved favorites
- Data consistency across app launches

---

## UI States
The app explicitly handles:
- Loading state
- Empty state
- Error state

This ensures clear feedback during asynchronous operations.

---

## Getting Started
1. Clone the repository
2. Open the project in Xcode
3. Run on iOS Simulator (iOS 16+)

## API
- GitHub REST API (https://api.github.com)

## Future Improvements
- Add unit tests
- Improve error handling UI

## Author
**Naela Fauzul Muna**  
