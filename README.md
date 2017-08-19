# Error pages

## Documentation

Pour toute erreur survenant dans un before_filter du controlleur `ApplicationController`, il est impossible d'afficher une page d'erreur personnalisée.

Le message obtenu est alors :

	500 Internal Server Error
	If you are the administrator of this website, then please read this web application's log file and/or the web server's log file to find out what went wrong.

La raison est que la classe `DevagnosErrorPages::ErrorsController` hérite de `ApplicationController`.

## Utilisation

	gem 'devagnos_error_pages', '~> 1.0.0'

## Vues

	error_pages/401.html.*
	error_pages/403.html.*
	error_pages/404.html.*
	error_pages/406.html.*
	error_pages/423.html.*
	error_pages/500.html.*

## Tests

Pour tester les pages d'erreur, il faut que la configuration `consider_all_requests_local` soit à `false`.