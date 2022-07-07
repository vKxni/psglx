defmodule Psglx.Commands do
  @doc """
  Handling and routing for commands and interactions.
  """

  # Add your commands here. The command name will be passed as an argument to
  # your command's `spec/1` function, so you can see all of the command names
  # here and ensure they don't collide.
  @commands %{
    "ping" => Psglx.Commands.Ping,
    "random" => Psglx.Commands.Random,
    "goodmorning" => Psglx.Commands.Morning,
    "goodnight" => Psglx.Commands.Night,
    "intro" => Psglx.Commands.Intro,
    "say" => Psglx.Commands.Say
  }

  @command_names for {name, _} <- @commands, do: name

  def register_commands() do
    commands = for {name, command} <- @commands, do: command.spec(name)

    # Global application commands take a couple of minutes to update in Discord,
    # so we use a test guild when in dev mode.
    if Application.get_env(:psglx, :env) == :dev do
      guild_id = Application.get_env(:psglx, :GUILD_ID)
      Nostrum.Api.bulk_overwrite_guild_application_commands(guild_id, commands)
    else
      Nostrum.Api.bulk_overwrite_global_application_commands(commands)
    end
  end

  def handle_interaction(interaction) do
    if interaction.data.name in @command_names do
      @commands[interaction.data.name].handle_interaction(interaction)
    else
      :ok
    end
  end
end
