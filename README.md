# bash_scripting

## running a script
Difference between running a .sh file with "sh" and "./" depends on how the shell is invoked and the impact on script execution.  
"sh" explicitly runs script in the sh shell - doesn't necessarily respect shebang at the top of the script.  
"sh" often a link to Bourne shell or Dash. Could encounter issues if there are bash-specific features present.  
"./" respects the shebang at the top of the script. Tells the OS which interpreter to use (Bath, Python, etc).  
"./" requires the script to be executable in order to run.  