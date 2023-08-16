<?php
require "../dbconfig/db_conn.php";
$alertOutput = "";
$output = "";
try{
	$conn = DBMySQL::connect();
	if(isset($_POST['approve'])){
//execute approval
		$id = $_POST['userID'];
		$name = $_POST['name'];
		//Make sure the user to be approve is a new user
		$query = $conn->prepare("UPDATE user SET status = 1 WHERE id = ? AND status = 0");
		$query->bind_param("i", $id);
		$query->execute();
		$alertOutput .= sprintf("Login for %s has been approved", $name);
	}
	//get list of non-inactive users
	$query = $conn->query("SELECT u.id, u.name full_name, u.username, u.date_created, r.name role_name, u.status, us.description status_desc from user u INNER JOIN role r ON r.id = u.role_id INNER JOIN user_status us ON us.id = u.status WHERE u.status <> -1 ORDER BY status, date_created");
	if($query->num_rows > 0){
		while($row = $query->fetch_assoc()){
			$output .= "<form method='POST'>
			<tr>
			<input type='hidden' name='userID' value='".$row['id']."'>
			<input type='hidden' name='name' value='".$row['full_name']."'>
			<td>".$row['full_name']."</td>
			<td>".$row['username']."</td>
			<td>".$row['role_name']."</td>
			<td>".$row['status_desc']."</td>
			<td>".$row['date_created']."</td>
			<td>";
			if($row['status'] == 0)
				$output .= "<input type='submit' name='approve' value='Approve'>";
			$output .= "</td></tr>";
		}
	}
	else
		$output .= "<tr><td colspan='6'>No users</td></tr>";
}
catch(Exception $e){
	$alertOutput = print_r($e, true);
}
finally{
	$conn->close();
}
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../lib/custom.css">
	<title>View users</title>
</head>
<body>
	<?php echo $alertOutput;?>
	<table border="1">
		<thead>
			<tr>
				<th>Name</th>
				<th>Username</th>
				<th>Role</th>
				<th>Status</th>
				<th>Date created</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<?php echo $output;?>
		</tbody>	
	</table>
</body>
</html>