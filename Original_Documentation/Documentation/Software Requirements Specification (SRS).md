# Software Requirement Specification (SRS) || ESOL Resource Platform
**Authors:** Cody Snow, Ryan Moore, Sam Treadwell

### Version Number and Revision History

| Version | Date	     | Author	      | Description |
| ------- | ---------- | ------------- | ----------- |
| 0.1     | 2024-9-20  | Cody Snow     | Initial draft                                                        | 
| 1.1     | 2024-9-25  | Ryan Moore    | Updated sections: Introduction, Overall Description, System Features |
| 2.1     | 2024-9-28  | Sam Treadwell | Updated sections: Purpose, Conventions                               |
| 3.1     | 2024-10-09 | Sam Treadwell | Nonfunctional Requirements                                           |
| 4.1     | 2024-11-12 | Sam Treadwell | Updated Sections: Purpose, Scope, Constraints, Operating Environment |
| 5.1     | 2024-11-20 | Sam Treadwell | Migrated content from sections per Google Docs file                  |

### Tech Stack
| Category                   | Tech / Tools                      |
| -------------------------- | --------------------------------- |
| **Pub/Sub Infrastructure**: | RabbitMQ                         |
| **Programming Languages**: | JavaScript, TypeScript, C#       |
| **Database**: | PostgreSQL                                     |
| **Frameworks**: | ASP.NET for APIs, ReactJS, NextJS (Next UI) |

### Conventions
| Name                                                                   | Abbreviation   | 
| ---------------------------------------------------------------------- | -------------- | 
| Proof of Concept / Prototype                                           | (POC)          |
| Office of Economic Opportunity                                         | (OEO)          | 
| English as a Second Language / English for Speakers of Other Languages | (ESL) / (ESOL) | 
| Publish / Subscription architecture                                    | (pub/sub)      |

### Section Contents:
1. Introduction
    - 1.1 Purpose
    - 1.2 Scope
    - 1.3 Client and Stakeholders
    - 1.4 Intended Audience
2. Overall Description
   - 2.1 Product Description
   - 2.2 Product Perspective
   - 2.3 Constraints and Operating Environment
3. System Features
   - 3.1 Core Functionalities
4. Nonfunctional Requirements
   - 4.1 Performance
   - 4.2 Security
5. Conclusion

### 1. Introduction
The ESOL Resource Platform is designed to facilitate communication and resource sharing between ESOL course providers and community partners. Utilizing a publish-subscribe (pub/sub) architecture, this web-based platform supports decentralized communication, enabling efficient matching of organizational resources with community needs. 

#### 1.1 Purpose
The purpose of our project is to develop a full-stack web application designed to help connect and relay relevant information about ESOL curriculum, resources, and scheduling between administrators and affiliates of organizations teaching ESOL. Our application will serve as a B2B communication channel between associated organizations and the administration at The City of Portland’s Office of Economic Opportunity (OEO). 

#### 1.2 Scope
The scope of this project is to build a responsive web application that administrators and partnered organization affiliates can use to communicate pertinent information about ESOL teaching initiatives.

Our application’s scope is comprised of three main components:
1. Pub/Sub posting 
2. Calendar view for a comprehensive view of offerings and schedules
3. Resource list to catalog needed resources

#### Initial Phase:
The initial phase of development will lay the foundation for all future development. As such, the first iteration will be focused on the core functionality of the application. Based on client input, those objects are:

1. Pub/Sub Model
    - To facilitate posting and populate content in the user's feed based on subscriptions.
    
2. Calendar View
    - To easily view when courses are available and access course schedules for all participating organizations.
        
3. Resource List
    - To facilitate information sharing an internal resource list will allow organizations to add requested resources.

#### *In Scope*

- Administrators (OEO/ESOL collaborative)
- Organizations (Affiliated organizations, ex: Root Cellar)

#### *Not in Scope*

- Learners (Students enrolling in ESOL curriculum)
- Dashboard View (stretch goal, *see Designs/UI Design Mockups.md*)

*Functionality by user persona:*

**Administrators** - Our primary client is Melissa Hue and the leadership of the ESOL collaborative who need global access to information about users and organizations. 
- Admins can manage organization information and permissions.
- Admins can subscribe to channels.
- Admins can add resources to the Resource List.
- Admins can access data views in the dashboard view (TBD)
  
**Organizations** - The individual affiliates of organizations offering ESOL classes to the greater Portland community. 
- Orgs can view, edit, and create new course listings
    - Courses have attributes, such as capacity, start and end times, course type, course location (in person or online) 
- Orgs can publish course information to Calendar View
- Orgs can publish resources to the Resource List 
- Orgs can subscribe to other organizations
- Orgs can publish contact information in the dashboard view (TBD)

