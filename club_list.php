<!doctype html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body>
<!-- Club header section -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	    <a class="navbar-brand" href="#">CBNU Events Calendar</a>
	    <button class="navbar-toggler" type="button" data-toggle="colla	pse" data-target="#navbarSupportedContent"
	      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="./index.php">Home <span class="sr-only"></span></a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="event_list.php">Event</a>
	        </li>
	        <li class="nav-item dropdown active">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            Club
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="./club_list.php">Club list</a>
	            <a class="dropdown-item" href="./club_create.php">Create club</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            Community
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="./community_my.php">My community</a>
	            <a class="dropdown-item" href="#">Create community</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            My page
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="./mypage_participatedLog">My profile</a>
	            <a class="dropdown-item" href="./mypage_comment.html">My comments</a>
	            <a class="dropdown-item" href="#">Logout</a>
	          </div>
	        </li>
	      </ul>
	      <!--
	            <form class="form-inline my-2 my-lg-0">
	                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	            </form>
	            -->
	    </div>
	  </nav>
  <div class="list-group">
    
    
<?php
include_once 'dbconfig.php';
$dbname = "events_calendar";
mysqli_select_db($conn, $dbname) or die('DB selection failed');

if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}else{
  // echo "Connection successful!<br>";	
}


// get club name
$sql_club_name = "
	SELECT id, name
	FROM club
";
$result_club_name = $conn->query($sql_club_name);
$row_club_name = mysqli_fetch_array($result_club_name);

	// ## Begin: get first club name and its manager
	// The while loop starts from the second row of the query, that's why this part is necessary
	echo '<a href="'.$row_club_name["id"].'" class="list-group-item list-group-item-action flex-column align-items-start">';
	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club ID: </strong>' . $row_club_name["id"] . '</h5><br>';
	echo '</div>';	
	
	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club name: </strong>' . $row_club_name["name"] . '</h5><br>';
	echo '</div>';	
	
	if($result_club_name->num_rows > 0){

	// get club manager using club id
	$sql_club_manager = "
		SELECT full_name
		FROM club
		JOIN user
		ON club.manager_id = user.id
		WHERE club.id =" . $row_club_name["id"] . "
	";
	$result_club_manager = $conn->query($sql_club_manager);
	$row_club_manager = mysqli_fetch_array($result_club_manager);

	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club manager: </strong>' . $row_club_manager["full_name"] . '</5>';
	echo '</div>';	

	// get club member using club id
	// get members and exclude the manager of the respectvive group
	$sql_member = "
		SELECT full_name FROM user, club_member
		WHERE user.id = club_member.user_id
		AND club_member.club_id =".$row_club_name["id"]."
		AND user.full_name NOT IN (
			SELECT full_name
			FROM user
			JOIN club
			ON user.id = club.manager_id
			WHERE club.id =".$row_club_name["id"].")
	";
	$result_member = $conn->query($sql_member);
	$row_member = mysqli_fetch_array($result_member);
	
	if($result_member->num_rows > 0){
		// output data of each row
		echo "<h5><strong>Club members: </strong>" . $row_member["full_name"] . ", ";

		while($row_member = $result_member->fetch_assoc()){
			echo $row_member["full_name"] . ", ";
		}
		echo '</h5>';
	}
	// ## End

	// ## BEGIN OUTER WHILE-LOOP
	// output data of each row
	while($row_club_name = $result_club_name->fetch_assoc()){

	echo '<a href="'. $row_club_name["id"] .'" class="list-group-item list-group-item-action flex-column align-items-start">';
	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club ID: </strong>' . $row_club_name["id"] . '</h5><br>';
	echo '</div>';		
	
	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club name: </strong>' . $row_club_name["name"] . '</h5><br>';
	echo '</div>';	

	// get club manager using club id
	$sql_club_manager = "
		SELECT full_name
		FROM club
		JOIN user
		ON club.manager_id = user.id
		WHERE club.id =" . $row_club_name["id"] . "
	";
	$result_club_manager = $conn->query($sql_club_manager);
	$row_club_manager = mysqli_fetch_array($result_club_manager);

	echo '<div class="d-flex w-100 justify-content-between">';
	echo '<h5 class="mb-1"><strong>Club manager: </strong>' . $row_club_manager["full_name"] . '</h5>';
	echo '</div>';

	$sql_member = "
		SELECT full_name FROM user, club_member
		WHERE user.id = club_member.user_id
		AND club_member.club_id =".$row_club_name["id"]."
		AND user.full_name NOT IN (
			SELECT full_name
			FROM user
			JOIN club
			ON user.id = club.manager_id
			WHERE club.id =".$row_club_name["id"].")
	";
	$result_member = $conn->query($sql_member);
	$row_member = mysqli_fetch_array($result_member);

	if($result_member->num_rows > 0){
		// output data of each row
		echo "<h5><strong>Club members: </strong>" . $row_member["full_name"] . ", ";
		while($row_member = $result_member->fetch_assoc()){
			echo $row_member["full_name"] . ", ";
		}
		echo '</h5>';
	}
	}   // ## END OUTER WHILE-LOOP
}

mysqli_close($conn);
?>    

</body>