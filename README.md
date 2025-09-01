<link href="style.css" rel="stylesheet"></link>
<h1 class="text-center" style="text-align: center">Aspira</h1>

<p class="text-center" style="text-align: center">
    <a href="https://github.com/Voidware-Prohibited/targetvector-api-fullstack/commits/master" class="no-decoration" style="text-decoration: none">
    <img src="https://vercelbadge.vercel.app/api/Voidware-Prohibited/targetvector-api-fullstack?plastic"
         alt="Build Status">
    </a>
    <a href="https://github.com/Voidware-Prohibited/targetvector-api-fullstack/commits/master" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/github/last-commit/Voidware-Prohibited/targetvector-api-fullstack.svg?style=flat-square&logo=github&logoColor=white"
         alt="GitHub last commit">
    </a>
    <a href="https://github.com/Voidware-Prohibited/targetvector-api-fullstack/issues" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/github/issues-raw/Voidware-Prohibited/targetvector-api-fullstack.svg?style=flat-square&logo=github&logoColor=white"
         alt="GitHub issues">
    </a>
    <a href="https://github.com/Voidware-Prohibited/targetvector-api-fullstack/pulls" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/github/issues-pr-raw/Voidware-Prohibited/targetvector-api-fullstack.svg?style=flat-square&logo=github&logoColor=white"
         alt="GitHub pull requests">
    </a>
    <a href="https://github.com/Voidware-Prohibited/targetvector-api-fullstack/blob/master/LICENSE" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg"
         alt="MIT License">
    </a>
</p>
<p class="text-center" style="text-align: center">
    <a href="https://github.com/sponsors/colorindarkness" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/github/sponsors/colorindarkness.svg?style=flat-square&logo=github&logoColor=white"
         alt="Become a Sponsor">
    </a>
    <a href="https://www.patreon.com/colorindarkness" class="no-decoration" style="text-decoration: none">
    <img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fshieldsio-patreon.vercel.app%2Fapi%3Fusername%3Dcolorindarkness%26type%3Dpatrons&style=flat"
         alt="Become a Patron">
    </a>
    <a href="https://www.x.com/voidwarex" class="no-decoration" style="text-decoration: none">
    <img alt="X (formerly Twitter) Follow" src="https://img.shields.io/twitter/follow/voidwarex?style=flat&logo=x">
     </a>
</p>

Anima + Aura. A Fullstack API with Management Dashboard focused on Performance, Scalability and Modularity.

## ✨ Features

- **Docker** -  Lightweight and Ready to deploy.
- **TypeScript** - Full type safety and better developer experience
- **pnpm** - Performant package management focused on minimal package size and resources
- **Node** -  a cross-platform, open-source JavaScript runtime environment.
- **Passport.js** - flexible and modular authentication middleware.
- **ESLint, Prettier, Husky and Lint-Staged** - Automated Code Quality and Beautification.

## 🔀 Versions
Two implementation branches

**Archon** - Dedicated Server API and Management Framework

**Aevus** - Master Server API and Management Framework

```
aspira
├──-archon
    ├──archon-edge
├──-aevus
    ├──aevus-edge
```

### 📚 Frontend

- **React 19** - Latest React version with modern features.
- **React Router v7** - File-based routing with nested layouts
- **TypeScript** - Full type safety and better developer experience
- **TanStack Query** - Powerful data fetching and state management
- **shadcn/ui** - Beautiful and accessible UI components
- **Tailwind CSS v4** - Modern utility-first CSS framework
- **OAuth2** - Service-based Authentication Strategies.
- **il8n** - a powerful internationalization framework
- **Vite** - Fast build tool and development server.
- **Vitest** - Next generation testing framework powered by Vite.

### 📚 Backend

- **Express.js** - a minimal and flexible Node.js web application framework.
- **MikroORM/Postgres** - TypeScript ORM for Node.js.
- **Axios** - Promise based HTTP client for the browser and node.js.
- **HMAC** - Cryptographically secured API transactions.
- **Vitest** - Next generation testing framework powered by Vite.

## 🚀 Quick Start

1. **Connect to Database**

**Create '.env' file**

In the root of the project, create a file named .env and define the necessary environment variables for your database connection. For example:
```
DB_DRIVER=postgresql
DB_HOST=localhost
DB_PORT=5432
DB_USER=your_user
DB_PASSWORD=your_password
DB_NAME=your_database_name
```

2. **Setup OAuth**

**Install API Secrets**

**Start Backend**
```bash
   cd server
   pnpm run dev
   ```

**Start Frontend**
```bash
   cd client
   pnpm run dev
   ```
**Setup Endpoints**

**Open your browser**
   ```
   http://localhost:5173
   ```

## 📁 Project Structure

```
Dockerfile
setup.sh
setup.bat
client/
├──src/
    ├── components/         # Reusable UI components
    │   ├── app-sidebar/    # Sidebar navigation components
    │   └── ui/             # shadcn/ui components
    ├── hooks/              # Custom React hooks
    ├── lib/                # Utility functions and configs
    ├── routes/             # Route components and layouts
    └── styles/             # Global styles and CSS
server/
├──src/
    ├── routes/             # API Routes

```

## 🔧 Available Scripts

- `pnpm run dev` - Start development server
- `pnpm run build` - Build for production
- `pnpm run preview` - Preview production build
- `pnpm run lint` - Run ESLint

## 🎨 Customization


## 📄 License

This project is open source and available under the [MIT License](LICENSE).
