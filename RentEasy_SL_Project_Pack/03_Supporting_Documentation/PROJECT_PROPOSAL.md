# Project Proposal — RentEasy SL

## 1. Proposed title
Design and Implementation of a Web-Based Property Rental and Management System in Sierra Leone.

## 2. Background and rationale
RentEasy SL is proposed as a central web platform through which prospective tenants can discover property listings and landlords or authorised agents can organise listing information and respond to enquiries. Rental searches and property administration may involve dispersed advertisements, repeated calls and informal record keeping. The extent and specific effects of these issues in the selected study setting must be established through interviews and observation; this proposal does not present unverified claims as research findings.

## 3. Problem statement (provisional)
Prospective tenants and property providers may face fragmented property information and communication. Tenants may find it difficult to compare listing details and organise viewings, while landlords may find it difficult to keep listing and enquiry records in one place. The project will investigate these possible challenges and assess whether a role-based web platform can improve the organisation and accessibility of rental information.

## 4. Aim
To design, develop and evaluate a web-based property rental and management system that supports property discovery, listing moderation, viewing requests, rental applications and basic maintenance request tracking.

## 5. Specific objectives
1. Investigate the current rental-search and property-management practices of selected stakeholders.
2. Identify and document functional and non-functional requirements.
3. Design the system architecture, user interfaces, use cases, data flows and relational database.
4. Implement role-based authentication and property listing workflows.
5. Implement tenant search, favourites, viewing requests and rental applications.
6. Implement landlord/agent management and administrator listing moderation.
7. Implement basic maintenance request tracking and audit logging.
8. Test core workflows against documented acceptance criteria.
9. Prepare installation instructions, user guidance and technical documentation.

## 6. Scope
Included: public property search; tenant and landlord registration; agent/admin demo roles; property submission; image upload; admin moderation; favourites; viewing requests; rental applications; basic maintenance requests; dashboards; audit logs; reports limited to dashboard counts.

Excluded from MVP: online payments, escrow, legal title verification, identity verification, binding electronic tenancy agreements, automated valuation, SMS/WhatsApp integration, native mobile app, advanced maps, subscriptions and AI fraud scoring.

## 7. Stakeholders
Prospective tenants, landlords/property owners, property agents, platform administrators, project team, project supervisor/lecturer. Stakeholder access and participation must be confirmed.

## 8. Proposed methodology
Use an iterative development approach: requirements discovery; analysis; design; implementation in small modules; testing; refinement; deployment demonstration. Use interviews and observation only with informed consent. Record participant role and date without unnecessary personal identifiers.

## 9. Feasibility
Technical: PHP 8+, PDO, MySQL/MariaDB and XAMPP are accessible development technologies. Operational: browser-based access is familiar, but stakeholder usability must be tested. Economic: the classroom MVP uses free/open-source tools and local hosting. Schedule: achievable only with controlled scope and regular testing. Legal/ethical: protect personal data, obtain consent, avoid publishing private addresses and do not imply legal verification.

## 10. Risks and mitigations
- Scope expansion: prioritise MVP and defer payment/messaging integrations.
- Fake or misleading listings: moderation, reporting plan and explicit limitations.
- Privacy breach: collect minimal data, restrict role access and use synthetic demo data.
- Weak connectivity: keep core pages lightweight; test on available devices.
- Late requirements changes: maintain change log and supervisor sign-off.
- Unverified research: distinguish interview findings from assumptions.

## 11. Success criteria
The MVP is considered functionally acceptable when a tenant can register, search published listings, save a listing, submit a viewing request and rental application; a landlord can submit a listing; an administrator can review it; and an authorised property manager can record decisions. These workflows must pass the test cases in the test plan on the target environment.

## 12. Approval
Project title and scope remain proposed until reviewed and approved by the lecturer/supervisor.
