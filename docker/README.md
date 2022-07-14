### Docker Related

* Build Docker Image by running the following command.

`docker build -t awsinstanceip:v1 . `

* To Run the image run the following command.

`docker run awsinstanceip:v1 `

* To Pass `awscredentials` run the image with `--env-file` flag.

`docker run --env-file $HOME/.aws/credentials awsinstanceip:v1`