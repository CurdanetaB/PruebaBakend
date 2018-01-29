<?php echo "<!DOCTYPE html>" ?>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script> -->
</head>
<body>
    <h1>pinche prueba</h1>
    <p><?php echo "p es: {$_GET['p']}" ?></p>
    <pre>
<?php
if ($_GET) { ?><strong>$_GET</strong>
<?php
var_dump($_GET);
print_r($_GET);
}
if ($_POST) { ?><strong>$_POST</strong>
<?php
var_dump($_POST);
print_r($_POST);
} ?>
    </pre>
    <FORM action="#" method="post">
        <P>
        First name: <INPUT type="text" name="firstname"><BR>
        Last name: <INPUT type="text" name="lastname"><BR>
        email: <INPUT type="text" name="email"><BR>
        <INPUT type="radio" name="sex" value="Male"> Male<BR>
        <INPUT type="radio" name="sex" value="Female"> Female<BR>
        <INPUT type="submit" value="Send"> <INPUT type="reset">
        </P>
 </FORM>
</body>
</html>