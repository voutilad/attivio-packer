# Packer to Vagrant for CentOS 6.7

Forked from an *awesome* example: [geerlingguy/packer-centos-6](https://github.com/geerlingguy/packer-centos-6)

I've removed the Ansible stuff and started to tailor to [Attivio](http://www.attivio.com) needs.

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/)
  - [Makeself](http://stephanepeter.com/makeself/) (if you want to build a new Attivio daemon installer)
  - [Attivio 5](http://www.attivio.com)

## Usage

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build attivio5.json

After (quite) a few minutes, Packer should tell you the box was generated successfully.

### Installing the Vagrant Box

Assuming you've used Packer to build the box, which should be in the builds/ directory, copy the .box file and the _Vagrantfile_ to wherever you want to bootstrap your Attivio 4 dev environment.

Install the box like so, making sure to name it _attivio-5_:
````
>vagrant box add attivio-5.1.0-centos66.box -n attivio-5
````

Start up the box:
````
>vagrant up
````

SSH into your new box!:
````
>vagrant ssh
````

Want to launch Attivio Designer? If you have a local X11 instance, the Vagrantfile wires up X11 forwarding over ssh, so just launch Designer!:
````
>cd /opt/attivio/aie-5.1.0/designer
>./Designer
````

### X11 Support

If using the packaged Vagrant box on Mac OS X, you'll want to grab [XQuartz](http://xquartz.macosforge.org/landing/)

For Windows...maybe try [X/Cygwin](http://x.cygwin.com)?

## Customizing

To build any binary installers using the [Makeself](http://stephanepeter.com/makeself/) packager, use a command like:
````
>./makeself.sh <path_to_packer_project>/attivio install_daemon.sh \
 "Attivio 5 Daemonizer" ./demonize.sh

> cp install_daemon.sh <path_to_packer_project>/scripts
````

## License

Everything here is offered under MIT license with some code/config borrowed from other authors under their MIT licensed projects. (See "Author Information")

## Author Information

Originally forked project: Created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).

Borrowed shell script logic for VirtualBox Additions: Created in 2014 by [Geoffrey Wagner](https://github.com/gwagner): https://github.com/gwagner/packer-centos/blob/master/provisioners/install-virtualbox-guest-additions.sh
