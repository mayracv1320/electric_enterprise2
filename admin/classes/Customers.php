<?php 
session_start();
/**
 * 
 */
class Customers
{
	
	private $con;
	private $id_orders;

	function __construct()
	{
		include_once("Database.php");
		$db = new Database();
		$this->con = $db->connect();
	}

	public function getCustomers(){
		$query = $this->con->query("SELECT `user_id`, `first_name`, `last_name`, `email`, `mobile`, `address1`, `address2` FROM `user_info`");
		$ar = [];
		if (@$query->num_rows > 0) {
			while ($row = $query->fetch_assoc()) {
				$ar[] = $row;
			}
			return ['status'=> 202, 'message'=> $ar];
		}
		return ['status'=> 303, 'message'=> 'sin datos de clientes'];
	}


	public function getCustomersOrder(){
		$query = $this->con->query("SELECT o.order_id, o.product_id, o.qty, o.trx_id, o.p_status, p.product_title, p.product_image FROM orders o JOIN products p ON o.product_id = p.product_id");
		$ar = [];
		if (@$query->num_rows > 0) {
			while ($row = $query->fetch_assoc()) {
				$ar[] = $row;
			}
			return ['status'=> 202, 'message'=> $ar];
		}
		return ['status'=> 303, 'message'=> 'aún no hay pedidos'];
	}

	public function sendEmail(){

		$from = "nain.acero24@gmail.com";
		$to = "a_nacerom@unjbg.edu.pe";
		$subject = "REGISTRO CIIS XXI";
		$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
		$cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		$cabeceras .= 'From: ' . $from;
		$mensaje = 'hola';
		mail($to,$subject,$mensaje, $cabeceras);

	}
	
	public function setIdOrders($id_orders){
		$this->id_orders = $id_orders;
	}

}


/*$c = new Customers();
echo "<pre>";
print_r($c->getCustomers());
exit();*/

if (isset($_POST["GET_CUSTOMERS"])) {
	if (isset($_SESSION['admin_id'])) {
		$c = new Customers();
		echo json_encode($c->getCustomers());
		exit();
	}
}

if (isset($_POST["GET_CUSTOMER_ORDERS"])) {
	if (isset($_SESSION['admin_id'])) {
		$c = new Customers();
		echo json_encode($c->getCustomersOrder());
		exit();
	}
}

if(isset($_POST["GET_CUSTOMER_ORDERS_EMAIL"])){
	$id_orders = $_POST["GET_CUSTOMER_ORDERS_EMAIL"];
	$c = new Customers();
	$c->setIdOrders($id_orders);
	$c->sendEmail();
	echo json_encode([]);
	exit();
}


?>