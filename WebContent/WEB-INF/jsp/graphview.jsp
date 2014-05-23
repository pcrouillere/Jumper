<html>
	<head>
		<style type="text/css">
		  #container {
			max-width:500px;
			height: 500px;
			
			margin: auto;
		  }
		</style>
	</head>
	<body>
		<div id="container"></div>
			<script src="sigma.min.js"></script>
			<script src="sigma.parsers.json.min.js"></script>
			<script>
			  sigma.parsers.json('data.json', {
				container: 'container',
				settings: {
				  defaultNodeColor: '#ec5148'
				}
			  });
			</script>
	</body>
</html>