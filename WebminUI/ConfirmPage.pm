package AdFreeZoneUI::ConfirmPage;
use AdFreeZoneUI::Page;
use WebminCore;
@ISA = ( "AdFreeZoneUI::Page" );

=head2 new AdFreeZoneUI::ConfirmPage(subheading, title, message, cgi, &in, [ok-message],
			       [cancel-message], [help-name])
Create a new page object that asks if the user is sure if he wants to
do something or not.
=cut
sub new
{
if (defined(&AdFreeZoneUI::Theme::ConfirmPage::new)) {
	return new AdFreeZoneUI::Theme::ConfirmPage(@_[1..$#_]);
	}
my ($self, $subheading, $title, $message, $cgi, $in, $ok, $cancel, $help) = @_;
$self = new AdFreeZoneUI::Page($subheading, $title, $help);
$self->{'in'} = $in;
$self->add_message($message);
my $form = new AdFreeZoneUI::Form($cgi, "get");
$form->set_input($in);
$self->add_form($form);
foreach my $i (keys %$in) {
	foreach my $v (split(/\0/, $in->{$i})) {
		$form->add_hidden($i, $v);
		}
	}
$form->add_button(new AdFreeZoneUI::Submit($ok || "OK", "ui_confirm"));
$form->add_button(new AdFreeZoneUI::Submit($cancel || $text{'cancel'}, "ui_cancel"));
bless($self);
return $self;
}

sub get_confirm
{
my ($self) = @_;
return $self->{'in'}->{'ui_confirm'} ? 1 : 0;
}

sub get_cancel
{
my ($self) = @_;
return $self->{'in'}->{'ui_cancel'} ? 1 : 0;
}

1;

