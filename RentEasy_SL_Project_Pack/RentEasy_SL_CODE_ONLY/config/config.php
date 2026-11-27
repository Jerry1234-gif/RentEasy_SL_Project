<?php
return [
 'app_name' => 'RentEasy SL',
 'base_url' => '', // Leave blank when hosted at the project root; set e.g. /renteasy/public if needed.
 'db_host' => '127.0.0.1', 'db_name' => 'renteasy_sl', 'db_user' => 'root', 'db_pass' => '',
 'upload_dir' => dirname(__DIR__) . '/public/uploads/properties',
 'upload_url' => 'uploads/properties',
 'max_upload_bytes' => 4 * 1024 * 1024,
];