**Learners (not in scope)** - (Students enrolling in ESOL curriculum)
*The system will support the addition of these users, however, this is <u>out of scope</u> in our deliverable prototype.*

#### 1.3 Client and Stakeholders
**Melissa Hue:** Director, City of Portland – Office of Economic Opportunity

**ESOL Organizations**
- Greater Portland Immigrant Welcome Center
- Salvation Army
- Root Cellar
- In Her Presence
- Hope Acts

#### 1.4 Intended Audience 
Our intended audience includes our primary stakeholders, *The City of Portland Office of Economic Opportunity*, internal administrative users and providers who set up the class schedule and manage occupancy, and in time end users representing new immigrants to Maine who are interested in signing up for ESOL classes.

### 2. Overall Description
#### 2.1 Product Description
This software is intended to make scheduling and managing reservations for in-person ESOL classes easier, more accessible, and streamlined. By coordinating resources into one piece of software, organizations will be better equipped to help the communities they serve.  

#### 2.2 Product Perspective

- **Administrators** - Admins can manage user access including adding organizations to the program, removing organizations, and updating their information when necessary. Admins will have access to view how many learners are registered for classes, and how many are waitlisted.

- **Organizations** – Orgs can post, edit, and remove classes, view how many people are registered for classes (and waitlisted), and post their organizational information (phone number, address, etc.)

- **Learners (out of scope)** - Learners can browse and register for classes offered by all organizations in the system. Learners create a user profile that is authenticated and secure. Learners can add, edit, and remove their profiles. Information collected will include name, age, languages spoken, and proficiency.

#### 2.3 Constraints and Operating Environment
One of our biggest challenges is that since our application is designed to serve prospective ESL / ESOL students this comes with an implied language barrier. We intend to work around this by using auto-translation tools such as Google Translate for the web. Additionally, a foreseeable constraint and operating environment challenge is managing data, protecting data integrity, and security. We can infer that some users might have obstacles to accessing the system so we want to ensure that it is widely available, accessible, and easy to use. One consideration we are investigating is accessing the system with a user's Google Account.

### 3. System Features
#### 3.1 Core Functionalities
- **Publishing and Subscription**: Enables ESOL providers and students to post and receive resource updates.
- **Communication Channels**: Supports email, SMS, and app notifications.
- **Role-Based Access**: Ensures secure and controlled access to platform features.

#### Exclusions
- **Class Scheduling**
- **Data Reporting and Analytics**
- **Notification System**
- **Student UI**
- **Student Records**

### 4. Nonfunctional Requirements
- **Performance**: Handles a large number of users and messages efficiently.
- **Security**: Implements secure authentication, data encryption, and role-based access control.
- **Scalability**: Designed for growth with minimal infrastructure changes.
- **Maintainability**: Modular architecture for easy updates.

#### 4.1 Performance
We aim to ensure efficient runtime and maximize the operational potential of our web application. This can be achieved by optimizing various sub-processes:

***- Server-Side Factors -***

**Optimization**
*Strategies may include:*
    - Optimized database queries–including indexing, caching, and load balancing to distribute traffic will ensure efficient backend code execution.
    - Using a caching strategy like Redis, Memcached, or browser caching will help store data temporarily and minimize server work.
    - Additionally, breaking the application into smaller, more manageable services (microservices) will distribute loads and improve modularity.

**Scalability**
As our application scales, our servers will need to handle the increased load without performance degradation.

*Strategies may include:*
    - Implementing horizontal scaling by adding more servers.
    - Vertical scaling (improving server resources) to manage the load. 
    - Using cloud infrastructure for on-demand scaling would allow for seamless expansion.

**Caching:** Servers can cache frequently requested data, (for example, API responses, and HTML pages), to reduce the need to regenerate them with each request.

**Microservices Architecture:** A monolithic application may struggle with scaling and performance. Adopting a microservices architecture can help with modularity and load distribution.

***- Frontend Factors -***

**Resource Optimization:** Large images, excessive JavaScript, and unoptimized CSS can bloat a web page, increasing load times and impacting the user experience. We will strive to mitigate this overhead. 

*Solutions include:*
    - Compressing images (using tools like WebP, JPEG, or PNG), minifying CSS/JavaScript, and lazy loading non-essential resources.
    - Using proper cache-control headers and expiration policies to enable effective browser caching.

**Client-Side Caching:** Browsers can cache files like CSS, JavaScript, and images, reducing the need to download them with each page request.

**Content Delivery Networks (CDNs):** Serving assets (like images, CSS, JS) from a centralized server can lead to higher latency, especially for distant users. To bypass this, we can use a CDN like Cloudflare, Akamai, or AWS CloudFront to cache and serve static resources from geographically closer servers.

***- Network and Latency Factors -***

