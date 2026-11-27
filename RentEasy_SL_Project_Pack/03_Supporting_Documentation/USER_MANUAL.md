# RentEasy SL — User and Installation Manual

## A. Installation (XAMPP)
1. Install XAMPP with Apache, PHP 8+ and MySQL/MariaDB.
2. Copy the extracted `RentEasy_SL_Complete_Submission` folder into `C:\xampp\htdocs\renteasy` (or another folder name).
3. Start Apache and MySQL.
4. Visit phpMyAdmin and import `database/schema.sql`.
5. Visit `/renteasy/database/seed_demo.php` once to create fictional demonstration accounts and a sample listing.
6. Visit `/renteasy/public/` to open the application.
7. If your folder name or database credentials differ, update `config/config.php`.
8. Remove or restrict `database/seed_demo.php` after initial setup.

## B. Demo login accounts
All demo accounts use `ChangeMe123!`:
- admin@renteasy.test
- landlord@renteasy.test
- tenant@renteasy.test
- agent@renteasy.test

Change demo passwords immediately. These accounts are not for public hosting.

## C. Tenant tasks
1. Create a tenant account or sign in.
2. Use Find property and the filters to search published listings.
3. Open a listing to review description, public location, rent and property details.
4. Save/remove a favourite.
5. Submit a viewing request with a future date and time.
6. Submit a rental application with a short introduction.
7. View request statuses on the dashboard.
8. Use maintenance request form only for demonstration; real tenancy eligibility is not contract-verified in this MVP.

## D. Landlord tasks
1. Register as a landlord.
2. Select Add property.
3. Complete required fields and optionally upload JPG/PNG/WEBP images (maximum 4 MB each).
4. Submit for review. The listing remains pending until an administrator publishes it.
5. Review applications and viewing requests in the dashboard and make decisions.

## E. Administrator tasks
1. Sign in with the admin demo account.
2. Open Admin review.
3. Review listing details and use Publish, Request changes or Reject.
4. Record a meaningful review note.
5. Remember that this is content moderation only, not legal title or safety certification.

## F. Troubleshooting
- Database connection error: check MySQL is running and credentials/database name in config/config.php.
- 404: confirm project folder and URL; open `/public/`.
- Image not visible: check `uploads/properties` write permission and file type.
- Login fails: confirm account seeded and use exact demo email/password.
- CSRF/session error: refresh page and sign in again.

## G. Maintenance and security
Back up MySQL and uploads; update PHP and server packages; review admin accounts; remove demo seeder; use HTTPS; use environment variables for credentials; restrict uploads and logs; define data retention and privacy procedures before real use.
