<?php 
	function conectar(){
		try {
			$bd = new PDO('mysql:host=localhost;dbname=bdspmontesol','root','');
			$bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$bd->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
			$bd->query("SET NAMES 'utf8'");
			return $bd;
		} catch (Exception $ex) {
			echo ($ex->getMessage());
		}
	}
?>