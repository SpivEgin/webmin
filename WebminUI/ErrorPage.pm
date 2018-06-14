package AdFreeZoneUI::ErrorPage;
use WebminCore;

=head2 new AdFreeZoneUI::ErrorPage(subheading, title, message, [program-output], [help-name])
Create a new page object for showing an error of some kind
=cut
sub new
{
if (defined(&AdFreeZoneUI::Theme::ErrorPage::new)) {
	return new AdFreeZoneUI::Theme::ErrorPage(@_[1..$#_]);
	}
my ($self, $subheading, $title, $message, $output, $help) = @_;
$self = new AdFreeZoneUI::Page($subheading, $title, $help);
$self->add_message("<b>",$text{'error'}," : ",$message,"</b>");
$self->add_message("<pre>",$output,"</pre>");
return $self;
}

1;

