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

```
bash
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

```
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

```
bash
rails assets:precompile
```

4. Migrate the database with
rails db:migrate

Other Recommendations
Use dotenv-rails in development to manage your .env file.

Ensure correct buildpacks are added for Ruby and Node.js.


---

# Rails Application Deployment Guide

## Auth0 Setup

Auth0 setup requires an Auth0 account. This service offers a free tier suitable for development and small applications. Whoever plays the role of admin would be the account holder.

### Getting Started with Auth0

1. Create an Auth0 account at [auth0.com](https://auth0.com/)
2. Follow the interactive Rails tutorial at: [https://auth0.com/docs/quickstart/webapp/rails/interactive](https://auth0.com/docs/quickstart/webapp/rails/interactive)
3. Create a new application in the Auth0 dashboard
4. Configure the following settings:
   - Application type: Regular Web Application
   - Allowed Callback URLs: `https://your-app-name.herokuapp.com/auth/auth0/callback`
   - Allowed Logout URLs: `https://your-app-name.herokuapp.com`
   - Allowed Web Origins: `https://your-app-name.herokuapp.com`
5. Note your Auth0 domain, client ID, and client secret for environment variables

### Rails Integration

1. Add the following gems to your Gemfile:
   ```ruby
   gem 'omniauth-auth0', '~> 3.0'
   gem 'omniauth-rails_csrf_protection', '~> 1.0'
   ```
2. Create initializers and controller files as specified in the Auth0 tutorial
3. Test authentication locally before deploying

## Heroku Setup

Heroku setup requires an account as well as a credit card. This service is not free—it costs about $10 per month, depending on usage.

### Infrastructure Requirements

- One dyno for the Rails application ($7/month for Eco dyno)
- A Postgresql database instance (Hobby tier starts at $5/month)
- Additional add-ons may increase monthly costs

### Getting Started with Heroku

1. Create a Heroku account at [heroku.com](https://heroku.com)
2. Install the Heroku CLI: `brew install heroku` (macOS) or follow [installation instructions](https://devcenter.heroku.com/articles/heroku-cli)
3. Login via CLI: `heroku login`
4. Create a new application: `heroku create your-app-name`
5. Add PostgreSQL: `heroku addons:create heroku-postgresql:hobby-dev`

### Environment Configuration

After creating your Heroku app, you'll need to configure environment variables:

1. Navigate to your app in the Heroku dashboard
2. Go to Settings > Config Vars
3. Add the following required variables:
   - `RAILS_MASTER_KEY`: Your Rails master key
   - `AUTH0_DOMAIN`: Your Auth0 domain
   - `AUTH0_CLIENT_ID`: Your Auth0 client ID
   - `AUTH0_CLIENT_SECRET`: Your Auth0 client secret
   - `AUTH0_CALLBACK_URL`: https://your-app-name.herokuapp.com/auth/auth0/callback
   - Any other environment-specific variables your application needs

## GitHub Actions Setup (Automatic Deployment)

GitHub Actions allows the app to automatically deploy to Heroku when a commit happens on a specified branch.

### Setup Process

1. Create a `.github/workflows` directory in your repository
2. Create a deployment file (e.g., `heroku-deploy.yml`) with the following content:

```yaml
name: Deploy to Heroku

on:
  push:
    branches:
      - main  # Change this to your deployment branch if different

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: akhileshns/heroku-deploy@v3.12.14
        with:
          heroku_api_key: ${{ secrets.HEROKU_API_KEY }}
          heroku_app_name: "your-app-name"  # Replace with your app name
          heroku_email: ${{ secrets.HEROKU_EMAIL }}
```

### Required GitHub Secrets

In your GitHub repository:

1. Go to Settings > Secrets and variables > Actions
2. Add the following repository secrets:
   - `HEROKU_API_KEY`: Your Heroku API key (find in Account Settings)
   - `HEROKU_EMAIL`: Email address associated with your Heroku account

### Testing the Workflow

1. Commit and push the workflow file to your repository
2. Check the "Actions" tab in your GitHub repository to monitor deployment
3. Verify that your application deploys successfully to Heroku

## Troubleshooting

### Common Auth0 Issues
- Callback URL mismatches
- Missing environment variables
- CSRF protection conflicts

### Common Heroku Deployment Issues
- Database migration failures
- Asset compilation errors
- Memory limit exceeded

### Common GitHub Actions Issues
- Missing secrets
- Incorrect branch configuration
- Build failures due to dependencies

## Maintenance Considerations

- Regularly update dependencies to maintain security
- Monitor Heroku usage to control costs
- Consider implementing a staging environment before production deployment
- Set up logging and error tracking services (e.g., Sentry, New Relic)

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
