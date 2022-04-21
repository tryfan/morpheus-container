# Morpheus in Docker

## Building

Build the container:

`docker build --pull --rm -f "Dockerfile" -t morpheuscontainer:latest "."`

## Configuration

Supported configuration entries for morpheus.rb are translated and processed through environment variables.  So, `rabbitmq['queue_user']` becomes `MORPHEUS_RABBITMQ_QUEUE_USER`.  `make-morpheus-rb.sh` has the full list of supported variables.

## Usage

There is a sample `docker-compose.yml` in `examples/`.  Replace the data volume directories and the `MORPHEUS_APPLIANCE_URL` with the IP of your docker host.  Start up the es, mysql, and rmq containers first, like so: `docker-compose up -d es mysql rmq` and confirm a good startup on those before starting the morpheus container with: `docker-compose up -d morpheus`

NOTE: I had issues running this on anything less than 20G of RAM.  This can probably be reduced by tuning the other services, but the Morpheus UI will need to be tuned in the future, as it will detect the total amount of RAM on the docker host.