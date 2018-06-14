package AdFreeZoneUI::JavascriptButton;
use AdFreeZoneUI::Input;
use WebminCore;
@ISA = ( "AdFreeZoneUI::Input" );

=head2 new AdFreeZoneUI::JavascriptButton(label, script, [disabled])
Create a button that runs some Javascript when clicked
=cut
sub new
{
if (defined(&AdFreeZoneUI::Theme::JavascriptButton::new) &&
    caller() !~ /AdFreeZoneUI::Theme::JavascriptButton/) {
        return new AdFreeZoneUI::Theme::JavascriptButton(@_[1..$#_]);
        }
my ($self, $value, $script, $disabled) = @_;
$self = { };
bless($self);
$self->set_value($value);
$self->set_script($script);
$self->set_disabled($disabled) if ($disabled);
return $self;
}

=head2 html()
Returns the HTML for this text input
=cut
sub html
{
my ($self) = @_;
return "<input type=button value=\"".&quote_escape($self->get_value())."\" ".
       "onClick=\"".$self->get_script()."\">";
}

sub set_script
{
my ($self, $script) = @_;
$self->{'script'} = $script;
}

sub get_script
{
my ($self) = @_;
return $self->{'script'};
}

1;

