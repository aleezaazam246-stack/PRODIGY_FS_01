# PRODIGY_FS_01 - Authentication API

A Node.js Express MongoDB Authentication API with JWT tokens and bcrypt password hashing.

## Features

- User Registration with name, email, and password
- User Login returning JWT token
- Protected Profile Route
- Password hashing with bcryptjs
- JWT-based authentication
- Input validation
- Error handling

## Tech Stack

- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - MongoDB ODM
- **bcryptjs** - Password hashing
- **jsonwebtoken** - JWT authentication

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/PRODIGY_FS_01.git
cd PRODIGY_FS_01
```

2. Install dependencies:
```bash
npm install
```

3. Configure environment variables:
   - Copy `.env` file and update values as needed
   - Set your MongoDB connection string
   - Set a secure JWT secret

4. Start MongoDB (if running locally):
```bash
mongod
```

5. Run the server:
```bash
# Production mode
npm start

# Development mode (with nodemon)
npm run dev
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | Server port | 3000 |
| MONGODB_URI | MongoDB connection string | mongodb://localhost:27017/auth-api |
| JWT_SECRET | Secret key for JWT tokens | - |
| JWT_EXPIRES_IN | Token expiration time | 7d |

## API Endpoints

### Base URL
```
http://localhost:3000
```

### 1. Register User

**POST** `/api/auth/register`

Request body:
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "_id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "createdAt": "2026-06-07T00:00:00.000Z",
    "token": "jwt_token_here"
  }
}
```

### 2. Login User

**POST** `/api/auth/login`

Request body:
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "_id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "token": "jwt_token_here"
  }
}
```

### 3. Get Profile (Protected)

**GET** `/api/auth/profile`

Headers:
```
Authorization: Bearer <jwt_token>
```

Response:
```json
{
  "success": true,
  "message": "Profile retrieved successfully",
  "data": {
    "_id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "createdAt": "2026-06-07T00:00:00.000Z",
    "updatedAt": "2026-06-07T00:00:00.000Z"
  }
}
```

## Testing with cURL

### Register
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","password":"password123"}'
```

### Login
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"john@example.com","password":"password123"}'
```

### Get Profile
```bash
curl -X GET http://localhost:3000/api/auth/profile \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

## Project Structure

```
PRODIGY_FS_01/
├── server.js       # Main application file with all routes and logic
├── package.json    # Project dependencies and scripts
├── .env            # Environment variables
└── README.md       # Documentation
```

## Security Features

- Passwords are hashed using bcrypt with salt rounds of 10
- JWT tokens for stateless authentication
- Password field excluded from queries by default
- Input validation on all routes
- Protected routes require valid JWT token

## License

MIT License

## Author

PRODIGY - Prodigy Infotech
