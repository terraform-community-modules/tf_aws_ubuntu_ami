tf_aws_ubuntu_ami
=================

Terraform module to get the current set of publicly available ubuntu AMIs.

This module grabs all of the AMIs listed at:

    https://cloud-images.ubuntu.com/locator/ec2/

and then looks up the one you want given the input variables

## Input variables

  * region - E.g. eu-central-1
  * distribution - E.g. trusty
  * architecture - amd64/i386
  * virttype - hvm/pv
  * storagetype - instance-store/ebs-io1/ebs-ssd/ebs

## Outputs

  * ami_id

## Example use

    module "ami" {
      source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami"
      region = "eu-central-1"
      distribution = "trusty"
      architecture = "amd64"
      virttype = "hvm"
      storagetype = "instance-store"
    }

    resource "aws_instance" "web" {
      ami = "${module.ami.ami_id}"
      instance_type = "m3.8xlarge"
    }

## Short forms

This module also supports a couple of shortcuts for common configurations, where you
know the _instance_type_ you'd like to use, but don't want to bother looking up
the _virttype_

## ebs

    module "ami" {
      source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami/ebs"
      region = "eu-central-1"
      distribution = "trusty"
      instance_type = "m3.large"
    }

## instance-store

    module "ami" {
      source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami/instance-store"
      region = "eu-central-1"
      distribution = "trusty"
      instance_type = "m3.large"
    }  

## License

Apache2 - see the included LICENSE file for more details.

