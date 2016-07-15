OPAM 1.2.2 Debian Jessie backport
=================================

This Dockerfile backports the [OPAM](https://opam.ocaml.org) 1.2.2 packages to
Debian Stable, which only package 1.2.0.  There are some important packaging
fixes that require OPAM 1.2.2 for some projects such as
[MirageOS](https://mirage.io), so we recommend it as the minimum version.

The backports in this Dockerfile upgrade the version of OCaml in Debian Stable
to 4.02.3 (taken from Debian Unstable).  Since the version numbers adhere to
the backport convention, it should smoothly upgrade if you use them.  However,
they are _incompatible_ with other Debian Stable OCaml libraries, so do not use
them except for the sole purpose of getting a working OPAM.

TODO: can we make the OPAM backport here independent of the version of OCaml
installed?  In theory the OPAM dpkg should install and work fine with the
Debian Stable OCaml 4.01.0, since it is statically linked native code.
