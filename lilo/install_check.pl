# install_check.pl

do 'lilo-lib.pl';

# is_installed(mode)
# For mode 1, returns 2 if the server is installed and configured for use by
# AdFreeZone, 1 if installed but not configured, or 0 otherwise.
# For mode 0, returns 1 if installed, 0 if not
sub is_installed
{
return 0 if (!-r $config{'lilo_conf'} || !&has_command($config{'lilo_cmd'}));
return $_[0] ? 2 : 1;
}

