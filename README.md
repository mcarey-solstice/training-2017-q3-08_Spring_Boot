# Spring Boot Lab 08

## Microservices

### Questions

1. If the directory-service app changes its URL, what do you need to do? What about the id of the Directory, what do you need to do?

    - Per the instructions, the `application.properties` file would need to be modified every time the service is redeployed.

2. How do these services communicate? Do messages go outside and return? or is this communication directly between apps?

    - These services only communicate when the client pulls information from the service.  These messages do go outside and return because anyone can make these requests and get the same data.

3. Can we use RabbitMQ to do messaging between these two apps?

    - Yes, we can use RabbitMQ to allow these apps to communicate directly.

4. How can we avoid a restage of the applications?

    - Yes, ideally, we can have the client use a discovery service which would find the URL and ID through that service.  The other option is environment variables.  Currently, my Makefile will parse the content received from the service URLs and adds the environment variables to the client application.

5. Can we add a blue-green deployment?

    - Yes, Cloud Foundry allows easy binding and unbinding routes.

6. How can we solve all this?

    - The easiest and most efficient method is using a Discovery Service.  The client would simply check which service to hit and it would return the needed information.