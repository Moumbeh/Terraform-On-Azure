# Passing input variables ####
- via comandline promt -var "application_name=curry"
- tfvars file called terraform.tfvars
- auto.tfvars file  any.auto.tfvars (can be call anything) follow by the prefix
- environment spicifile file var-file="filepath" = -var-file ./env/dev.tfvars

# Variable types
- string
- number
- bool

### variable collection types
- list (list of string can have duplicates as they are identified by their index)
- map (key value pair)
- set (unordered list of unique string, terraform will dedupe any duplicates cant pick and choose from the strings as with list)
- object (complex object that catches all types)

### input validation
- you can play with logic, numbers 

# commenting your code
// add comments
-# add comments
/* multiple lines */

# terraform workspaces
- terraform workspace list (the one with the asterisk is the active workspace)
- terraform workspace new prod
- terraform workspace select default (return back to the default(dev) workspace)
- make sure you are running the correct tfvars file for the right environment and correct workspace

# list and count
- count takes the agument of a number e.g 4 and it starts counting from zero e.g count = 4
- if you order 4 instance of a resource the index will be 0,1,2,3 always N - 1
- rather than passing a number you can pass the number of strings in a list using the length function e.g count = length(var.regions)

# Map and Foreach
- foreach just like count interate through a map of object referencde the key
- if you have a library of object "uksouth" = 4 it will reference the uksouth which is the key to create the resource
- Bare in mmind this is the simplest form of its usage we will look at more complex advance usage in future lab

# Booleans and IF conditions
- we use booleans and conditional statements to turn on or off resources provisioning
- you use count meta aguement or a combination of both count and boolean aguements
- count = var.enabled ? 1 : 0 (turnary operation) condition ? consequent : alternative

# Modules
- its a logical grouping of resources package together as one component

# terraform console
- opens an interactive cli where you can evaluate expressions, inspect variables, test functions and read your state file
- terraform console (opens the console in the currentg directory and load the configurations)
- terraform console -workspace=dev (load state and variables for the given worspace)
- terraform console -var-file="prod.tfvars"
- {foo =1, bar = 2}["bar"] = (will result to 2 at the bottom)
- var.application_name
- random_string.prefix

# terraform commands
- terraform show (use to provide human human readable output from a state or plan file)
- terraform refresh (reconcile local state file with the real world statusof the resources Terraform already know)