defmodule Psglx.Commands.Say do
  @moduledoc false

  @behaviour Psglx.Command

  alias Nostrum.Api
  alias Psglx.{Command, Utils.InteractionResponse}

  use Bitwise

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Echo'ing your words",
      options: [
        %{
          type: 3,
          name: "string",
          description: "What do you want me to say?",
          required: true
        }
      ]
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    %{value: name} = Command.get_option(interaction, "string")

    # Here we reply to the interaction to avoid the "did not respond" error
    InteractionResponse.send_ephemeral(interaction, "Ok!")

    # Send the message as a direct message into the channel (no reply to the interaction)
    Api.create_message(interaction.channel_id, %{
      content: name
    })
  end
end
