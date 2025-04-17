# ESOL Hub Project Documentation

The ESOL Hub is a Ruby on Rails project that follows an MVC architecture. The front-end is generated using the RailsUI Hound theme. As a result, there are multiple unused files in some folders that will not be addressed. This document focuses on existing functionality with steps on extending and updating functionality into the future.

---

## About the Navigation and Create Button

The navigation bar is a static component rendered on every page. It includes a "Create" dropdown button for quick access to creating new Events, Resources, or Messages. This functionality uses Turbo Streams and RailsUI modals for a seamless user experience without full-page reloads.

### Future Developments
- Add additional create options as new features are added.
- Implement role-based access control (RBAC) to restrict create options based on user permissions.

---

## About the Calendar Page

### Model
**Event model**
- **Attributes:** `title`, `description`, `location`, `date`, `start_time`, `end_time`, `active`
- **Validations:** Basic presence validations
- **Scopes:** `active`, `upcoming`

### Controller
**EventsController**
- Handles CRUD operations for events
- Supports Turbo Stream responses for creating, updating, and deleting events
- Dynamic month-to-month navigation is supported without reloading the entire page

### Views
- Tailwind-based custom calendar layout
- Upcoming events listed alongside the calendar
- Event creation and editing occur inside modals
- Day-specific event previews triggered by clicking on a calendar day

### Future Developments
- Add recurring event support
- Add event categories or types
- Add event RSVPs or attendee management
- Improve mobile responsiveness for the calendar grid

---

## About the Resource List

### Model
**Resource model**
- **Attributes:** `title`, `description`, `category`, `posted_on`, `fulfilled`, `active`
- **Default values:** `posted_on` is set to today automatically; `active` defaults to true

### Controller
**ResourcesController**
- Handles CRUD operations for resources
- Filtering by active/inactive status
- Searching and sorting functionality available on the resource list page

### Views
- Card-based layout for resources
- Modals for resource creation and editing
- Filtering, sorting, and search bar components

### Future Developments
- Add file attachments (planned with Shrine)
- Allow users to \"mark as fulfilled\" with one click
- Add category filtering UI
- Batch archive functionality for admins

---

## About the Messages Page

### Model
**Message model**
- **Attributes:** `title`, `content`, `user_id`
- **Associations:** Belongs to User

### Controller
**MessagesController**
- Handles standard CRUD operations for messages
- Implements search functionality across title and content fields
- Supports Turbo Stream responses for dynamic interactions

### Views
- Forum-style message board layout
- Filters: \"Mine,\" \"Commented,\" and \"Recent\" views (planned)
- Search bar for messages
- Modal forms for creating new messages

### Future Developments
- Add support for threaded replies (nested comments)
- Add notification badges for new messages
- Implement a \"like\" or \"upvote\" system for messages
- Add user profile linking from messages

---

# Closing Notes

This document provides a snapshot of the current functionality of the ESOL Hub platform. The foundation is stable and extensible, designed with modern Rails best practices, Turbo, Tailwind CSS, and RailsUI Hound theme integration.

### Future work could focus on:
- Incrementally expanding functionality while maintaining UI/UX consistency
- Enhancing accessibility and mobile responsiveness
- Implementing more advanced user management and permissions
