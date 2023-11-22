<?php
    require_once('config.inc.php');

    // Check if the user is logged in
    $loggedInUser = ""; 
    if (isset($_SESSION['logged_in']) && $_SESSION['logged_in']) {
        $loggedInUser = "Logged in: " . $_SESSION['family_name'] . " " . $_SESSION['surname'] . " (" . $_SESSION['login_name'] . ")";
        
        // Check if the role name is set in the session
        if (isset($_SESSION['role_name'])) {
            $loggedInUser .= " - [" . $_SESSION['role_name'] . "]";
        }
    }
?>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="media/logo.jpg" alt="OperettaHarmony" height="60" width="60">
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="nav nav-tabs">
        <?php foreach($menu as $key => $menu_item) { ?>
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<?php echo $menu_item['link']; ?>">
                    <?php echo $menu_item['text']; ?>
                </a>
            </li>
        <?php } ?>
      </ul>
    </div>

    <div class="ml-auto">
        <?php if ($loggedInUser === "") { // User not logged in ?>
            <a href="/web_2_beadando_2-main/fiok.php" class="btn btn-primary">Login</a>
        <?php } else { // User logged in ?>
            <span><?php echo $loggedInUser; ?></span>
            <a href="/web_2_beadando_2-main/logout.php" class="btn btn-danger">Exit</a>
        <?php } ?>
    </div>
  </div>
</nav>
