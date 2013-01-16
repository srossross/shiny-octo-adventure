shiny-octo-adventure
====================

This is a demo to put together the 

## Install instructions:

 * Install [nodejs](http://nodejs.org)
 * Install hem with `nmp install -g hem`
 * Install shiny-octo-adventure 
  * `git clone git@github.com:srossross/shiny-octo-adventure.git`
  * `cd shiny-octo-adventure`
  * `nmp install .`
 * Install flask `pip install flask`

## Development instructions:

In the shiny-octo-adventure directory

### Launch the hem server

Use the command `hem server`

This will create a server to serve your javascript and html

### Launch server.py

Use the command `python ./server.py`

This will create a server to serve your JSON data.

## Deployment instructions:

### HEM

Run the command `hem build`

This will place all of the requered resources under the `./public` directory.
You can then move the public directory to *any* static web server. nodejs and hem are no longer needed.

### server.py

TODO: This will require more work ... 



