# Project Archive

These folders contain the previous attempts to build out this project using various tech stacks. Our initial design intended to use a .NET backend and a React frontend. We weren't sure what hosting we were going to use, but it would have been something like AWS. This is the ellevateUI and the ellevateAPI. 

Then we transitioned to nextJS as a full stack solution, hosted on Vercel. We realized after a while working with this framework that serverless architectures mean you can't have long-running processes on the backend. They seem more suited toward apps that serve content (like instagram) rather than apps that do work on the backend asynchronously, such as a pub/sub daemon that distributes messages to mailing lists. The two iterations of this project are found in the esol-resources-platform and esol_fullstack folders. 

We then transitioned to Ruby on Rails, as this provided everything we needed--it is a web framework, extremely capable and mature, supported by all major hosting platforms, and Ruby is an elegent, expressive language. However, our understanding of Ruby and Rails are limited, and this meant our progress and ability to iterate were slowed considerably. Given the enormous number of gems and projects built on Rails, though, it's clear that this is a good path to pursue for future iterations of this project. This repo contains the second iteration of a Ruby on Rails app. The first is the esol-hub-archive folder. 

Below, you will find the original text from the readme of our first repo. 

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
