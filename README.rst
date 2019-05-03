Image builder for Raspi
=======================

This package asumes a Debian installation and uses the Embedded Linux
Build Environment (ELBE) für building custom images for the
Raspberry-Pi. ELBE uses a KVM virtual machine for the whole build
environment. Inside this machine a QEMU istance is run for the target
architecture.

The image is built from a raspbian repository. This ensures that
the resulting image always has the latest packages with security
fixes. Note that ELBE provides for building reproduceable images that
contain the same packages even if newer packages are available from the
distribution. For more details on ELBE see `ELBE's website`_ and
`ELBE's git`_.

.. _`ELBE's website`: https://elbe-rfs.org/
.. _`ELBE's git`: https://github.com/Linutronix/elbe
.. _`elbe-arm`: https://github.com/schlatterbeck/elbe-arm

If you want to build images for some common raspi name-alikes like
Orange-Pi or Banana-Pi or the Olimex boards, see my `elbe-arm`_ project.
