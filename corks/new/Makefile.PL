use ExtUtils::MakeMaker;
$cwd = `pwd`;
chomp $cwd;


# Find the pdlcore.h and pdl.h include files 
@inc = ();
{

  local $_;
  incfoo:foreach(@INC) {
    $dir = "$_/PDL/Core";
    if(-e "$dir/pdl.h"){  # pdlcore.h should be in the same place as pdl.h
      push(@inc,$dir);
      last incfoo;
    }
  }
}


WriteMakefile( NAME=>'Corks',
	       DIR => [],
	       INC=>"-I$cwd ".join(" ",map { "-I$_"} @inc),
	       OBJECT=>'$(BASEEXT)$(OBJ_EXT)'
    );
