# DomainList

A lightweight, user-friendly SwiftUI app that allows users to search for domain names and simulate purchasing them.

## Features

- **Real-time Domain Search**: Begin searching for domains with just 3 characters
- **Smart Results Display**: View available domains with instant feedback
- **Mock Purchase Flow**: Simulate the domain purchasing experience
- **Clean MVVM Architecture**: Well-structured code with separation of concerns
- **Responsive UI States**: Elegant handling of loading, empty, and error states

## Implementation Details

The app is built using SwiftUI and follows the MVVM (Model-View-ViewModel) architecture pattern. Key components include:

- Protocol-oriented approach for flexible dependency injection
- Custom network layer with comprehensive error handling
- Debounced search to prevent excessive API calls
- Elegant state management for different UI scenarios
- Reusable UI components for maintainability
- Integration of IQKeyboardManager via Swift Package Manager for improved keyboard handling

While time constraints limited the full implementation of protocol-oriented programming principles, the foundation is in place for future expansion.
### Demo
<div align="leading">
  <img src="https://github.com/user-attachments/assets/10279649-edfe-4ce8-bbf0-2a90af2cdec0" alt="gif" width="200">
</div>

### Screenshots
<div style="display: flex; justify-content: space-between;">
  <img src="https://github.com/user-attachments/assets/9edcb0c0-b5c8-4e1a-bf36-2d06c8cce68f" width="200" alt="Search Results">
  <img src="https://github.com/user-attachments/assets/118d4df3-3824-4416-ba65-b703d608a615" width="200" alt="Search Details">
  <img src="https://github.com/user-attachments/assets/c7903c8c-402d-4853-9c4f-d813ee38c66e" width="200" alt="Error Handling">
  <img src="https://github.com/user-attachments/assets/a859da4f-62e4-4182-b0b4-ca1b6a57fb00" width="200" alt="Confirmation screen"> 
  <img src="https://github.com/user-attachments/assets/1a4933ff-1bdc-45a8-9c99-e53d6781f469" width="200" alt="purchase success screen"> 
</div>


The purchase flow includes domain information, pricing details, and simulated checkout with confirmation.
