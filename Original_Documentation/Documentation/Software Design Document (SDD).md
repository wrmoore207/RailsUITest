# Software Design Document (SDD) || ESOL Resource Platform

### **1. Introduction**

This document outlines the software design description for our ESOL Resource Platform application, a publish-subscribe (pub/sub) system that connects ESOL resource providers with program administrators, other providers, and prospective students. This document will cover the system architecture, data design, user interface, and implementation details.


### **2. System Overview**

The ESOL Resource Platform facilitates communication and resource sharing between ESOL course providers, administrators, and students.  It leverages a decentralized architecture where providers publish information about their courses and students publish their learning needs. The platform enables targeted matching and flexible communication through various channels.


### **3. Design Considerations**

* **Scalability:** Given the decentralized nature of pub/sub, the platform should be able to handle a growing number of users and messages and scale with minimal effort. 
* **Flexibility:**  Accommodate various resource types and user preferences.
* **Security:**  Ensure secure communication and protect user data.
* **Maintainability:** Design modular components for easy updates and maintenance.
* **Usability:** Provide elegant and intuitive user-interface views for both admins and resource providers.


### **4. Architectural Strategies**

* **Smart Clients, Dumb Pipes:** Decompose the platform into independent, loosely coupled services for scalability and maintainability, using the power of pub/sub to coordinate those services and clients on the backend. 
* **Asynchronous Communication:**  Utilize message queues (RabbitMQ + pub/pub) for reliable and scalable message delivery from POST Message API to destination queues in the database (forwarded to clients). 


### **5. System Architecture**

The following key components will comprise the system:

* **Message Service:**  Handles incoming POST requests and routes them to the appropriate sub queues. GET requests are routed accordingly. 
* **User Service:** Manages user authentication, profiles, and permissions.
* **Database:** PostgreSQL database stores user data, resource information, and other relevant data.

### **System Architecture Diagram**
<img src="https://github.com/user-attachments/assets/63281a10-ecfd-4755-abb7-4750be3cea37" alt="System Architecture Diagram" width="800" />


### **6. Data Design**

The following data entities will be modeled:

* **User:**  Stores information about providers, provider organizations, and administrators (name, contact details, associations, preferences).
* **Resource:**  Stores details about ESOL courses and resources (availability, curriculum, contact information).
* **Subscription:**  Tracks user subscriptions to channels and topics.
* **Notification:**  Stores notification history and delivery status.


### **7. User Interface Design**

* **Organization Interface:**  Allows organizations of ESOL providers to coordinate with admins, manage subscriptions, and communicate with other providers.
* **Provider Interface:**  Allows providers to publish resources, view student needs, and manage communication.
* **Admin Interface:**  Displays tools for managing users, topics, and system settings.


### **8. Implementation Details**

* **Programming Languages:**  C#, JavaScript / TypeScript
* **Frontend Technology** ReactJS with Vite / NextJS with TypeScript
* **Frameworks:**  ASP.NET (for API development)
* **Database:**  PostgreSQL
* **Message Routing:**  RabbitMQ for pub/sub 
* **CI/CD and Hosting:**  GitHub Actions, Azure DevOps


### **9. Security Considerations**

* **Authentication:**  Implement secure user authentication using JWT (JSON Web Tokens).
* **Authorization:**  Enforce role-based access control to restrict sensitive data and functionality access.
* **Data Encryption:**  Encrypt sensitive data at rest and in transit using https.


### **10. Testing and Deployment**

* **Unit Tests:**  Develop unit tests for individual components and services.
* **Integration Tests:**  Test interactions between different services.
* **End-to-End Tests:**  Test the entire platform from the user's perspective.
* **Continuous Integration/Continuous Deployment (CI/CD):**  Automate the build, testing, and deployment process. Hosted on Azure, with separate configurations for each environment.


### **12. Document History**

| Version	 | Date	      | Author	   | Description |
| -------- | ---------- | ---------- | ----------- |
| 1.0      | 2024-10-1  | Cody Snow  | Initial draft of the Software Design Document | 
| 1.1      | 2024-11-10 | Cody Snow  | Updated architecture to reflect ASP.NET and React with Vite |


This SDD provides a high-level overview of the ESOL Resource Platform design.  Further details will be elaborated in subsequent documentation and implementation phases. See Document History for the changelog.
