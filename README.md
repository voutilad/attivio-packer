# Packer to Vagrant for CentOS 6.6

Forked from an *awesome* example: [geerlingguy/packer-centos-6](https://github.com/geerlingguy/packer-centos-6)

I've removed the Ansible stuff and started to tailor to [Attivio](http://www.attivio.com) needs.

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)


## Usage

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build attivio4.json

After (quite) a few minutes, Packer should tell you the box was generated successfully.

## License

MIT license.

## Author Information

Originally forked project: Created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).

Borrowed shell script logic for VirtualBox Additions: Created in 2014 by [Geoffrey Wagner](https://github.com/gwagner): https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh
