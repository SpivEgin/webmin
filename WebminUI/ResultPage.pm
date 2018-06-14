package AdFreeZoneUI::ResultPage;
use AdFreeZoneCore;

=head2 new AdFreeZoneUI::ResultPage(subheading, title, message, [help-name])
Create a new page object for showing some success message.
=cut
sub new
{
if (defined(&AdFreeZoneUI::Theme::ResultPage::new) &&
    caller() !~ /AdFreeZoneUI::Theme::ResultPage/) {
	return new AdFreeZoneUI::Theme::ResultPage(@_[1..$#_]);
	}
my ($self, $subheading, $title, $message, $help) = @_;
$self = new AdFreeZoneUI::Page($subheading, $title, $help);
$self->add_message("<b>$message</b>");
return $self;
}

1;

