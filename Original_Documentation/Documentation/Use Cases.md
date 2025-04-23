## Use Cases

### Use Case 1: Organization Publishes Course Information
**Actor**: Organization (ESOL course provider)  
**Goal**: Publish information about available courses or resources using the platform.  
**Preconditions**: The organization is authenticated and has access to the platform.  
**Main Success Scenario**:
1. The organization logs in to the platform.
2. The organization navigates to the publishing form.
3. The organization fills in the form with relevant details (e.g., course name, schedule, curriculum, contact info).
4. The organization submits the form.
5. The system validates the input and stores the information in the database.
6. The information becomes available for administrators to view and manage in their interface.
**Postconditions**: The course information is stored and accessible for administrative review.

### Use Case 2: Admin Reviews and Approves Published Information
**Actor**: Admin  
**Goal**: Review and approve course information submitted by organizations.  
**Preconditions**: The admin is authenticated and logged in.  
**Main Success Scenario**:
1. The admin logs in to the platform.
2. The admin navigates to the dashboard displaying newly submitted information.
3. The admin reviews the content for accuracy, completeness, and compliance.
4. The admin approves or flags the content for revision.
5. Approved content becomes officially published on the platform.
**Postconditions**: Approved information is available for organizational use; flagged content is sent back for edits.

### Use Case 3: Admin Sends System-Wide Announcements
**Actor**: Admin  
**Goal**: Publish system-wide announcements or notifications to all organizations.  
**Preconditions**: The admin is logged in with the appropriate permissions.  
**Main Success Scenario**:
1. The admin navigates to the announcement section.
2. The admin composes a new announcement with relevant details.
3. The admin selects the distribution method (e.g., in-app notification, email).
4. The admin publishes the announcement.
5. Organizations receive the notification through their selected communication channel.
**Postconditions**: Organizations are informed about system-wide updates or critical information.

### Use Case 4: Organization Subscribes to Relevant Topics
**Actor**: Organization  
**Goal**: Subscribe to topics to receive updates on relevant resources and administrative announcements.  
**Preconditions**: The organization is authenticated and logged in.  
**Main Success Scenario**:
1. The organization logs in to the platform.
2. The organization navigates to available topics or channels.
3. The organization selects relevant topics and subscribes.
4. The system confirms the subscription and updates the organization's profile.
**Postconditions**: The organization is set to receive notifications and updates when new content is published to those topics.

### Use Case 5: Admin Manages User Permissions and Organization Access
**Actor**: Admin  
**Goal**: Adjust user permissions and manage organization access to the platform.  
**Preconditions**: The admin is authenticated with sufficient rights to modify user and organization settings.  
**Main Success Scenario**:
1. The admin accesses the user and organization management section.
2. The admin searches for or selects an organization profile.
3. The admin updates permissions, such as read, write, or publish rights.
4. The system applies the changes and logs the updates.
**Postconditions**: Organization permissions are updated, ensuring secure and proper access to platform functions.
