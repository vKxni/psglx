defmodule Psglx.Commands.Ping do
  @moduledoc false

  @behaviour Psglx.Command

  alias Nostrum.Api
  alias Psglx.Command

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "A simple bot check"
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{content: "Pong!"}
    })
  end
end
