#use Module::Name::Actions;
grammar Legal-Module-Name {
  token TOP { 
    
	# identifier followed by zero or more separator identifier pairs
    ^ <identifier> [<separator><identifier>] ** 0..* $
  }
  
  token identifier  {
    # leading alpha or _ only
    <[A..Za..z_]>
    <[A..Za..z0..9]> ** 0..*
  } 
  
  token separator  {
    '::' # colon pairs
  }
}

class Module::Name::Actions {
  method TOP($/)
  { make $/.values.ast ~ '-----';
    if $<identifier>.elems > 5
    {
      warn 'Module name has a lot of identifiers, consider simplifying the name';
    }
  }
}

my $proposed_module_name = 'Superoooo::Newoooo::Moduleooooooooooo';

my $actions = Module::Name::Actions.new(); 
my $match_obj = Legal-Module-Name.parse($proposed_module_name, :actions($actions));

say $match_obj.Str;
