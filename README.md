# Offline Outlet Ordering App

A Flutter application built for offline-first outlet order management.

## Architecture

The project follows the MVVM architecture with a clean separation of concerns.

```
Presentation
 ├── UI
 ├── Cubits (flutter_bloc)
Data
 ├── Repositories
 ├── Mock APIs
 ├── Drift Database
Models
```

## Tech Stack

- Flutter
- flutter_bloc (Cubit)
- GetIt (Dependency Injection)
- Drift (Offline Database)
- Repository Pattern

---

## Features Completed

### Outlet Management
- Fetch outlets from mock API.
- Cache outlets locally using Drift.
- Load outlets from local database.
- Repository abstraction implemented.

### Product Management
- Fetch products from mock API.
- Product quantity selection.
- State management using Cubit.

### Order Creation
- Create orders offline.
- Persist orders into Drift.
- Persist order items separately.
- Support multiple products per order.

### Local Database
Implemented using Drift.

Tables:
- Outlets
- Orders
- OrderItems

Relationships:
- One Order → Many OrderItems

### Offline Support
- Outlets available offline.
- Orders stored locally.
- Order items stored locally.

### Sync Engine (Basic)
Implemented a basic manual synchronization flow.

Workflow:

```
Pending
   ↓
Syncing
   ↓
Synced / Failed
```

Current implementation:
- Retrieve pending orders.
- Update status to `syncing`.
- Upload to mock API.
- Update status to `synced`.
- Mark failed uploads as `failed`.

---

## Architecture Highlights

- MVVM
- Repository Pattern
- Dependency Injection using GetIt
- Cubit state management
- Offline-first data persistence

---

## Current Status

### Completed
- Project architecture
- Dependency injection
- Offline outlet caching
- Product selection
- Order creation
- Drift database integration
- Order persistence
- Order item persistence
- Basic sync engine

---

## Pending / Future Improvements

### Geo Check-In
- Capture device location before order creation.
- Validate outlet proximity.

### Idempotency
- Prevent duplicate uploads.
- Retry-safe synchronization.

### Automatic Background Sync
- Trigger synchronization when connectivity is restored.

### Conflict Resolution
- Handle duplicate or conflicting server responses.

### Testing
- Repository unit tests.
- Cubit tests.
- Drift database tests.
- Sync engine tests.

### UI Improvements
- Order history per outlet.
- Sync status indicators.
- Retry failed sync.
- Better loading/error states.

---

## Assumptions

- Mock APIs simulate backend behavior.
- Drift acts as the offline storage layer.
- Orders are synchronized manually.
- Authentication is out of scope.

---

## Future Scope

- Real REST API integration
- Background synchronization
- Connectivity monitoring
- Pagination
- Search & filtering
- Push-based sync
- Analytics & logging

---

## Project Status

| Module | Status |
|---------|--------|
| Architecture | ✅ |
| Dependency Injection | ✅ |
| Outlet Module | ✅ |
| Product Module | ✅ |
| Offline Database | ✅ |
| Order Creation | ✅ |
| Offline Persistence | ✅ |
| Basic Sync Engine | ✅ |
| Geo Check-In | ⏳ |
| Idempotency | ⏳ |
| Background Sync | ⏳ |
| Tests | ⏳ |

---

**Overall Progress:** Approximately **75–80%** of the assignment has been completed. The core offline-first architecture, local persistence, and basic synchronization flow are in place. The remaining work mainly involves production-grade enhancements such as geo check-in, idempotent synchronization, automated background sync, conflict handling, and test coverage.
