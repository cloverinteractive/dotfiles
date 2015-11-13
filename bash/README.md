# Bash

## Your Bash config isn't enough for me

It is likely you have defined functions or aliases not contained in this config and you are worried to upgrade and lose them, in order to kep them and load them
you only need to create a file named `.bash_profile.before` which will be loaded before our `.bash_profile` and a file named `.bash_profile.after` which will
be loaded after.

