use Module::Build;
Module::Build->new(
   module_name => 'Pod::FromActionscript',
   license => 'perl',
   build_requires => {
      'Test::More'               => 0,
   },
   script_files => ["script/asdoc2pod"],
)->create_build_script;