**Optimization of Latency:** Implementing CDNs, using distributed data centers, and optimizing APIs to minimize data transfer can significantly reduce runtime and improve responsiveness.

**Optimization of Bandwidth and Connection:** To avoid limited bandwidth and slow network connections (which cause resource loading to be delayed) we can enable gzip or Brotli. 
    - This helps with compression for transferring files over the network and minimizes the amount of data transferred through efficient data formats (JSON over XML, binary protocols).

***- Database Optimization -***

**Query Performance:** Slow or unoptimized database queries can bottleneck the server-side performance. By using indexing, partitioning, and query optimization techniques we can improve database performance. 
    - Implementing database replication will distribute the load and reduce query times.

**Connection Pooling:** Creating new database connections for every request can slow down the application. Using connection pooling will help reuse database connections, and minimize the overhead of establishing new connections.

***- Application Code Efficiency -***

**Efficient Algorithms and Data Structures:** Poorly written algorithms can increase processing time and resource consumption. By using appropriate algorithms and data structures we will minimize time complexity. 	
    - For example, using hash tables for quick lookups is more efficient than iterating through lists.

***- Concurrency and Load Handling -***

**Handling Concurrent Requests:** An application must handle multiple users simultaneously without bottlenecks. By using multi-threading, asynchronous programming, and event-driven architecture (e.g., Node.js) we can handle concurrent requests effectively.
    - Load Balancing: When traffic is high, load balancing ensures no single server gets overwhelmed. 
    - By implementing load balancers (like Nginx, AWS ELB) to distribute traffic we will spread the load across multiple servers for improved performance and redundancy.

***- Monitoring and Real-Time Analytics -***

**Monitoring Tools:** Without proper monitoring, performance bottlenecks may go undetected. Tools like New Relic, Datadog, or Google Lighthouse help monitor and measure application performance. 
    - Using A/B testing and performance tracking helps to pinpoint inefficient components that increase latency.

***- Improving User-Perceived Performance -***

**Lazy Loading:** Lazy loading works by loading content as it becomes visible to the user. By doing this for assets such as images and videos load time will be reduced without affecting the user experience.

**Preloading and Prefetching:** By loading assets before they are needed or during idle time via preloading or prefetching critical assets can be loaded.
    - This works by loading fonts, styles, or scripts before they are requested. Thus, overhead will be reduced.

**Asynchronous Requests:** Reducing the impact of slow server-side processes on the user experience can be achieved by implementing asynchronous requests. 
    - Tools like AJAX or Fetch API allow parts of the page to load independently from server processing.

#### 4.2 Security
The security of our application is of utmost importance. We must protect users' privacy and maintain a strong and resilient software system. We will operate efficiently while keeping our user’s sensitive data safe. Leveraging best practices and techniques like ensuring HTTPS protocol (at a minimum), increased encryption/decryption through optimized SSL certificates, and enabling HTTP/2 or HTTP/3, in addition to configuring SSL/TLS handshakes we will optimize the security of our application.
    - Configuring SSL/TLS handshakes by executing Keep-Alive (persistent connection) keeps the TCP connection open and reduces the frequency of roundtrips between the client and server.

**Security and SSL Overhead**
**Encryption and Decryption:** While HTTPS provides essential security, it can introduce additional overhead due to encryption and decryption processes. Strategies like optimized SSL certificates and enabling HTTP/2 or HTTP/3 can help mitigate this.

### Constraints and Limitations
- **Scheduling Features**: Not supported.
- **Cross-Platform Integration**: Not included in the initial phase.

### Client and Stakeholders
- **Primary Client**: Melissa Hue, Director at the Office of Economic Opportunity, City of Portland.
- **Stakeholders**: Participating ESOL organizations (e.g., Salvation Army of Portland, Greater Portland Immigrant Welcome Center).

### Assumptions and Dependencies
- This is a prototype
- Dependence on the selected pub/sub infrastructure (RabbitMQ).
- Ongoing collaboration with ESOL organizations for effective feature development.
  
### Future Considerations
**Notification System**
One feature discussed is the ability to note when a class is full to prevent community partners and organizations from referring students to those resources.
    - An expansion on this feature is the ability to integrate some kind of waitlist or notification of when a resource will become available again.
    
**Referral Forms**
When referring students to an organization or resource, it would be helpful to use that opportunity to collect their contact and demographic information. This would allow organizations to understand better who is utilizing their resources, giving them a finer tool to focus their efforts. It also opens the door to student records and UIs.

**Enhanced User Experience**
Continue to develop and refine the user interfaces to improve user experience and increase the adoption rate.

**Connect More Resources**
Adapt this model to help other community organizations that are working towards a common goal.

### 5. Conclusion
The goal of this project is to create a tool that will allow ESOL organizations and community partners to collaborate, share information, and work together toward their common goals. 
