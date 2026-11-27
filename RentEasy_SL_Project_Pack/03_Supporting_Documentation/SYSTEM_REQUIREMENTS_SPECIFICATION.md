# System Requirements Specification (SRS)

## 1. Purpose
Define the functional and non-functional requirements for the RentEasy SL academic MVP.

## 2. User classes
- Visitor: browses published property listings.
- Tenant: manages favourites, viewing requests, rental applications and maintenance requests.
- Landlord: submits and manages owned listings and responds to enquiries.
- Agent: manages property activity after the landlord assigns the agent's registered email to a listing.
- Administrator: reviews listings and monitors platform activity.

## 3. Functional requirements
FR-01 The system shall allow visitors to browse published properties.
FR-02 The system shall filter listings by city, district, property type and maximum rent.
FR-03 The system shall allow tenants and landlords to register with unique email addresses.
FR-04 The system shall authenticate users using hashed passwords.
FR-05 The system shall enforce role-based access to protected actions.
FR-06 The system shall allow landlords to submit property details and supported images.
FR-07 New property submissions shall enter pending_review status.
FR-08 Administrators shall publish, reject or request changes to pending listings.
FR-09 The system shall show property details only for published listings to public visitors.
FR-10 Tenants shall save and remove favourite properties.
FR-11 Tenants shall submit viewing requests for published properties.
FR-12 Property managers shall accept or decline viewing requests.
FR-13 Tenants shall submit rental applications for published properties.
FR-14 Property managers shall mark applications under review, approved or declined.
FR-15 Tenants shall submit maintenance requests against a property record.
FR-16 Authorised property managers shall update maintenance request status.
FR-17 The system shall record selected security-relevant actions in an audit log.
FR-18 The system shall display role-appropriate dashboard information.
FR-19 Landlords shall assign or remove an active agent on their own property listings by registered agent email.

## 4. Non-functional requirements
NFR-01 Security: use password_hash/password_verify, prepared statements, CSRF protection, output escaping and role checks.
NFR-02 Privacy: do not expose private phone numbers, exact access details, identity documents or tenant application data publicly.
NFR-03 Usability: responsive layout and clear labels, validation messages and status indicators.
NFR-04 Performance: common listing pages should avoid unbounded result sets; pagination is recommended before larger deployment.
NFR-05 Reliability: database constraints and server-side validation shall protect core records.
NFR-06 Maintainability: separate configuration, database schema, application bootstrap, public entry point, assets and documentation.
NFR-07 Compatibility: support modern browsers and PHP 8+ with PDO MySQL and Fileinfo extensions.
NFR-08 Accessibility: semantic headings, labelled form fields, keyboard-operable controls and descriptive image text should be maintained.
NFR-09 Auditability: key administrative and workflow actions should be logged.
NFR-10 Data integrity: foreign keys and unique constraints shall prevent orphaned and duplicate saved-property records.

## 5. Business rules
BR-01 Only active users may sign in.
BR-02 Public visitors may view published listings only.
BR-03 Landlords submit listings; new and materially edited listings require review before publication.
BR-04 Only administrators may change listing moderation status.
BR-05 Tenants alone may create favourites, viewing requests and rental applications.
BR-06 Only the owner/authorised manager or administrator may decide requests for a property.
BR-07 Listing moderation is not proof of legal ownership, title, structural safety or regulatory compliance.
BR-08 The MVP records rental interest and maintenance requests; it does not process rental payments or execute tenancy contracts.
BR-09 Only landlords may assign an active agent account to a property they own.

## 6. Data requirements
Users, properties, property_images, saved_properties, viewing_requests, rental_applications, maintenance_requests and audit_logs. The relational schema is supplied in `../database/schema.sql` and the data dictionary in `DATA_DICTIONARY.md`.

## 7. Acceptance criteria
Refer to `TEST_PLAN_AND_EVIDENCE.md`. Tests must be executed on the target XAMPP/MySQL setup and results entered honestly.
