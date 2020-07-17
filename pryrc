if defined?(PryByebug)
  Pry.commands.alias_command 'st', 'step'
  Pry.commands.alias_command 'ne', 'next'
  Pry.commands.alias_command 'fi', 'finish'
  Pry.commands.alias_command 'co', 'continue'
  Pry.commands.alias_command 'stop', 'exit-program'
  Pry.commands.alias_command 'he', 'help'
end
