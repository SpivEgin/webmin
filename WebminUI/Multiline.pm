package AdFreeZoneUI::Multiline;
use AdFreeZoneUI::Textarea;
use AdFreeZoneCore;
@ISA = ( "AdFreeZoneUI::Textarea" );

=head2 new AdFreeZoneUI::Multiline(name, &lines, rows, cols, [disabled])
Create a new input for entering multiple text entries. By default, just uses
a textbox
=cut
sub new
{
if (defined(&AdFreeZoneUI::Theme::Multiline::new)) {
        return new AdFreeZoneUI::Theme::Multiline(@_[1..$#_]);
        }
my ($self, $name, $lines, $rows, $cols, $wrap, $disabled) = @_;
$self = new AdFreeZoneUI::Textarea($name, join("\n", @$lines), $rows, $cols, undef, $disabled);
bless($self);
return $self;
}

=head2 set_lines(&lines)
Sets the lines to display
=cut
sub set_lines
{
my ($self, $lines) = @_;
$self->set_value(join("\n", @$lines));
}

=head2 get_lines()
Returns an array ref of lines to display
=cut
sub get_lines
{
my ($self) = @_;
return [ split(/[\r|\n]+/, $self->get_value()) ];
}

1;

