# install_check.pl

do 'quota-lib.pl';

# is_installed(mode)
# For mode 1, returns 2 if the server is installed and configured for use by
# AdFreeZone, 1 if installed but not configured, or 0 otherwise.
# For mode 0, returns 1 if installed, 0 if not
sub is_installed
{
if (defined(&quotas_init)) {
	local $err = &quotas_init();
	return 0 if ($err);
	}
return $_[0] ? 2 : 1;
}

