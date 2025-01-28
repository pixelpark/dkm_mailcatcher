# Changelog

All notable changes to this project will be documented in this file.

## Release 1.1.0

### Changes

* Adding REFERENCE.md
* Update to PDK 3.4.0
* Fix systemd unit running as root user
* Add EL9 support
* Remove commited file from git_ignore

## Release 1.0.1

### Fixes

* Fix hiera variable names
* Fix variable name in systemdunit

## Release 1.0.0

### Changes

* PDK update to 2.5.0
* Cleanup code style
* Setting subclasses to private
* Fix unkown variable error messages inside `systemdunit`
* Moved variables from main class to `systemdunit`
* Removed facts that are not from the module itself and are not needed
