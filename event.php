<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Event Info</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</head>
	<body class="is-preload">

		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	    <a class="navbar-brand" href="#">CBNU Events Calendar</a>
	    <button class="navbar-toggler" type="button" data-toggle="colla	pse" data-target="#navbarSupportedContent"
	      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav mr-auto">
	        <li class="nav-item">
	          <a class="nav-link" href="./index.html">Home <span class="sr-only">(current)</span></a>
	        </li>
	        <li class="nav-item active">
	          <a class="nav-link" href="event.html">Event</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            Club
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="./club-list.html">Club list</a>
	            <a class="dropdown-item" href="#">Create club</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            Community
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="./my-community.html">My community</a>
	            <a class="dropdown-item" href="#">Create community</a>
	          </div>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
	            aria-haspopup="true" aria-expanded="false">
	            My page
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <a class="dropdown-item" href="#">My profile</a>
	            <a class="dropdown-item" href="#">My comments</a>
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

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
						<!-- Banner -->
							<section id="banner">
								<div class="content">
								<?php
									include_once 'dbconfig.php';
									$dbname = "events_calendar";
									mysqli_select_db($conn, $dbname) or die('DB selection failed');
									$sql = " SELECT avg(r.score) avg, e.name name, e.date date, l.name lname, l.capacity cap, c.name cname
									FROM review AS r, event AS e, location AS l, club as c
									WHERE e.id = 1
									AND e.id = r.event_id
									AND e.location_id = l.id
									AND e.club_id = c.id
									";
									$result = $conn->query($sql);
									$row = mysqli_fetch_array($result);
									echo '<header>';
									echo '<h1>'.$row["name"].'</h1>';
									echo '<p>'.$row["cname"].'</p>';
									echo '</header>';
									echo '<p>'.$row["lname"].'<br>';
									echo 'phone : 010-1111-2222<br>';
									echo 'Date & time : '.$row["date"].'<br>';
									echo 'capacity : '.$row["cap"].'</p>';
									echo '<h2>Score : '.$row["avg"].'/5.0</h2>';;
									?>
									<ul class="actions">
										<li><a href="location.php" class="button big">About Location</a></li>
										<li><a href="#" class="button big">About Club</a></li>
									</ul>
									<ul class="actions">
										<li><a href="participateMember.php" class="button big">Reservation status</a></li>
									</ul>
								</div>
								<span class="image object">
									<img src="images/pic13.jpg" alt="" style="width:328px; height:466px;"/>
								</span>
							</section>
							<!-- Section -->
							<?php
								include_once 'dbconfig.php';
								$dbname = "events_calendar";
								mysqli_select_db($conn, $dbname) or die('DB selection failed');
								$sql = " SELECT name, club_id, date, id FROM event ";
								$result = $conn->query($sql);
							?>
								<section>
									<header class="major">
										<h2>Another Event</h2>
									</header>
									<div class="features">
										<?php
										while($row = mysqli_fetch_array($result)) {
										echo '<article>';
										echo '<a href ="#">';
										echo '<span class="image object"><img src="images/pic06.jpg" alt="" style="width:82px; height:116px;"/></span>';
										echo '<div class="content">';
										echo '<h3>'.$row["name"].'</h3>';
										echo '<p>'.$row["club_id"].' / '.$row["date"].'</p>';
										echo '</div>';
										echo '</a>';
										echo '</article>';}
										?>
										<!-- <article>
											<a href ="#">
												<span class="image object"><img src="images/pic06.jpg" alt="" style="width:82px; height:116px;"/></span>
												<div class="content">
													<h3>Another Event</h3>
													<p>this is temp another event</p>
												</div>
											</a>
										</article>
										<article>
											<a href ="#">
												<span class="image object"><img src="images/pic07.jpg" alt="" style="width:82px; height:116px;"/></span>
												<div class="content">
													<h3>Another Event</h3>
													<p>this is temp another event</p>
												</div>
											</a>
										</article>
										<article>
											<a href ="#">
												<span class="image object"><img src="images/pic08.jpg" alt="" style="width:82px; height:116px;"/></span>
												<div class="content">
													<h3>Another Event</h3>
													<p>this is temp another event</p>
												</div>
											</a>
										</article>
										<article>
											<a href ="#">
												<span class="image object"><img src="images/pic09.jpg" alt="" style="width:82px; height:116px;"/></span>
												<div class="content">
													<h3>Another Event</h3>
													<p>this is temp another event</p>
												</div>
											</a>
										</article> -->
									</div>
								</section>

						</div>
					</div>


			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
