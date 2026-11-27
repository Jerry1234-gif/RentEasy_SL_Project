# Design Artefact Guide

The supplied PNG diagrams and their Graphviz source are retained in `assets/diagrams/` and `diagrams/`. Review each before final submission and ensure it matches the implemented PHP/MySQL MVP.

## System context / Use case
Actors: Visitor, Tenant, Landlord, Property Agent, Administrator. Public visitors browse published listings. Tenants save listings and request viewings/apply. Landlords submit and manage their own listings and respond to requests. Agents are a planned delegated role; confirm assignment functionality before claiming it as implemented. Administrators moderate listings and manage platform records.

## DFD Level 0
External entities exchange property search, listing submissions, viewing requests, applications and moderation decisions with the RentEasy SL system. Data stores include user, property, image, saved-property, viewing, application, maintenance and audit records.

## DFD Level 1
Break the platform into authentication/role control, property listing and search, moderation, tenant workflows, maintenance tracking and audit/reporting processes. Data flows should be labelled with the information passed between processes and stores.

## ERD
The canonical implemented schema is `database/schema.sql`. It contains users, properties, property_images, saved_properties, viewing_requests, rental_applications, maintenance_requests and audit_logs. The ERD image may show conceptual/extended entities; the final report must distinguish implemented tables from future modules such as agreements and rent records if those are not in the runnable MVP.

## Architecture
Browser client → PHP application entry point and shared application bootstrap → PDO database access → MySQL. Uploaded images are stored in the uploads directory. This is a simple academic deployment architecture; a production service would add a web server hardening layer, private file storage, email service, backups, monitoring and secure secret management.
