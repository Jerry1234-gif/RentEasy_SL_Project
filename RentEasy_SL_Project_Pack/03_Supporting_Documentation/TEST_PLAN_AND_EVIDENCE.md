# Test Plan and Evidence Register

**Important:** The result column must be completed only after a person executes the test on the target computer. Do not pre-mark unexecuted tests as passed.

| ID | Test | Expected result | Actual result | Status |
|---|---|---|---|---|
| T01 | Register tenant with valid details | Account created and dashboard opens | To be recorded | Not run |
| T02 | Register with duplicate email | Validation/database error; no duplicate user | To be recorded | Not run |
| T03 | Sign in with valid credentials | User session established | To be recorded | Not run |
| T04 | Sign in with incorrect password | Access denied | To be recorded | Not run |
| T05 | Tenant attempts landlord-only listing submission | Access denied | To be recorded | Not run |
| T06 | Landlord submits valid listing | Listing stored as pending_review | To be recorded | Not run |
| T07 | Public visitor opens pending listing directly | Listing is not exposed | To be recorded | Not run |
| T08 | Administrator publishes pending listing | Listing becomes visible publicly | To be recorded | Not run |
| T09 | Tenant filters properties | Matching published listings shown | To be recorded | Not run |
| T10 | Tenant saves a listing | Favourite record created | To be recorded | Not run |
| T11 | Tenant submits future viewing request | Request stored as pending | To be recorded | Not run |
| T12 | Property manager accepts viewing | Status updated | To be recorded | Not run |
| T13 | Tenant submits rental application | Application stored | To be recorded | Not run |
| T14 | Property manager declines application | Status and note updated | To be recorded | Not run |
| T15 | Tenant submits maintenance issue | Request stored | To be recorded | Not run |
| T16 | Unauthorised user attempts admin review | Access denied | To be recorded | Not run |
| T17 | Upload unsupported file type | File rejected/not stored | To be recorded | Not run |
| T18 | Mobile viewport review | Layout remains usable | To be recorded | Not run |

## Evidence to capture
1. Registration and login screenshots (use synthetic demo data).
2. Public search with filters.
3. Property submission confirmation.
4. Admin review queue and publication decision.
5. Published property detail page.
6. Tenant favourite, viewing and application records.
7. Property manager decision screens.
8. Maintenance request and status update.
9. Database tables with non-sensitive demonstration records.
10. Browser/device details, date, tester and any defects found.

## Defect log
Record: defect ID, date, environment, steps to reproduce, expected result, actual result, severity, correction and retest result.
