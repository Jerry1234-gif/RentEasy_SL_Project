# Data Dictionary — RentEasy SL MVP

| Table | Field | Type | Key / Rule | Description |
|---|---|---|---|---|
| users | id | BIGINT | PK | User identifier |
| users | name | VARCHAR(120) | Required | Display name |
| users | email | VARCHAR(190) | Unique | Login email |
| users | phone | VARCHAR(30) | Nullable | Optional phone |
| users | password_hash | VARCHAR(255) | Required | Password hash |
| users | role | ENUM | tenant/landlord/agent/admin | Access role |
| users | status | ENUM | active/suspended/disabled | Account status |
| properties | id | BIGINT | PK | Listing identifier |
| properties | owner_id | BIGINT | FK users.id | Listing owner |
| properties | agent_id | BIGINT | FK users.id nullable | Assigned agent, reserved for extension |
| properties | title | VARCHAR(150) | Required | Listing title |
| properties | description | TEXT | Required | Property description |
| properties | property_type | ENUM | Required | apartment/house/room/commercial |
| properties | city/district/area | VARCHAR | Required/nullable | Public location fields |
| properties | rent_amount | DECIMAL(12,2) | Positive | Advertised rent |
| properties | currency | CHAR(3) | SLE/USD | Currency code |
| properties | rent_period | ENUM | week/month/year | Rent interval |
| properties | status | ENUM | Workflow status | Moderation/availability state |
| properties | reviewed_by | BIGINT | FK users.id nullable | Admin reviewer |
| property_images | id | BIGINT | PK | Image identifier |
| property_images | property_id | BIGINT | FK properties.id | Parent listing |
| property_images | file_name | VARCHAR(255) | Required | Randomised stored filename |
| property_images | alt_text | VARCHAR(180) | Nullable | Accessible description |
| saved_properties | tenant_id | BIGINT | FK users.id | Tenant |
| saved_properties | property_id | BIGINT | FK properties.id | Saved listing; unique with tenant |
| viewing_requests | id | BIGINT | PK | Viewing request identifier |
| viewing_requests | property_id/tenant_id | BIGINT | FKs | Listing and requester |
| viewing_requests | requested_at | DATETIME | Required | Proposed viewing time |
| viewing_requests | status | ENUM | Workflow state | Request status |
| rental_applications | id | BIGINT | PK | Application identifier |
| rental_applications | property_id/tenant_id | BIGINT | FKs | Listing and applicant |
| rental_applications | message | TEXT | Required | Applicant introduction |
| rental_applications | status | ENUM | Workflow state | Application status |
| maintenance_requests | id | BIGINT | PK | Maintenance request identifier |
| maintenance_requests | property_id/tenant_id | BIGINT | FKs | Listing and requester |
| maintenance_requests | category | ENUM | Required | Issue category |
| maintenance_requests | urgency/status | ENUM | Required | Priority and workflow status |
| audit_logs | id | BIGINT | PK | Audit record identifier |
| audit_logs | actor_id | BIGINT | FK users.id nullable | User who performed action |
| audit_logs | action | VARCHAR(100) | Required | Action label |
| audit_logs | subject_type/subject_id | VARCHAR/BIGINT | Nullable | Related record |
| audit_logs | details | JSON | Nullable | Non-sensitive event metadata |

All monetary amounts are decimal values, not floating-point database fields. Dates/times use the database server timezone; deployment must configure a consistent timezone and display it clearly. This dictionary describes the included MVP schema; optional modules are not represented as completed functionality.
