defmodule Psglx.Commands.Ping do
  @moduledoc false

  @behaviour Psglx.Command

  alias Psglx.{Command, Utils.InteractionResponse}

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "A simple bot check"
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    InteractionResponse.send_ephemeral(interaction, "Pong!")
  end
end
