tf_aws_ubuntu_ami
=================

Terraform module to get the current set of publicly available ubuntu AMIs.

This module grabs all of the AMIs listed at:

    http://cloud-images.ubuntu.com/locator/ec2/

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

## License

Apache2 - see the included LICENSE file for more details.

