<?php 
	function conectar() {

		// conection1
		$server = 'remotemysql.com';
		$databaseName = 'l5tGyMWrI9';
		$userName = 'l5tGyMWrI9';
		$password = 'bdV98BMjOX';
	
		try {
			// $bd = new PDO("mysql:host=$server;dbname=$databaseName", $userName, $password);
			
			$bd = new PDO('mysql:host=localhost;dbname=bdspmontesolfinal','root',''); //conection default localhost
			$bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$bd->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
			$bd->query("SET NAMES 'utf8'");
			return $bd;
		} catch (Exception $ex) {
			echo ($ex->getMessage());
		}
	}
?>