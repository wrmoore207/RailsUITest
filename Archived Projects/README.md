# ESOL Resource Platform - Code Repository

This repository contains the code for an ESOL resource platform built on a Pub/Sub architecture, leveraging (TBD: AWS or Google Cloud) Pub/Sub for messaging. This platform aims to connect ESOL students with relevant resources and providers in a decentralized, scalable, and flexible manner.

## Repo Folder Structure

- **Designs**
  - Screenshot of Neon database, Sequence diagrams, class diagrams, and UI design mockups

- **Documentation**
  - Software Requirements Specification (SRS), Software Design Document (SDD), and other documentation for the Capstone course

- **app**
  - Folder contains all source code for the APIs and the UI.
  - ellevateAPI is the C# API POC (currently only APIs connecting to Neon PostGreSQL cloud instance)
  - ellevateUI is the React front end tester
  - esol-resources-platform is the Next JS frontend with calendar and messaging modules
  - esol_fullstack is the POC for Next JS fullstack (currently only APIs connecting to Neon PostGreSQL cloud instance). This will be merged with esol-resources-platform and other solutions will be removed next semester.


## How to run the app

The app is set up as two separate solutions - one for the APIs and one for the UI.

- After cloning the repository locally, open each solution in an IDE (recommended: JetBrains Rider for APIs and JetBrains WebStorm for UI).
- Run the API solution first. The browser should open to the OpenAPI/swagger page that shows the API contracts. This page is useful for testing the APIs and learning how to call them.
- Then run the UI solution. This will launch the React app in the browser. Currently, there are a couple of example components on the main page. The Messages component allows the user to POST and GET messages.


## License

This project is licensed under the MIT License. See the LICENSE file for details.
