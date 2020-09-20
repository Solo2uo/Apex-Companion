<?php
session_start();
require_once './config/config.php';
require_once './includes/auth_validate.php';


//serve POST method, After successful insert, redirect to users.php page.
if ($_SERVER['REQUEST_METHOD'] === 'POST')
{
    //Mass Insert Data. Keep "name" attribute in html form same as column name in mysql table.
    $data_to_store = array_filter($_POST);

    //Insert timestamp
    $data_to_store['password'] = md5($data_to_store['username']);
    $db = getDbInstance();

    $last_id = $db->insert('users', $data_to_store);

    if($last_id)
    {
    	$_SESSION['success'] = "User added successfully!";
    	header('location: users.php');
    	exit();
    }
    else
    {
        echo 'insert failed: ' . $db->getLastError();
        exit();
    }
}

//We are using same form for adding and editing. This is a create form so declare $edit = false.
$edit = false;

require_once 'includes/header.php';
?>
<div id="page-wrapper">
<div class="row">
     <div class="col-lg-12">
            <h2 class="page-header">Add user</h2>
        </div>

</div>
    <form class="form" action="" method="post"  id="user_form" enctype="multipart/form-data">
       <?php  include_once('./forms/user_form.php'); ?>
    </form>
</div>


<script type="text/javascript">
$(document).ready(function(){
   $("#user_form").validate({
       rules: {
            username: {
                required: true
            },
            ign: {
                required: true
            },
            name: {
                required: true
            },
            email: {
                required: true
            },
        }
    });
});
</script>

<?php include_once 'includes/footer.php'; ?>
