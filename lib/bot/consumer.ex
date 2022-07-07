defmodule Psglx.Consumer do
  use Nostrum.Consumer
  use Bitwise

  @moduledoc """

  This is the "hearth" of the client (our bot) and is responsible for
  connecting to the APi.

  Here we also handle the events (READY + INTERACTION_CREATE) that are necessary for commands

  Oh, and we use GenServers and Supervisors, of course ...

  """

  alias Psglx.Commands
  require Logger

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  # once the bot goes online, register the bots commands
  def handle_event({:READY, ready_data, _ws_state}) do
    Commands.register_commands()
    Logger.info("#{__MODULE__} starting ...")
    Logger.info("Logged in as #{ready_data.user.username}##{ready_data.user.discriminator}")

    # Update the bot status, (online, dnd, idle, offline)
    Nostrum.Api.update_status(:dnd, "Supervising")
  end

  # handle the interactions (slash comands)
  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}) do
    Commands.handle_interaction(interaction)
  end

  def handle_event(_data) do
    :ok
  end
end
