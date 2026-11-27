CREATE DATABASE IF NOT EXISTS renteasy_sl CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE renteasy_sl;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS audit_logs, maintenance_requests, rental_applications, viewing_requests, saved_properties, property_images, properties, users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, name VARCHAR(120) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE, phone VARCHAR(30) NULL,
 password_hash VARCHAR(255) NOT NULL, role ENUM('tenant','landlord','agent','admin') NOT NULL DEFAULT 'tenant',
 status ENUM('active','suspended','disabled') NOT NULL DEFAULT 'active', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE properties (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, owner_id BIGINT UNSIGNED NOT NULL, agent_id BIGINT UNSIGNED NULL,
 title VARCHAR(150) NOT NULL, description TEXT NOT NULL,
 property_type ENUM('apartment','house','room','commercial') NOT NULL,
 city VARCHAR(80) NOT NULL, district VARCHAR(80) NULL, area VARCHAR(100) NOT NULL,
 public_location VARCHAR(180) NULL, bedrooms TINYINT UNSIGNED NULL, bathrooms TINYINT UNSIGNED NULL,
 rent_amount DECIMAL(12,2) NOT NULL, currency CHAR(3) NOT NULL DEFAULT 'SLE',
 rent_period ENUM('week','month','year') NOT NULL, deposit_amount DECIMAL(12,2) NULL,
 available_from DATE NULL,
 status ENUM('draft','pending_review','needs_changes','published','rejected','suspended','rented','unavailable','archived') NOT NULL DEFAULT 'pending_review',
 review_note TEXT NULL, reviewed_by BIGINT UNSIGNED NULL, reviewed_at DATETIME NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 INDEX idx_property_search(status,city,district,property_type,rent_amount),
 CONSTRAINT fk_prop_owner FOREIGN KEY(owner_id) REFERENCES users(id),
 CONSTRAINT fk_prop_agent FOREIGN KEY(agent_id) REFERENCES users(id) ON DELETE SET NULL,
 CONSTRAINT fk_prop_reviewer FOREIGN KEY(reviewed_by) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB;
CREATE TABLE property_images (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, property_id BIGINT UNSIGNED NOT NULL,
 file_name VARCHAR(255) NOT NULL, alt_text VARCHAR(180) NULL, sort_order SMALLINT UNSIGNED DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(property_id) REFERENCES properties(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE saved_properties (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, tenant_id BIGINT UNSIGNED NOT NULL, property_id BIGINT UNSIGNED NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, UNIQUE KEY uq_saved(tenant_id,property_id),
 FOREIGN KEY(tenant_id) REFERENCES users(id) ON DELETE CASCADE, FOREIGN KEY(property_id) REFERENCES properties(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE viewing_requests (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, property_id BIGINT UNSIGNED NOT NULL, tenant_id BIGINT UNSIGNED NOT NULL,
 requested_at DATETIME NOT NULL, message VARCHAR(1000) NULL,
 status ENUM('pending','accepted','declined','completed','cancelled') DEFAULT 'pending', decision_note VARCHAR(1000) NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(property_id) REFERENCES properties(id) ON DELETE CASCADE, FOREIGN KEY(tenant_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE rental_applications (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, property_id BIGINT UNSIGNED NOT NULL, tenant_id BIGINT UNSIGNED NOT NULL,
 message TEXT NOT NULL, status ENUM('submitted','under_review','approved','declined','withdrawn') DEFAULT 'submitted',
 decision_note VARCHAR(1000) NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(property_id) REFERENCES properties(id) ON DELETE CASCADE, FOREIGN KEY(tenant_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE maintenance_requests (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, property_id BIGINT UNSIGNED NOT NULL, tenant_id BIGINT UNSIGNED NOT NULL,
 category ENUM('plumbing','electrical','structural','appliance','other') NOT NULL, description TEXT NOT NULL,
 urgency ENUM('normal','high') DEFAULT 'normal', status ENUM('open','in_progress','waiting','resolved','closed') DEFAULT 'open',
 resolution_note TEXT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(property_id) REFERENCES properties(id) ON DELETE CASCADE, FOREIGN KEY(tenant_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
CREATE TABLE audit_logs (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, actor_id BIGINT UNSIGNED NULL, action VARCHAR(100) NOT NULL,
 subject_type VARCHAR(100) NULL, subject_id BIGINT UNSIGNED NULL, details JSON NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(actor_id) REFERENCES users(id) ON DELETE SET NULL, INDEX idx_audit_subject(subject_type,subject_id)
) ENGINE=InnoDB;
