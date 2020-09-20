<?php
session_start();
require_once './config/config.php';
require_once './includes/auth_validate.php';

//serve POST method, After successful insert, redirect to news.php page.
if ($_SERVER['REQUEST_METHOD'] === 'POST')
{
    //Mass Insert Data. Keep "name" attribute in html form same as column name in mysql table.
    $data_to_store = array_filter($_POST);

    //Insert timestamp
    $data_to_store['date'] = date('Y-m-d H:i:s');
    $db = getDbInstance();

    $last_id = $db->insert('news', $data_to_store);

    if($last_id)
    {
    	$_SESSION['success'] = "News added successfully!";
    	header('location: news.php');
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
            <h2 class="page-header">Add NEWS</h2>
        </div>

</div>
    <form class="form" action="" method="post"  id="news_form" enctype="multipart/form-data">
       <?php  include_once('./forms/news_form.php'); ?>
    </form>
</div>

<script type="text/javascript">
$(document).ready(function(){
   $("#news_form").validate({
       rules: {
            title: {
                required: true
            },
            details: {
                required: true
            },
            imageUrl: {
                required: true
            },
            url: {
                required: true
            },
            writer: {
                required: true
            },
        }
    });
});
</script>

<?php include_once 'includes/footer.php'; ?>
