defmodule Psglx.Commands.Disposable do
  @moduledoc false

  @behaviour Psglx.Command

  alias Psglx.{Command, Utils.InteractionResponse, Disposable}

  @impl Command
  def spec(name) do
    %{
      name: name,
      description: "Check emails",
      options: [
        %{
          type: 3,
          name: "email",
          description: "Enter an email",
          required: true
        }
      ]
    }
  end

  @impl Command
  def handle_interaction(interaction) do
    %{value: email} = Command.get_option(interaction, "email")

    case Disposable.disposable(email) do
      true ->
        InteractionResponse.send_ephemeral(interaction, "⚠️ | \`#{email}`\ is disposable")

      false ->
        InteractionResponse.send_ephemeral(interaction, "✅ | \`#{email}`\ is not disposable")
    end
  end
end
