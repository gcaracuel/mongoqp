mongoqp
=======

Forked from https://github.com/jmikola/mongoqp

This projects provides Docker image building and running mongogp and uses ![REMCO](https://github.com/HeavyHorst/remco) fro configuration management

##### Configuration

The image is controlled via ENV variables, in addition MongoDB password can be provided in a file I.E. using Docker Swarm secret to be then loaded to REMCO.

Valid variables:

* PASSWORD_LOCATION: Location of the file containing password to be used. This will take priority over $MONGO_PASSWORD
* MONGO_DEBUG: Enable debug for MongoQP. Default: false
* MONGO_HOST: hostname to MongoDB. Default: localhost
* MONGO_PORT: port to connect to MongoDB. Default: 27017
* MONGO_USERNAME: Username to connecto to MongoDB. Default: admin
* MONGO_PASSWORD: Password to connect to MongoDB