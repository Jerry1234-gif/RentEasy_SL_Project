<?php
session_start();
$config=require __DIR__.'/../config/config.php';
function cfg($key){global $config;return $config[$key]??null;}
function db(){static $pdo=null;if(!$pdo){$dsn='mysql:host='.cfg('db_host').';dbname='.cfg('db_name').';charset=utf8mb4';$pdo=new PDO($dsn,cfg('db_user'),cfg('db_pass'),[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);}return $pdo;}
function e($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function url($path=''){return rtrim(cfg('base_url'),'/').'/'.ltrim($path,'/');}
function redirect_to($path){header('Location: '.url($path));exit;}
function current_user(){return $_SESSION['user']??null;}
function require_login(){if(!current_user()){flash('error','Please sign in to continue.');redirect_to('index.php?page=login');}}
function require_role(...$roles){require_login();if(!in_array(current_user()['role'],$roles,true)){http_response_code(403);exit('403 – You are not authorised to perform this action.');}}
function csrf_field(){return '<input type="hidden" name="csrf" value="'.e($_SESSION['csrf']??'').'">';}
function verify_csrf(){if(!hash_equals($_SESSION['csrf']??'',$_POST['csrf']??'')){http_response_code(419);exit('Session expired. Refresh and try again.');}}
function flash($type,$message){$_SESSION['flash'][$type]=$message;}
function consume_flashes(){$f=$_SESSION['flash']??[];unset($_SESSION['flash']);return $f;}
function audit($action,$type=null,$id=null,$details=[]){$q=db()->prepare('INSERT INTO audit_logs(actor_id,action,subject_type,subject_id,details) VALUES(?,?,?,?,?)');$q->execute([current_user()['id']??null,$action,$type,$id,json_encode($details)]);}
if(empty($_SESSION['csrf']))$_SESSION['csrf']=bin2hex(random_bytes(32));
