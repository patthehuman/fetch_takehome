
# Fetch Take Home

### Steps to Run the App

1. Clone the repository:
   ```bash
   git clone git@github.com:patthehuman/fetch_takehome.git
   ```
2. Open the project in Xcode:
   ```bash
   open fetch_takehome.xcworkspace
   ```
3. Ensure you are using Xcode 14 or later with iOS 16+ as the deployment target.
4. Build and run the app on a simulator or physical device by pressing `Cmd + R`.

---

### Focus Areas

**1. Clean Architecture:**
   - Adopted MVVM for a scalable, maintainable, and testable structure.
   - Clearly separated responsibilities between Model, ViewModel, and View.

**2. Performance Optimization:**
   - Implemented efficient image caching with memory and disk fallback.
   - Ensured that network requests are minimal by avoiding unnecessary reloads.

**3. Asynchronous Programming:**
   - Used `async/await` for all network calls to simplify concurrency and improve readability.
   - Gracefully handled errors and ensured proper user feedback.

**4. User Experience:**
   - Designed a simple UI to prioritize readability and responsiveness.
   - Included refresh functionality for users to reload recipes manually.

---

### Time Spent

Approximately 5 hours:
- **Project Setup and Architecture:** 1 hour
- **UI Implementation:** 2 hours
- **Networking and Caching:** 1.5 hours
- **Testing and Error Handling:** 0.5 hours

---

### Trade-offs and Decisions

1. **Minimal UI Enhancements:**
   - Focused on functionality rather than intricate animations or advanced UI designs due to time constraints.

2. **Custom Image Caching:**
   - Opted for a custom image caching mechanism instead of a library like SDWebImage to demonstrate knowledge of caching principles.

3. **Limited Sorting and Filtering:**
   - Did not implement sorting or filtering features to stay within the given timeframe.

---

### Weakest Part of the Project

- The UI is functional but basic. With more time, I would add animations and polish to improve the visual experience.
- Error handling could be more nuanced, with tailored messages for different failure scenarios.

---

### External Code and Dependencies

- None. All components, including the image caching mechanism, were implemented from scratch to demonstrate technical proficiency.

---

### Additional Information

- Testing focused on the networking layer and ViewModel logic.
