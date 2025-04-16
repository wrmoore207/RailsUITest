# ESOL Hub

A resource-sharing and community coordination platform built to support English language learners and service providers. ESOL Hub helps organizations post available resources, share events, and engage with users via a clean, modern interface.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
- [Development](#development)
- [Deployment](#deployment)
- [Tech Stack](#tech-stack)
- [Contributing](#contributing)
- [License](#license)

## Overview

**ESOL Hub** is a modern web application designed to streamline communication between organizations and individuals seeking English language support. The platform offers an easy-to-use event calendar, searchable resource listings, and future expansion into forums and file-sharing.

This project is a Capstone project completed by Northeastern Graduate students Cody Snow, Sam Treadwell, and Ryan Moore. The goal of the project was to develop a web app that allows members of Portland, Maine's ESOL collaborative to share information about courses and resources in a centralized location.

Built using Ruby on Rails with Turbo, TailwindCSS, and RailsUI for fast, responsive, and accessible UX.


## Features

- ✅ Auth0-based login system with session handling
- ✅ Responsive TailwindCSS UI via RailsUI (Hound theme)
- ✅ Dynamic calendar with:
  - Hover previews and modal event details
  - Event creation/edit/delete
- ✅ Resource list with:
  - Card-style UI and inline search/filter/sort
  - Turbo modals for create/edit actions
- ✅ Modular modal system shared across the app
- 🔜 Forum integration with commenting and user tagging
- 🔜 File attachments via Shrine
- 🔒 Role-based access control (future)

## Screenshots

_(Add screenshots/gifs here of calendar, resource list, and login UI once ready)_

## Getting Started

### Prerequisites

- Ruby 3.2+
- Rails 8.0.1
- PostgreSQL (production)
- SQLite (development)
- Node.js v23.9.0+
- Yarn (optional, depending on bundling)
- Auth0 account

### Installation

```bash
git clone https://github.com/YOUR_USERNAME/RailsUITest.git
cd RailsUITest

bundle install
yarn install # (optional, if using Yarn)
rails db:setup

# Set up environment variables
cp .env.example .env
# Then fill in AUTH0_DOMAIN, AUTH0_CLIENT_ID, AUTH0_CLIENT_SECRET

## Development

Run the Rails and Tailwind development server:

```bash
bin/dev

This will start:

The Rails server on localhost:3000

esbuild for JavaScript bundling

TailwindCSS with hot reload support

Project uses:

Turbo and Stimulus for interactive UI

RailsUI for consistent, accessible styling

Turbo Frames and Modals for create/edit workflows


---

###  Deployment

ESOL Hub can be deployed using Heroku, Render, Fly.io, or any standard Rails-capable environment.

### Heroku Deployment Notes

1. Use a PostgreSQL database in production.
2. Add your environment variables to the Heroku config:
   - `AUTH0_DOMAIN`
   - `AUTH0_CLIENT_ID`
   - `AUTH0_CLIENT_SECRET`
3. Precompile assets with:

```bash
rails assets:precompile

4. Migrate the database with
rails db:migrate

Other Recommendations
Use dotenv-rails in development to manage your .env file.

Ensure correct buildpacks are added for Ruby and Node.js.


---

### Tech Stack


| Layer         | Technology                            |
|---------------|----------------------------------------|
| **Frontend**  | TailwindCSS, RailsUI (Hound Theme), Turbo, Stimulus |
| **Bundler**   | esbuild (Node v23.9.0)                |
| **Backend**   | Ruby on Rails 8.0.1                   |
| **Database**  | SQLite (development), PostgreSQL (production) |
| **Authentication** | Auth0 via OmniAuth              |
| **Environment** | dotenv-rails for managing `.env`   |
| **Deployment** | Heroku                              |
