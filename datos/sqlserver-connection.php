<?php

	function conectar() {
		$server = 'SERVER\SERVER';
		$port = '1433';
		$databaseName = 'bdspmontesol';
		$userName = 'usermontesol';
		$password = '123456';
		try {
			$bd = new PDO("sqlsrv:Server=$server,$port;Database=$databaseName","$userName","$password");
			$bd->query("SET NAMES 'utf-8'");
			return $bd;
		} catch (Exception $ex) {
			echo ($ex->getMessage());
		}
	}

?>