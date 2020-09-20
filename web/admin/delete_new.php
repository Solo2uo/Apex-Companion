<?php
session_start();
require_once 'includes/auth_validate.php';
require_once './config/config.php';
$del_id = filter_input(INPUT_POST, 'del_id');
if ($del_id && $_SERVER['REQUEST_METHOD'] == 'POST')
{

	if($_SESSION['admin_type']!='super'){
		$_SESSION['failure'] = "You don't have permission to perform this action";
    	header('location: news.php');
        exit;

	}
    $new_id = $del_id;

    $db = getDbInstance();
    $db->where('id', $new_id);
    $status = $db->delete('news');

    if ($status)
    {
        $_SESSION['info'] = "News deleted successfully!";
        header('location: news.php');
        exit;
    }
    else
    {
    	$_SESSION['failure'] = "Unable to delete News";
    	header('location: news.php');
        exit;

    }

}
