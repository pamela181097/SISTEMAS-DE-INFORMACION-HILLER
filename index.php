<!DOCTYPE html>

<html>

<head>

	<meta charset="utf-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Lumino - Login</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">

	<link href="css/datepicker3.css" rel="stylesheet">

	<link href="css/styles.css" rel="stylesheet">

	<!--[if lt IE 9]>

	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>

	<![endif]-->

</head>

<body>

	<div class="row">

		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">

			<div class="login-panel panel panel-default">

				<div class="panel-heading">Inicie su Sesi&oacute;n</div>

				<div class="panel-body">

					<form action="control.php" method="post">

						<fieldset>

							<div class="form-group">

								<input class="form-control" placeholder="Nombre" name="nombre" type="text" autofocus="" required>

							</div>

							<div class="form-group">

								<input class="form-control" placeholder="Password" name="password" type="password" value="" required>

							</div>

							<!--div class="checkbox">

								<label>

									<input name="remember" type="checkbox" value="Remember Me">Remember Me

								</label>

							</div-->

							<input type="submit" value="Entrar ->" name="entrar" class="btn btn-primary">
							<input type="reset" value="Cancelar" name="cancelar" class="btn btn-danger">
					</form>

				</div>

				<?php

					if( isset($_GET['error'])){
						if($_GET['error'] == 'si'){
				?>
				<div class="alert alert-danger">
		                        <strong>�Error!</strong> Datos erroneos.
 		                </div>
				<?php
					}
				}	
				?>
			</div>

		</div><!-- /.col-->

	</div><!-- /.row -->
	


<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>
