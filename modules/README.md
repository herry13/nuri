This directory contains the modules that control your resources. Each directory contains a module. You can add your own module by creating a new directory and required files.

There are two types of module:
  1. Native module - a module that is implemented in Ruby; it has two main files:
    - `<module-name>.sfp` - contains the model of the resource in SFP language,
    - `<module-name>.rb` - the implementation in Ruby.
  2. Non-native module - a module that is implemented in other language (e.g. `pyfile`); it has two main files:
    - `<module-name>.sfp` - contains the model of the resource in SFP language,
    - `main` - the implementation in any programming language (must be executable through console).
    
You can put any necessary file to the directory. All files of the module's directory will be automatically pushed to the target agent by Nuri during deployment. Nuri will intelligently check any changes, and push the latest version.
