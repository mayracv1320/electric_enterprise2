<?php

/**
 * 
 */
class Database
{
	
	private $con;
	public function connect(){
		$this->con = new Mysqli("bu80vbqxziimm0fg99tx-mysql.services.clever-cloud.com", "u2n2zntjcaxqdaa5", "ktbgJ5QGLupSDyEdURTc", "bu80vbqxziimm0fg99tx");
		return $this->con;
	}
}

?>