<?php
require __DIR__ . '/../app/bootstrap.php';
$accounts=[
 ['Demo Administrator','admin@renteasy.test','admin'],
 ['Demo Landlord','landlord@renteasy.test','landlord'],
 ['Demo Tenant','tenant@renteasy.test','tenant'],
 ['Demo Agent','agent@renteasy.test','agent'],
];
foreach($accounts as [$name,$email,$role]){
 $q=db()->prepare('SELECT id FROM users WHERE email=?');$q->execute([$email]);
 if(!$q->fetch()){$q=db()->prepare('INSERT INTO users(name,email,password_hash,role) VALUES(?,?,?,?)');$q->execute([$name,$email,password_hash('ChangeMe123!',PASSWORD_DEFAULT),$role]);}
}
$owner=(int)db()->query("SELECT id FROM users WHERE email='landlord@renteasy.test'")->fetchColumn();
$admin=(int)db()->query("SELECT id FROM users WHERE email='admin@renteasy.test'")->fetchColumn();
$count=(int)db()->query('SELECT COUNT(*) FROM properties')->fetchColumn();
if(!$count){$q=db()->prepare("INSERT INTO properties(owner_id,title,description,property_type,city,district,area,public_location,bedrooms,bathrooms,rent_amount,currency,rent_period,status,reviewed_by,reviewed_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW())");
 $q->execute([$owner,'Sample two-bedroom apartment','Fictional sample listing for software demonstration only. Verify all details independently before making rental decisions.','apartment','Freetown','Western Area Urban','Sample Area','Approximate area only',2,1,3500,'SLE','month','published',$admin]);}
echo "Demo accounts ready. Password for all: ChangeMe123! Change these before any shared deployment.
";
