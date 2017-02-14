# AWS CLI

Simple docker image for running the AWS [CLI](http://aws.amazon.com/documentation/cli/) in a container.

## Usage

AWS credentials can be mounted inside the container at `/root/.aws`.  For instance, to describe the ELB's associated with your account:

```shell
$ docker run \
		--rm -t \
		-v ~/.aws:/root/.aws \
		--name aws \
		jdubz/awscli:latest \
		elb describe-load-balancers
```

A simpler way to use this image is to wrap it in a shell function.  An example
can be found [here](https://github.com/t3hpr1m3/dotfiles/blob/b057c0883410fd83622e96ef554a4f4ae25ac950/home/.docker_wrappers#L120).

With this in place, the above command becomes:

```shell
$ aws elb describe-load-balancers
```

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).
